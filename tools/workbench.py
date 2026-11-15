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
import re
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



TEXT_EXTENSIONS = {
    ".txt", ".md", ".markdown", ".rst", ".csv", ".tsv", ".json",
    ".jsonl", ".yaml", ".yml", ".toml", ".ini", ".cfg", ".xml",
}
SKIP_DIRS = {".git", ".github", "__pycache__", ".venv", "node_modules"}


def discover(target: str, out: Path, extensions: list[str] | None = None,
             max_files: int = 5000) -> dict:
    source = safe_relative(target)
    if not source.is_dir():
        raise ValueError("discover target must be a directory")
    allowed = {e.lower() if e.startswith(".") else "." + e.lower()
               for e in (extensions or sorted(TEXT_EXTENSIONS))}
    rows = []
    skipped = 0
    for path in sorted(source.rglob("*")):
        if any(part in SKIP_DIRS for part in path.parts):
            continue
        if not path.is_file() or path.suffix.lower() not in allowed:
            continue
        if path.stat().st_size > 25 * 1024 * 1024:
            skipped += 1
            continue
        rows.append({
            "path": path.relative_to(ROOT).as_posix(),
            "bytes": path.stat().st_size,
            "extension": path.suffix.lower(),
        })
        if len(rows) >= max_files:
            break
    result = {
        "command": "discover", "target": target, "created_at": utc_now(),
        "extensions": sorted(allowed), "files_observed": len(rows),
        "file_limit": max_files, "truncated": len(rows) >= max_files,
        "oversized_skipped": skipped, "files": rows,
    }
    out.mkdir(parents=True, exist_ok=True)
    (out / "discovery.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    (out / "discovery.txt").write_text("\n".join(row["path"] for row in rows) + "\n", encoding="utf-8")
    return result


def text_leaves(value: object):
    if isinstance(value, str):
        yield value
    elif isinstance(value, list):
        for item in value:
            yield from text_leaves(item)
    elif isinstance(value, dict):
        for item in value.values():
            yield from text_leaves(item)


def extract_text(target: str, out: Path, min_chars: int = 24,
                 max_files: int = 1000, max_fragments: int = 20000) -> dict:
    source = safe_relative(target)
    if not source.is_dir():
        raise ValueError("extract-text target must be a directory")
    if not 1 <= min_chars <= 1000:
        raise ValueError("min_chars must be between 1 and 1000")
    records = []
    files_seen = 0
    errors = []
    for path in sorted(source.rglob("*")):
        if any(part in SKIP_DIRS for part in path.parts):
            continue
        if not path.is_file() or path.suffix.lower() not in TEXT_EXTENSIONS:
            continue
        if files_seen >= max_files or len(records) >= max_fragments:
            break
        if path.stat().st_size > 5 * 1024 * 1024:
            continue
        files_seen += 1
        try:
            raw = path.read_text(encoding="utf-8-sig")
            if path.suffix.lower() == ".json":
                try:
                    values = list(text_leaves(json.loads(raw)))
                except (json.JSONDecodeError, RecursionError):
                    values = [raw]
            else:
                values = [raw]
            for value in values:
                blocks = [re.sub(r"[ \t]+", " ", b).strip()
                          for b in re.split(r"\n\s*\n+", value)]
                for block in blocks:
                    if len(block) < min_chars:
                        continue
                    records.append({
                        "fragment_id": hashlib.sha256(
                            (path.relative_to(ROOT).as_posix() + "\n" + block).encode("utf-8")
                        ).hexdigest()[:16],
                        "source": path.relative_to(ROOT).as_posix(),
                        "characters": len(block),
                        "text": block,
                    })
                    if len(records) >= max_fragments:
                        break
        except (OSError, UnicodeError, ValueError) as exc:
            errors.append({"path": path.relative_to(ROOT).as_posix(), "error": str(exc)})
    out.mkdir(parents=True, exist_ok=True)
    jsonl = "".join(json.dumps(row, ensure_ascii=False) + "\n" for row in records)
    (out / "fragments.jsonl").write_text(jsonl, encoding="utf-8")
    (out / "fragments.txt").write_text(
        "\n\n".join(f"[{r['source']} | {r['fragment_id']}]\n{r['text']}" for r in records) + "\n",
        encoding="utf-8",
    )
    result = {
        "command": "extract-text", "target": target, "created_at": utc_now(),
        "files_read": files_seen, "fragments": len(records),
        "min_chars": min_chars, "max_files": max_files,
        "max_fragments": max_fragments, "truncated": len(records) >= max_fragments,
        "errors": errors,
    }
    (out / "extraction_manifest.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return result


def transform_fragments(payload: dict, out: Path) -> dict:
    source = safe_relative(payload.get("input", ""))
    if not source.is_file():
        raise ValueError("transform input must be a file")
    if source.suffix.lower() == ".jsonl":
        rows = [json.loads(line) for line in source.read_text(encoding="utf-8").splitlines() if line.strip()]
        fragments = [str(row.get("text", "")) for row in rows]
    else:
        fragments = [x.strip() for x in re.split(r"\n\s*\n+", source.read_text(encoding="utf-8")) if x.strip()]
    steps = payload.get("steps", [])
    if not isinstance(steps, list) or len(steps) > 20:
        raise ValueError("steps must be a list of at most 20 operations")
    rng = random.Random(payload.get("seed"))
    for step in steps:
        if not isinstance(step, dict):
            raise ValueError("each transform step must be an object")
        op = step.get("op")
        if op == "deduplicate":
            seen = set()
            fragments = [x for x in fragments if not (x in seen or seen.add(x))]
        elif op == "normalize_whitespace":
            fragments = [re.sub(r"[ \t]+", " ", re.sub(r"\n{3,}", "\n\n", x)).strip() for x in fragments]
        elif op == "shuffle":
            rng.shuffle(fragments)
        elif op == "reverse_order":
            fragments.reverse()
        elif op == "replace":
            old, new = str(step.get("old", "")), str(step.get("new", ""))
            if not old:
                raise ValueError("replace requires a non-empty old value")
            fragments = [x.replace(old, new) for x in fragments]
        elif op == "prefix":
            fragments = [str(step.get("text", "")) + x for x in fragments]
        elif op == "suffix":
            fragments = [x + str(step.get("text", "")) for x in fragments]
        elif op == "filter_min_chars":
            limit = int(step.get("value", 1))
            fragments = [x for x in fragments if len(x) >= limit]
        elif op == "sample":
            count = int(step.get("value", 1))
            if count < 1 or count > 10000:
                raise ValueError("sample value must be between 1 and 10000")
            fragments = rng.sample(fragments, min(count, len(fragments)))
        else:
            raise ValueError(f"unsupported transform operation: {op}")
    out.mkdir(parents=True, exist_ok=True)
    (out / "transformed.txt").write_text("\n\n".join(fragments) + "\n", encoding="utf-8")
    (out / "transformed.json").write_text(json.dumps({
        "input": payload["input"], "seed": payload.get("seed"),
        "steps": steps, "fragment_count": len(fragments),
        "fragments": fragments,
    }, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return {"command": "transform", "input": payload["input"],
            "steps": steps, "fragment_count": len(fragments)}


def assemble(payload: dict, out: Path) -> dict:
    sections = payload.get("sections")
    if not isinstance(sections, list) or not sections or len(sections) > 100:
        raise ValueError("assemble requires 1 to 100 sections")
    rendered = []
    manifest = []
    for section in sections:
        if not isinstance(section, dict) or "path" not in section:
            raise ValueError("each section requires a path")
        path = safe_relative(str(section["path"]))
        if not path.is_file():
            raise ValueError(f"section is not a file: {section['path']}")
        content = path.read_text(encoding="utf-8-sig")
        title = str(section.get("title") or path.stem)
        rendered.append(f"## {title}\n\n{content.strip()}")
        manifest.append({"title": title, "path": path.relative_to(ROOT).as_posix(),
                         "characters": len(content)})
    out.mkdir(parents=True, exist_ok=True)
    (out / "assembled.md").write_text("\n\n".join(rendered) + "\n", encoding="utf-8")
    result = {"command": "assemble", "sections": manifest,
              "total_characters": sum(x["characters"] for x in manifest)}
    (out / "assembly_manifest.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return result

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
    if payload.get("command") not in {"inventory", "hopper-trial", "discover", "extract-text", "transform", "assemble"}:
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
        elif request["command"] == "hopper-trial":
            result = hopper_trial(request, out)
        elif request["command"] == "discover":
            result = discover(str(request.get("target", "corpus")), out, request.get("extensions"), int(request.get("max_files", 5000)))
        elif request["command"] == "extract-text":
            result = extract_text(str(request.get("target", "corpus")), out, int(request.get("min_chars", 24)), int(request.get("max_files", 1000)), int(request.get("max_fragments", 20000)))
        elif request["command"] == "transform":
            result = transform_fragments(request, out)
        elif request["command"] == "assemble":
            result = assemble(request, out)
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
