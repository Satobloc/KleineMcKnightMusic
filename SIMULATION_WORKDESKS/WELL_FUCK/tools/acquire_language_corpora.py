#!/usr/bin/env python3
"""Acquire and verify approved language-corpus archives.

Usage:
  python SIMULATION_WORKDESKS/WELL_FUCK/tools/acquire_language_corpora.py \
      --manifest SIMULATION_WORKDESKS/WELL_FUCK/data/corpora/source_manifest.json \
      --out SIMULATION_WORKDESKS/WELL_FUCK/data/corpora/incoming

This utility downloads only entries explicitly marked approved_for_download.
It preserves archives, verifies byte count and SHA-256, and writes a report.
It never extracts, transforms, or commits source text.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import sys
import urllib.error
import urllib.request
from pathlib import Path
from typing import Any

CHUNK = 1024 * 1024
UA = "WellFuck-CorpusAcquisition/0.2 (+https://github.com/Satobloc/KleineMcKnightMusic)"


def digest_file(path: Path) -> tuple[int, str]:
    h = hashlib.sha256()
    n = 0
    with path.open("rb") as f:
        for block in iter(lambda: f.read(CHUNK), b""):
            n += len(block)
            h.update(block)
    return n, h.hexdigest()


def fetch_one(item: dict[str, Any], out: Path, timeout: int) -> dict[str, Any]:
    name = str(item["filename"])
    url = str(item["url"])
    expected_size = item.get("expected_bytes")
    expected_hash = item.get("sha256")
    target = out / name
    partial = out / (name + ".part")
    if target.exists():
        actual_size, actual_hash = digest_file(target)
        if (expected_size is None or actual_size == expected_size) and (
            expected_hash is None or actual_hash == expected_hash
        ):
            return {"id": item["id"], "status": "already_verified", "filename": name,
                    "bytes": actual_size, "sha256": actual_hash}
        target.rename(out / (name + ".previous-unverified"))

    request = urllib.request.Request(url, headers={"User-Agent": UA})
    try:
        with urllib.request.urlopen(request, timeout=timeout) as response, partial.open("wb") as dst:
            final_url = response.geturl()
            content_type = response.headers.get("Content-Type", "")
            if "text/html" in content_type.lower():
                raise ValueError(f"Unexpected HTML response for archive: {content_type}")
            while True:
                block = response.read(CHUNK)
                if not block:
                    break
                dst.write(block)
    except Exception as exc:
        partial.unlink(missing_ok=True)
        return {"id": item["id"], "status": "download_failed", "filename": name,
                "error": f"{type(exc).__name__}: {exc}"}

    actual_size, actual_hash = digest_file(partial)
    if expected_size is not None and actual_size != int(expected_size):
        partial.unlink(missing_ok=True)
        return {"id": item["id"], "status": "size_mismatch", "filename": name,
                "expected_bytes": expected_size, "actual_bytes": actual_size}
    if expected_hash is not None and actual_hash.lower() != str(expected_hash).lower():
        partial.unlink(missing_ok=True)
        return {"id": item["id"], "status": "sha256_mismatch", "filename": name,
                "expected_sha256": expected_hash, "actual_sha256": actual_hash}
    partial.replace(target)
    return {"id": item["id"], "status": "downloaded_verified" if expected_hash else "downloaded_hash_computed",
            "filename": name, "bytes": actual_size, "sha256": actual_hash,
            "final_url": final_url, "content_type": content_type}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--timeout", type=int, default=90)
    args = parser.parse_args()

    manifest = json.loads(args.manifest.read_text(encoding="utf-8"))
    assets = [x for x in manifest["assets"] if x.get("approved_for_download") is True]
    if not assets:
        parser.error("No assets are marked approved_for_download in the manifest.")
    args.out.mkdir(parents=True, exist_ok=True)
    results = [fetch_one(x, args.out, args.timeout) for x in assets]
    report = {
        "schema": "well-fuck-corpus-acquisition-report-v1",
        "manifest": str(args.manifest),
        "results": results,
    }
    report_path = args.out / "acquisition-report.json"
    report_path.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, indent=2))
    return 0 if all(x["status"] in {"already_verified", "downloaded_verified", "downloaded_hash_computed"} for x in results) else 1


if __name__ == "__main__":
    raise SystemExit(main())
