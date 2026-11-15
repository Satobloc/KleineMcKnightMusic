#!/usr/bin/env python3
"""Randomly compile Suno lyrics/style prompts from every corpus hopper.

The compiler treats each immediate subdirectory of corpus/ as a hopper, walks
it recursively, extracts text-bearing fragments, and routes each random pull
to Lyrics or Styles with hopper-specific (but deliberately non-exclusive)
biases. Binary media are not embedded; text sidecars and descriptive metadata
are eligible. Outputs are local working artifacts, not repository additions.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
import random
import re
import sys
from collections import defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Iterator

TEXT_EXTENSIONS = {
    ".txt", ".md", ".markdown", ".csv", ".tsv", ".json", ".jsonl",
    ".yaml", ".yml", ".toml", ".ini", ".cfg", ".xml", ".html", ".htm",
    ".rst", ".log",
}
SKIP_NAMES = {
    ".ds_store", "thumbs.db", "desktop.ini",
}
MAX_FILE_BYTES = 25 * 1024 * 1024

# Probability that a pull from a hopper goes to Styles. The complement goes
# to Lyrics. No hopper is exclusive to either destination.
STYLE_BIAS = {
    "genre_hopper": 0.84,
    "structure_hopper": 0.84,
    "prompt_hopper": 0.34,
    "prompt_examples_hopper": 0.38,
    "lyrics_hopper": 0.12,
    "writing_voice": 0.16,
    "others_writing": 0.18,
    "grab_bag": 0.35,
    "product_hopper": 0.28,
    "community_hopper": 0.42,
    "research_hopper": 0.50,
    "source_hopper": 0.50,
    "audio_case_hopper": 0.55,
    "sample_hopper": 0.58,
    "sonic_pi": 0.65,
    "tooling_hopper": 0.55,
}


@dataclass(frozen=True)
class Fragment:
    text: str
    hopper: str
    source: str


def clean_fragment(value: str) -> str:
    """Remove outer whitespace while preserving meaningful internal layout."""
    value = value.replace("\r\n", "\n").replace("\r", "\n")
    value = re.sub(r"[ \t]+\n", "\n", value)
    return value.strip()


def json_strings(value: object) -> Iterator[str]:
    """Yield string leaves from JSON without serializing structural keys."""
    if isinstance(value, str):
        yield value
    elif isinstance(value, list):
        for item in value:
            yield from json_strings(item)
    elif isinstance(value, dict):
        for item in value.values():
            yield from json_strings(item)


def split_text(text: str, suffix: str) -> list[str]:
    """Extract plausible independent pulls from a text-bearing file."""
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    if suffix == ".json":
        try:
            parsed = json.loads(text)
        except (json.JSONDecodeError, RecursionError):
            pass
        else:
            pieces = []
            for item in json_strings(parsed):
                pieces.extend(split_text(item, ".txt"))
            return pieces

    if suffix in {".csv", ".tsv"}:
        delimiter = "\t" if suffix == ".tsv" else ","
        try:
            rows = csv.reader(text.splitlines(), delimiter=delimiter)
            pieces = [" | ".join(cell.strip() for cell in row if cell.strip())
                      for row in rows]
            return [p for p in pieces if p]
        except csv.Error:
            pass

    # Blank-line-separated blocks retain internal lineation, useful for lyrics.
    blocks = re.split(r"\n\s*\n+", text)
    pieces: list[str] = []
    for block in blocks:
        block = clean_fragment(block)
        if not block:
            continue
        # Avoid one huge document swallowing an entire prompt. Prefer line
        # boundaries; only hard-split when a single line is itself enormous.
        if len(block) > 2400:
            lines = [clean_fragment(line) for line in block.split("\n")]
            lines = [line for line in lines if line]
            current = ""
            for line in lines:
                if len(line) > 2400:
                    if current:
                        pieces.append(current)
                        current = ""
                    pieces.extend(line[i:i + 1800] for i in range(0, len(line), 1800))
                elif current and len(current) + len(line) + 1 > 1800:
                    pieces.append(current)
                    current = line
                else:
                    current = f"{current}\n{line}" if current else line
            if current:
                pieces.append(current)
        else:
            pieces.append(block)
    return pieces


def load_hoppers(\n    corpus: Path,\n    include_hoppers: set[str] | None = None,\n) -> dict[str, list[Fragment]]:
    if not corpus.is_dir():
        raise SystemExit(f"Corpus directory not found: {corpus}")

    hoppers: dict[str, list[Fragment]] = {}
    hopper_dirs = sorted(\n        p for p in corpus.iterdir()\n        if p.is_dir() and (include_hoppers is None or p.name in include_hoppers)\n    )
    if not hopper_dirs:
        raise SystemExit(f"No hopper directories found under: {corpus}")

    for hopper_dir in hopper_dirs:
        name = hopper_dir.name
        found: list[Fragment] = []
        for path in sorted(hopper_dir.rglob("*")):
            if not path.is_file() or path.name.lower() in SKIP_NAMES:
                continue
            if path.suffix.lower() not in TEXT_EXTENSIONS:
                # Binary assets cannot be inserted as text, but their filenames
                # are useful descriptive seeds (especially in Sample_Hopper).
                label = re.sub(r"[_-]+", " ", path.stem).strip()
                if label:
                    found.append(Fragment(label, name, path.relative_to(corpus).as_posix()))
                continue
            try:
                if path.stat().st_size > MAX_FILE_BYTES:
                    print(f"SKIP oversized: {path}", file=sys.stderr)
                    continue
                raw = path.read_text(encoding="utf-8-sig")
            except (OSError, UnicodeError) as exc:
                print(f"SKIP unreadable {path}: {exc}", file=sys.stderr)
                continue

            for piece in split_text(raw, path.suffix.lower()):
                piece = clean_fragment(piece)
                if piece:
                    found.append(Fragment(piece, name, path.relative_to(corpus).as_posix()))
        if found:
            hoppers[name] = found
    return hoppers


def style_probability(hopper: str) -> float:
    return STYLE_BIAS.get(hopper.lower(), 0.50)


def compile_both(
    hoppers: dict[str, list[Fragment]],
    lyrics_chars: int,
    styles_chars: int,
    rng: random.Random,
) -> tuple[str, list[dict[str, str]], str, list[dict[str, str]]]:
    """One shared draw stream, so each source fragment can enter only once."""
    pools = {name: list(items) for name, items in hoppers.items()}
    for items in pools.values():
        rng.shuffle(items)

    outputs = {"lyrics": "", "styles": ""}
    manifests: dict[str, list[dict[str, str]]] = {"lyrics": [], "styles": []}
    limits = {"lyrics": lyrics_chars, "styles": styles_chars}
    seen: set[str] = set()

    # Route each fragment according to its hopper bias; when that field is
    # full, spill into the other field if it still has room.
    while any(len(outputs[k]) < limits[k] for k in outputs):
        available = [name for name, items in pools.items() if items]
        if not available:
            break
        hopper = rng.choice(available)
        fragment = pools[hopper].pop()
        fingerprint = hashlib.sha256(fragment.text.encode("utf-8")).hexdigest()
        if fingerprint in seen:
            continue
        seen.add(fingerprint)

        p_styles = style_probability(hopper)
        destination = "styles" if rng.random() < p_styles else "lyrics"
        other = "lyrics" if destination == "styles" else "styles"
        if len(outputs[destination]) >= limits[destination]:
            destination = other
        if len(outputs[destination]) >= limits[destination]:
            # The selected route is full. Leave this fragment unused.
            continue

        current = outputs[destination]
        divider = ".\n" if current else ""
        remaining = limits[destination] - len(current) - len(divider)
        if remaining <= 0:
            continue
        used = fragment.text[:remaining].rstrip()
        if not used:
            continue
        outputs[destination] = current + divider + used
        manifests[destination].append({
            "hopper": fragment.hopper,
            "source": fragment.source,
            "characters_used": str(len(used)),
            "truncated": str(len(used) < len(fragment.text)).lower(),
        })
    return (
        outputs["lyrics"], manifests["lyrics"],
        outputs["styles"], manifests["styles"],
    )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Randomly compile lyrics and styles prompts from all corpus hoppers."
    )
    parser.add_argument("--corpus", type=Path, default=Path("corpus"),
                        help="Corpus root containing hopper subdirectories (default: ./corpus)")
    parser.add_argument("--out", type=Path, default=Path("hopper_pulls"),
                        help="Local output directory (default: ./hopper_pulls)")
    parser.add_argument("--lyrics-chars", type=int, default=5000)
    parser.add_argument("--styles-chars", type=int, default=1000)
    parser.add_argument("--seed", type=int, default=None,
                        help="Optional integer seed for reproducible pulls")
    args = parser.parse_args()

    if args.lyrics_chars < 1 or args.styles_chars < 1:
        raise SystemExit("Character limits must be positive integers.")

    rng = random.Random(args.seed)
    include_hoppers = (\n        {name.strip() for name in args.include_hoppers.split(",") if name.strip()}\n        if args.include_hoppers else None\n    )\n    hoppers = load_hoppers(args.corpus, include_hoppers)
    if not hoppers:
        raise SystemExit("No eligible text fragments found in any hopper.")

    lyrics, lyrics_manifest, styles, styles_manifest = compile_both(
        hoppers, args.lyrics_chars, args.styles_chars, rng
    )
    args.out.mkdir(parents=True, exist_ok=True)
    (args.out / "lyrics_pull.txt").write_text(lyrics, encoding="utf-8")
    (args.out / "styles_pull.txt").write_text(styles, encoding="utf-8")

    manifest = {
        "compiler": "random_hopper_compiler.py",
        "seed": args.seed,
        "corpus": str(args.corpus),
        "hopper_count": len(hoppers),
        "fragment_count": sum(len(items) for items in hoppers.values()),
        "hoppers_loaded": {name: len(items) for name, items in sorted(hoppers.items())},
        "lyrics": {
            "target_characters": args.lyrics_chars,
            "actual_characters": len(lyrics),
            "pull_count": len(lyrics_manifest),
            "pulls": lyrics_manifest,
        },
        "styles": {
            "target_characters": args.styles_chars,
            "actual_characters": len(styles),
            "pull_count": len(styles_manifest),
            "pulls": styles_manifest,
        },
        "routing_note": (
            "Genre and Structure hoppers are strongly Styles-biased; "
            "Lyrics and writing/content hoppers are strongly Lyrics-biased. "
            "All hoppers remain eligible for either field."
        ),
        "divider": ".\\n",
        "text_only_note": (
            "Binary audio/image/video files are not embedded. Their filenames "
            "become short text fragments; text sidecars, captions, and metadata "
            "are also eligible."
        ),
    }
    (args.out / "pull_manifest.json").write_text(
        json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8"
    )

    print(f"Loaded {len(hoppers)} hoppers and {manifest['fragment_count']} fragments.")
    print(f"Lyrics: {len(lyrics)}/{args.lyrics_chars} characters "
          f"from {len(lyrics_manifest)} pulls")
    print(f"Styles: {len(styles)}/{args.styles_chars} characters "
          f"from {len(styles_manifest)} pulls")
    print(f"Outputs: {args.out.resolve()}")
    if len(lyrics) < args.lyrics_chars or len(styles) < args.styles_chars:
        print("WARNING: available material did not fill one or both targets.", file=sys.stderr)


if __name__ == "__main__":
    main()
