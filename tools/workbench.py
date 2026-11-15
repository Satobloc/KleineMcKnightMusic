#!/usr/bin/env python3
"""KMcKM request-driven workbench.

Commands are intentionally small and composable. Inputs are read-only by
default; all generated products go to a run-specific output directory.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import platform
import random
import subprocess
import sys
from collections import Counter
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_OUTPUT = Path("workbench_runs")


def utc_now() -> str:
    return datetime.now(timezone.utc).isoformat()


def safe_relative(value: str, *, must_exist: bool = True) -> Path:
    candidate = (ROOT / value).resolve()
    try:
        candidate.relative_to(ROOT.resolve())
    except ValueError as exc:
        raise ValueError(f"Path escapes repository: {value}") from exc
    if must_exist and not candidate.exists():
        raise FileNotFoundError(value)
    return candidate


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def inventory(target: str, out: Path, max_files: int = 10000) -> dict:
    source = safe_relative(target)
    if not source.is_dir():
        raise ValueError("inventory target must be a directory")
    rows = []
    counts = Counter()
    total_bytes = 0
    for path in sorted(source.rglob("*")):
        if not path.is_file():
            continue
        rel = path.relative_to(ROOT).as_posix()
        size = path.stat().st_size
        counts[path.suffix.lower() or "[no extension]"] += 1
        total_bytes += size
        rows.append({
            "path": rel,
            "bytes": size,
            "extension": path.suffix.lower(),
            "sha256": sha256_file(path) if size <= 5 * 1024 * 1024 else None,
            "hash_skipped_reason": "over 5 MiB" if size > 5 * 1024 * 1024 else None,
        })
        if len(rows) >= max_files:
            break
    out.mkdir(parents=True, exist_ok=True)
    report = {
        "command": "inventory",
        "target": target,
        "created_at": utc_now(),
        "file_count_observed": len(rows),
        "file_limit": max_files,
        "truncated": len(rows) >= max_files,
        "total_bytes_observed": total_bytes,
        "extensions": dict(sorted(counts.items())),
        "files": rows,
        "interpretation": "Structural inventory only; no semantic classification or content claims.",
    }
    (out / "inventory.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    lines = [
        f"# Inventory: {target}", "",
        f"- Files observed: {len(rows)}",
        f"- Bytes observed: {total_bytes}",
        f"- Truncated by file limit: {report['truncated']}",
        "", "## Extensions", "",
    ]
    lines += [f"- `{ext}`: {count}" for ext, count in sorted(counts.items())]
    (out / "inventory.md").write_text("\n".join(lines) + "\n", encoding="utf-8")
    return report


def hopper_trial(payload: dict, out: Path) -> dict:
    compiler = safe_relative("SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1/tools/random_hopper_compiler.py")
    corpus = safe_relative(payload.get("corpus", "corpus"))
    if not corpus.is_dir():
        raise ValueError("corpus must be a directory")
    include = payload.get("include_hoppers")
    if not isinstance(include, list) or not include:
        raise ValueError("include_hoppers must be a non-empty list of exact directory names")
    available = {p.name for p in corpus.iterdir() if p.is_dir()}
    missing = sorted(set(include) - available)
    if missing:
        raise ValueError(f"Unknown hopper names: {', '.join(missing)}")
    lyrics = int(payload.get("lyrics_chars", 1800))
    styles = int(payload.get("styles_chars", 500))
    seed_value = payload.get("seed")
    seed = None if seed_value is None else int(seed_value)
    if not 1 <= lyrics <= 5000 or not 1 <= styles <= 1000:
        raise ValueError("character limits outside allowed range")
    args = [
        sys.executable, str(compiler), "--corpus", str(corpus),
        "--out", str(out / "hopper_pulls"),
        "--lyrics-chars", str(lyrics), "--styles-chars", str(styles),
        "--include-hoppers", ",".join(include),
    ]
    if seed is not None:
        args += ["--seed", str(seed)]
    completed = subprocess.run(args, cwd=ROOT, text=True, capture_output=True, timeout=240)
    (out / "compiler.stdout.txt").write_text(completed.stdout, encoding="utf-8")
    (out / "compiler.stderr.txt").write_text(completed.stderr, encoding="utf-8")
    if completed.returncode:
        raise RuntimeError(f"hopper compiler exited {completed.returncode}; see compiler.stderr.txt")
    manifest_path = out / "hopper_pulls" / "pull_manifest.json"
    if not manifest_path.is_file():
        raise RuntimeError("compiler completed without pull_manifest.json")
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    return {
        "command": "hopper-trial",
        "corpus": payload.get("corpus", "corpus"),
        "include_hoppers": include,
        "seed": seed,
        "lyrics_chars": lyrics,
        "styles_chars": styles,
        "compiler_manifest": manifest,
    }


def load_request(path: Path) -> dict:
    try:
        payload = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise ValueError(f"Cannot read valid JSON request: {exc}") from exc
    if not isinstance(payload, dict):
        raise ValueError("request root must be a JSON object")
    request_id = payload.get("request_id")
    if not isinstance(request_id, str) or not request_id.strip():
        raise ValueError("request_id is required")
    if not all(ch.isalnum() or ch in "-_" for ch in request_id):
        raise ValueError("request_id may contain only letters, digits, hyphens and underscores")
    if payload.get("version") != 1:
        raise ValueError("unsupported request version; expected version=1")
    if payload.get("command") not in {"inventory", "hopper-trial"}:
        raise ValueError("unsupported command; allowed: inventory, hopper-trial")
    return payload


def run_request(request: dict, output_root: Path) -> Path:
    request_id = request["request_id"]
    out = (ROOT / output_root / request_id).resolve()
    out.relative_to(ROOT.resolve())
    if out.exists():
        raise FileExistsError(f"Refusing to overwrite previous run: {out}")
    out.mkdir(parents=True)
    request_bytes = json.dumps(request, ensure_ascii=False, sort_keys=True).encode("utf-8")
    request_sha = hashlib.sha256(request_bytes).hexdigest()
    receipt = {
        "request_id": request_id,
        "request_sha256": request_sha,
        "status": "RUNNING",
        "started_at": utc_now(),
        "repository_commit": os.environ.get("GITHUB_SHA"),
        "python": sys.version,
        "platform": platform.platform(),
    }
    (out / "request.json").write_text(json.dumps(request, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    (out / "receipt.json").write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    try:
        if request["command"] == "inventory":
            result = inventory(str(request.get("target", "corpus")), out, int(request.get("max_files", 10000)))
        else:
            result = hopper_trial(request, out)
        receipt.update({"status": "COMPLETED", "completed_at": utc_now(), "result": result})
        (out / "receipt.json").write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        return out
    except Exception as exc:
        receipt.update({"status": "FAILED", "completed_at": utc_now(), "error_type": type(exc).__name__, "error": str(exc)})
        (out / "receipt.json").write_text(json.dumps(receipt, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        raise


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--request", type=Path, default=Path(".workbench/REQUEST.json"))
    parser.add_argument("--output-root", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    request_path = safe_relative(args.request.as_posix())
    request = load_request(request_path)
    out = run_request(request, args.output_root)
    print(f"WORKBENCH_STATUS=COMPLETED")
    print(f"WORKBENCH_REQUEST_ID={request['request_id']}")
    print(f"WORKBENCH_OUTPUT={out.relative_to(ROOT).as_posix()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
