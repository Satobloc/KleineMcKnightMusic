#!/usr/bin/env python3
"""Download and verify the pinned language-corpus archives for Well, Fuck.

Run from any directory:
  python acquire_language_corpora.py

Files are stored under:
  SIMULATION_WORKDESKS/WELL_FUCK/data/corpora/incoming/

The script verifies the exact size and SHA-256 published by the upstream
ANC migration release. It does not extract archives or redistribute their
contents. Inspect each archive's README and embedded source notices before
using its text in derived datasets or publishing anything.
"""
from __future__ import annotations

import hashlib
import json
import sys
import urllib.error
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data" / "corpora" / "incoming"

ASSETS = [
    {
        "name": "MASC-3.0.0.zip",
        "url": "https://github.com/nancyide/anc-website/releases/download/datasets-2026-09-25/MASC-3.0.0.zip",
        "size": 36_358_521,
        "sha256": "0b300d96016233c7c79b43559b477a6bb0ed16bb416d5c517eccb108a6228493",
        "role": "annotated_baseline",
    },
    {
        "name": "MaiChat-1.0.zip",
        "url": "https://datashare.ed.ac.uk/bitstreams/5e731957-f140-4ce5-b1ed-6877ad3839a7/download",
        "size": None,  # Release size is recorded in dataset page metadata; compute locally.
        "sha256": None,  # Verify against the repository's pinned acquisition record when published.
        "role": "recent_informal_conversation_supplement",
    },
]

CHUNK = 1024 * 1024


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(CHUNK), b""):
            digest.update(block)
    return digest.hexdigest()


def download(asset: dict) -> dict:
    name = asset["name"]
    url = asset["url"]
    target = OUT / name
    partial = target.with_suffix(target.suffix + ".part")

    if target.exists():
        current_hash = sha256_file(target)
        current_size = target.stat().st_size
        expected_hash = asset["sha256"]
        expected_size = asset["size"]
        if (expected_hash is None or current_hash == expected_hash) and (
            expected_size is None or current_size == expected_size
        ):
            return {
                "name": name, "status": "already_present",
                "size": current_size, "sha256": current_hash,
            }
        target.rename(target.with_suffix(target.suffix + ".unverified"))

    request = urllib.request.Request(
        url,
        headers={"User-Agent": "WellFuck-Language-Corpus-Acquisition/1.0"},
    )
    try:
        with urllib.request.urlopen(request, timeout=60) as response, partial.open("wb") as output:
            while True:
                block = response.read(CHUNK)
                if not block:
                    break
                output.write(block)
    except (urllib.error.URLError, TimeoutError, OSError) as exc:
        partial.unlink(missing_ok=True)
        return {"name": name, "status": "download_failed", "error": str(exc)}

    actual_size = partial.stat().st_size
    actual_hash = sha256_file(partial)
    if asset["size"] is not None and actual_size != asset["size"]:
        partial.unlink(missing_ok=True)
        return {
            "name": name, "status": "size_mismatch",
            "expected": asset["size"], "actual": actual_size,
        }
    if asset["sha256"] is not None and actual_hash != asset["sha256"]:
        partial.unlink(missing_ok=True)
        return {
            "name": name, "status": "sha256_mismatch",
            "expected": asset["sha256"], "actual": actual_hash,
        }

    partial.replace(target)
    return {
        "name": name, "status": "downloaded_and_verified" if asset["sha256"] else "downloaded_hash_recorded",
        "size": actual_size, "sha256": actual_hash, "role": asset["role"],
    }


def main() -> int:
    OUT.mkdir(parents=True, exist_ok=True)
    results = [download(asset) for asset in ASSETS]
    report = {
        "operation": "WF-LANG-002",
        "script": str(Path(__file__).name),
        "results": results,
        "note": "MaiChat has no pinned SHA-256 yet; its local hash is recorded but must be reconciled against the official archive metadata before use.",
    }
    report_path = OUT / "acquisition-report.json"
    report_path.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, indent=2))
    return 0 if all(r["status"] in {"downloaded_and_verified", "downloaded_hash_recorded", "already_present"} for r in results) else 1


if __name__ == "__main__":
    raise SystemExit(main())
