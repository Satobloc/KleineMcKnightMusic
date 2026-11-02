#!/usr/bin/env python3
"""Build a private, provenance-preserving analytical index from a Suno export.

Does not download audio, infer ground-truth labels, or publish raw prompts.
"""
from __future__ import annotations
import argparse
import collections
import hashlib
import json
import statistics
from pathlib import Path
from typing import Any


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("--out", type=Path, default=Path("suno_corpus_analysis"))
    args = parser.parse_args()
    if not args.source.is_file():
        raise SystemExit(f"Input does not exist: {args.source}")
    data = json.loads(args.source.read_text(encoding="utf-8"))
    if not isinstance(data, dict) or not isinstance(data.get("clips"), list):
        raise SystemExit("Expected a Suno export object containing a clips array.")

    clips = data["clips"]
    args.out.mkdir(parents=True, exist_ok=True)
    ids = [str(c.get("id")) for c in clips if c.get("id")]
    if len(ids) != len(clips) or len(set(ids)) != len(ids):
        raise SystemExit("Missing or duplicate clip IDs; refusing lossy indexing.")

    def metadata(c: dict[str, Any]) -> dict[str, Any]:
        return c.get("metadata") or {}

    # Exact prompt families: hash privately, never export prompt bodies.
    prompt_groups: dict[str, list[dict[str, Any]]] = collections.defaultdict(list)
    for clip in clips:
        prompt = metadata(clip).get("prompt")
        if isinstance(prompt, str) and prompt.strip():
            prompt_groups[hashlib.sha256(prompt.encode("utf-8")).hexdigest()].append(clip)
    prompt_groups = {key: group for key, group in prompt_groups.items() if len(group) > 1}

    prompt_rows = []
    for prompt_hash, group in prompt_groups.items():
        prompt_rows.append({
            "prompt_sha256": prompt_hash,
            "record_count": len(group),
            "clip_ids": [c["id"] for c in sorted(group, key=lambda x: (x.get("created_at") or "", x["id"]))],
            "titles": list(dict.fromkeys(c.get("title") or "" for c in group)),
            "models": dict(collections.Counter(c.get("major_model_version") or "unspecified" for c in group)),
            "tasks": dict(collections.Counter(metadata(c).get("task") or "unspecified" for c in group)),
            "date_min": min(c.get("created_at") or "" for c in group),
            "date_max": max(c.get("created_at") or "" for c in group),
        })
    prompt_rows.sort(key=lambda row: (-row["record_count"], row["date_min"]))
    (args.out / "prompt_families.json").write_text(
        json.dumps(prompt_rows, ensure_ascii=False, indent=2), encoding="utf-8"
    )

    # Explicit derivation groups; title/time coincidence is not treated as lineage.
    derivation_groups: dict[tuple[str, tuple[str, ...]], list[dict[str, Any]]] = collections.defaultdict(list)
    for clip in clips:
        meta = metadata(clip)
        task = meta.get("task")
        parents = tuple(meta.get("mashup_clip_ids") or [])
        if task or parents:
            derivation_groups[(task or "unspecified", parents)].append(clip)

    derivation_rows = []
    for (task, parents), group in derivation_groups.items():
        derivation_rows.append({
            "task": task,
            "input_clip_ids": list(parents),
            "record_count": len(group),
            "output_clip_ids": [c["id"] for c in sorted(group, key=lambda x: (x.get("created_at") or "", x["id"]))],
            "models": dict(collections.Counter(c.get("major_model_version") or "unspecified" for c in group)),
            "date_min": min(c.get("created_at") or "" for c in group),
            "date_max": max(c.get("created_at") or "" for c in group),
        })
    derivation_rows.sort(key=lambda row: (-row["record_count"], row["task"], row["date_min"]))
    (args.out / "derivation_groups.json").write_text(
        json.dumps(derivation_rows, ensure_ascii=False, indent=2), encoding="utf-8"
    )

    # Sanitized clip index: omit raw prompt, tags, account fields, and media URLs.
    clip_rows = []
    for clip in clips:
        meta = metadata(clip)
        prompt = meta.get("prompt") or ""
        tags = meta.get("tags") or ""
        clip_rows.append({
            "clip_id": clip.get("id"),
            "title": clip.get("title"),
            "created_at": clip.get("created_at"),
            "model_version": clip.get("major_model_version") or None,
            "model_name": clip.get("model_name"),
            "task": meta.get("task") or meta.get("type"),
            "duration_s": meta.get("duration"),
            "has_vocal": meta.get("has_vocal"),
            "make_instrumental": meta.get("make_instrumental"),
            "is_remix": meta.get("is_remix"),
            "has_stem": meta.get("has_stem"),
            "avg_bpm": meta.get("avg_bpm"),
            "min_bpm": meta.get("min_bpm"),
            "max_bpm": meta.get("max_bpm"),
            "key": meta.get("key"),
            "is_liked": clip.get("is_liked"),
            "play_count": clip.get("play_count"),
            "prompt_sha256": hashlib.sha256(prompt.encode("utf-8")).hexdigest() if prompt else None,
            "tags_sha256": hashlib.sha256(tags.encode("utf-8")).hexdigest() if tags else None,
            "parent_clip_ids": meta.get("mashup_clip_ids") or [],
        })
    (args.out / "clip_index.json").write_text(
        json.dumps(clip_rows, ensure_ascii=False, indent=2), encoding="utf-8"
    )

    types = collections.Counter(metadata(c).get("type") or "unspecified" for c in clips)
    models = collections.Counter(c.get("major_model_version") or "unspecified" for c in clips)
    tasks = collections.Counter(metadata(c).get("task") or "unspecified" for c in clips)
    durations = [
        metadata(c).get("duration") for c in clips
        if isinstance(metadata(c).get("duration"), (int, float))
    ]
    fields = [
        "prompt", "tags", "duration", "avg_bpm", "min_bpm", "max_bpm",
        "key", "control_sliders", "has_vocal", "make_instrumental"
    ]
    availability = {
        field: sum(metadata(c).get(field) is not None and metadata(c).get(field) != "" for c in clips)
        for field in fields
    }
    created = sorted(c.get("created_at") for c in clips if c.get("created_at"))
    summary = {
        "source_file": args.source.name,
        "source_sha256": sha256(args.source),
        "exported_at": data.get("exported_at"),
        "completeness": data.get("completeness"),
        "export_observed_counts": {
            key: data.get(key) for key in [
                "direct_song_links_observed", "candidate_ids_checked",
                "feed_pages_observed", "feed_song_ids_observed", "feed_cursor_remaining"
            ]
        },
        "api_warnings": data.get("api_warnings", []),
        "clip_count": len(clips),
        "unique_clip_ids": len(set(ids)),
        "created_at_range": [created[0], created[-1]] if created else None,
        "record_types": dict(types),
        "model_versions": dict(models),
        "task_types": dict(tasks),
        "metadata_availability": availability,
        "duration_seconds": {
            "n": len(durations),
            "min": min(durations) if durations else None,
            "median": statistics.median(durations) if durations else None,
            "mean": statistics.mean(durations) if durations else None,
            "max": max(durations) if durations else None,
        },
        "exact_prompt_families": len(prompt_groups),
        "records_in_exact_prompt_families": sum(map(len, prompt_groups.values())),
        "explicit_derivation_groups": len(derivation_groups),
        "records_in_explicit_derivation_groups": sum(map(len, derivation_groups.values())),
        "interpretation_cautions": [
            "Generated tags are model-produced descriptions, not verified ground truth.",
            "Missing metadata is not evidence of absence.",
            "Identical prompt hashes do not establish controlled generations: model, settings, mode, references, and task may differ.",
            "Title/time matching is not treated as proof of parentage.",
            "The analytical index omits raw prompt text, tags, user identifiers, and audio URLs.",
        ],
    }
    (args.out / "corpus_summary.json").write_text(
        json.dumps(summary, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    (args.out / "README.txt").write_text(
        "Private Suno corpus analysis output.\n\n"
        "Files:\n"
        "- corpus_summary.json: source checksums, coverage and completeness statistics.\n"
        "- clip_index.json: sanitized clip rows, preserving IDs and prompt/tag hashes.\n"
        "- prompt_families.json: exact prompt-hash groups and associated clip IDs.\n"
        "- derivation_groups.json: explicit generation relationships.\n\n"
        "No audio is downloaded. No raw prompt or generated tag text is included. "
        "Do not publish without a separate privacy, rights and provenance review.\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "output_dir": str(args.out.resolve()),
        "clip_count": len(clips),
        "unique_prompt_families": len(prompt_groups),
        "explicit_derivation_groups": len(derivation_groups),
    }, indent=2))


if __name__ == "__main__":
    main()
