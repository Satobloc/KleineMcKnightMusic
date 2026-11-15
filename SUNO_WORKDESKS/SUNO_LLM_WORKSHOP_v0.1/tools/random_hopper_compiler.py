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

# Only user-supplied creative hoppers participate in ordinary pulls.
# Research/documentation hoppers created during assistant-supported repo work
# remain separate and are never included by default.
USER_HOPPERS = {
    "Lyrics_Hopper",
    "Genre_Hopper",
    "Structure_Hopper",
    "Grab_Bag",
    "Sample_Hopper",
    "Sonic_Pi",
    "Prompt_Hopper",
    "Others_Writing",
    "Writing_Voice",
}

ASSISTANT_RESEARCH_HOPPERS = {
    "Audio_Case_Hopper",
    "Community_Hopper",
    "Product_Hopper",
    "Prompt_Examples_Hopper",
    "Research_Hopper",
    "Source_Hopper",
    "Tooling_Hopper",
}

# Probability that a pull from a user hopper goes to Styles. The complement
# goes to Lyrics. No hopper is exclusive to either destination.
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
    encoding: str = "not-applicable"


def decode_text_file(path: Path) -> tuple[str, str]:
    """Decode common text encodings without modifying the source file."""
    raw = path.read_bytes()
    try:
        return raw.decode("utf-8-sig"), "utf-8-sig"
    except UnicodeDecodeError:
        pass
    try:
        return raw.decode("cp1252"), "cp1252"
    except UnicodeDecodeError:
        # Latin-1 maps every byte. Keep this last-resort path explicit in logs
        # and the pull manifest rather than silently losing the source.
        return raw.decode("latin-1"), "latin-1"


def clean_fragment(value: str) -> str:
    """Remove outer whitespace while preserving meaningful internal layout."""
    value = value.replace("\r\n", "\n").replace("\r", "\n")
    value = re.sub(r"[ \t]+\n", "\n", value)
    return value.strip()


def trim_output(value: str) -> str:
    """Normalize repeated literal spaces and remove outer whitespace."""
    return re.sub(r" {2,}", " ", value).strip()


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
    """Extract divider-bounded samples at periods and physical line breaks."""
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
            text = "\n".join(
                " | ".join(cell.strip() for cell in row if cell.strip())
                for row in rows
            )
        except csv.Error:
            pass

    # A period or physical line break ends a sample. Keep punctuation attached.
    # Empty lines and one-character lines are not useful samples.
    pieces = re.split(r"(?<=\.)[ \t]*|\n+", text)
    samples: list[str] = []
    for piece in pieces:
        piece = clean_fragment(piece)
        if len(piece) <= 1:
            continue
        if len(piece) > 2400:
            samples.extend(
                clean_fragment(piece[i:i + 1800])
                for i in range(0, len(piece), 1800)
                if len(clean_fragment(piece[i:i + 1800])) > 1
            )
        else:
            samples.append(piece)
    return samples


def load_hoppers(
    corpus: Path,
    include_hoppers: set[str] | None = None,
) -> dict[str, list[Fragment]]:
    if not corpus.is_dir():
        raise SystemExit(f"Corpus directory not found: {corpus}")

    hoppers: dict[str, list[Fragment]] = {}
    eligible_hoppers = USER_HOPPERS if include_hoppers is None else include_hoppers
    hopper_dirs = sorted(
        p for p in corpus.iterdir()
        if p.is_dir() and p.name in eligible_hoppers
    )
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
                raw, source_encoding = decode_text_file(path)
                if source_encoding != "utf-8-sig":
                    print(
                        f"DECODED {path} using {source_encoding}; source left unchanged",
                        file=sys.stderr,
                    )
            except OSError as exc:
                print(f"SKIP unreadable {path}: {exc}", file=sys.stderr)
                continue

            for piece in split_text(raw, path.suffix.lower()):
                piece = clean_fragment(piece)
                if piece:
                    found.append(Fragment(
                        piece, name, path.relative_to(corpus).as_posix(), source_encoding
                    ))
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
    """Choose a random document, then a random sample within that document."""
    documents: dict[tuple[str, str, str], list[Fragment]] = defaultdict(list)
    for hopper, fragments in hoppers.items():
        for fragment in fragments:
            documents[(hopper, fragment.source, fragment.encoding)].append(fragment)

    document_keys = list(documents)
    outputs = {"lyrics": "", "styles": ""}
    manifests: dict[str, list[dict[str, str]]] = {"lyrics": [], "styles": []}
    limits = {"lyrics": lyrics_chars, "styles": styles_chars}

    while any(len(outputs[key]) < limits[key] for key in outputs):
        available_destinations = [
            key for key in outputs if len(outputs[key]) < limits[key]
        ]
        if not available_destinations or not document_keys:
            break

        # First draw: every document has equal selection probability.
        doc_key = rng.choice(document_keys)
        hopper, source, encoding = doc_key
        # Second draw: select one divider-bounded sample from that document.
        sample = rng.choice(documents[doc_key])
        fragment_text = trim_output(sample.text)
        if len(fragment_text) <= 1:
            continue

        destination = (
            "styles" if rng.random() < style_probability(hopper) else "lyrics"
        )
        if destination not in available_destinations:
            destination = (
                "lyrics" if destination == "styles" else "styles"
            )
        if destination not in available_destinations:
            destination = available_destinations[0]

        remaining = limits[destination] - len(outputs[destination])
        used = fragment_text[:remaining]
        if not used:
            continue

        # Samples are concatenated directly. No synthetic separator is added.
        outputs[destination] += used
        manifests[destination].append({
            "hopper": hopper,
            "source": source,
            "source_encoding": encoding,
            "characters_used": str(len(used)),
            "truncated": str(len(used) < len(fragment_text)).lower(),
        })

    return (
        outputs["lyrics"], manifests["lyrics"],
        outputs["styles"], manifests["styles"],
    )



def _random_chunks(value: str, rng: random.Random, minimum: int, maximum: int) -> list[str]:
    """Split text at stochastic character offsets without interpreting its content."""
    chunks: list[str] = []
    position = 0
    while position < len(value):
        width = rng.randint(minimum, maximum)
        chunks.append(value[position:position + width])
        position += width
    return chunks


def apply_song_structure(
    value: str, rng: random.Random
) -> tuple[str, dict[str, object]]:
    """Independently and stochastically impose segmentation and repetition.

    Each operation has a 50% song-level activation chance. Activated operations
    choose partial or full pressure. Decisions are purely positional: content
    is never classified, filtered, or interpreted.
    """
    structure_gate = rng.random() < 0.50
    segmentation_on = structure_gate and rng.random() < 0.50
    repetition_on = structure_gate and rng.random() < 0.50
    segmentation_mode = rng.choice(["partial", "full"]) if segmentation_on else "off"
    repetition_mode = rng.choice(["partial", "full"]) if repetition_on else "off"

    result = value
    line_count = 0
    stanza_count = 0
    repeated_units = 0

    if segmentation_on and result:
        # Partial pressure leaves irregular stretches untouched; full pressure
        # segments the entire text. Character boundaries are deliberately blind.
        chunks = _random_chunks(result, rng, 28, 76)
        if segmentation_mode == "partial" and len(chunks) > 1:
            selected = [rng.random() < 0.55 for _ in chunks]
            if not any(selected):
                selected[rng.randrange(len(chunks))] = True
            rendered = [
                ("\n" if selected[i] and i else "") + chunk
                for i, chunk in enumerate(chunks)
            ]
            # Group the resulting lines into irregular stanzas.
            lines: list[str] = []
            for item in rendered:
                lines.extend(item.split("\n"))
        else:
            lines = chunks
        grouped: list[str] = []
        cursor = 0
        while cursor < len(lines):
            size = rng.randint(2, 5)
            grouped.append("\n".join(lines[cursor:cursor + size]))
            cursor += size
        result = "\n\n".join(grouped)
        line_count = sum(len(group.split("\n")) for group in grouped)
        stanza_count = len(grouped)

    if repetition_on and result:
        # Repeat whole stanzas when segmentation created them. Otherwise use
        # arbitrary positional chunks. Each stanza/unit gets its own chance.
        if segmentation_on:
            units = result.split("\n\n")
        else:
            units = _random_chunks(result, rng, 32, 96)
        repeated: list[str] = []
        for unit in units:
            repeated.append(unit)
            chance = 0.65 if repetition_mode == "full" else 0.30
            if rng.random() < chance:
                copies = rng.randint(1, 3 if repetition_mode == "full" else 2)
                repeated.extend([unit] * copies)
                repeated_units += 1
        separator = "\n\n" if segmentation_on else ""
        result = separator.join(repeated)

    return result, {
        "structure_gate": "open" if structure_gate else "closed",
        "segmentation": segmentation_mode,
        "repetition": repetition_mode,
        "line_count": line_count,
        "stanza_count": stanza_count,
        "repeated_units": repeated_units,
    }


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Randomly compile lyrics and styles pulls from user-supplied hoppers."
    )
    parser.add_argument("--corpus", type=Path, default=Path("corpus"),
                        help="Corpus root containing hopper subdirectories (default: ./corpus)")
    parser.add_argument("--out", type=Path, default=Path("hopper_pulls"),
                        help="Local output directory (default: ./hopper_pulls)")
    parser.add_argument("--lyrics-chars", type=int, default=5000)
    parser.add_argument("--styles-chars", type=int, default=1000)
    parser.add_argument("--variants", type=int, default=4,
                        help="Independent lyrics/styles pairs to generate (default: 4)")
    parser.add_argument("--seed", type=int, default=None,
                        help="Optional integer seed for reproducible pulls")
    parser.add_argument("--include-hoppers", default=None,
                        help="Comma-separated exact hopper directory names; default is user-supplied hoppers only")
    args = parser.parse_args()

    if args.lyrics_chars < 1 or args.styles_chars < 1 or args.variants < 1:
        raise SystemExit("Character limits and variant count must be positive integers.")

    rng = random.Random(args.seed)
    include_hoppers = (
        {name.strip() for name in args.include_hoppers.split(",") if name.strip()}
        if args.include_hoppers else None
    )
    hoppers = load_hoppers(args.corpus, include_hoppers)
    if not hoppers:
        raise SystemExit("No eligible text fragments found in any hopper.")

    args.out.mkdir(parents=True, exist_ok=True)
    run_manifest = {
        "compiler": "random_hopper_compiler.py",
        "seed": args.seed,
        "variant_count": args.variants,
        "corpus": str(args.corpus),
        "hopper_count": len(hoppers),
        "fragment_count": sum(len(items) for items in hoppers.values()),
        "hoppers_loaded": {name: len(items) for name, items in sorted(hoppers.items())},
        "variants": [],
    }

    for index in range(1, args.variants + 1):
        lyrics, lyrics_manifest, styles, styles_manifest = compile_both(
            hoppers, args.lyrics_chars, args.styles_chars, rng
        )
        lyrics, lyrics_structure = apply_song_structure(lyrics, rng)
        styles, styles_structure = apply_song_structure(styles, rng)
        lyrics_structure["truncated_to_field_limit"] = len(lyrics) > args.lyrics_chars
        styles_structure["truncated_to_field_limit"] = len(styles) > args.styles_chars
        lyrics = lyrics[:args.lyrics_chars]
        styles = styles[:args.styles_chars]

        variant_dir = args.out / f"variant_{index:02d}"
        variant_dir.mkdir(parents=True, exist_ok=True)
        (variant_dir / "lyrics_pull.txt").write_text(lyrics, encoding="utf-8")
        (variant_dir / "styles_pull.txt").write_text(styles, encoding="utf-8")

        manifest = {
            "compiler": "random_hopper_compiler.py",
            "variant": index,
            "seed": args.seed,
            "corpus": str(args.corpus),
            "hopper_count": len(hoppers),
            "fragment_count": run_manifest["fragment_count"],
            "hoppers_loaded": run_manifest["hoppers_loaded"],
            "lyrics": {
                "target_characters": args.lyrics_chars,
                "actual_characters": len(lyrics),
                "pull_count": len(lyrics_manifest),
                "structure": lyrics_structure,
                "pulls": lyrics_manifest,
            },
            "styles": {
                "target_characters": args.styles_chars,
                "actual_characters": len(styles),
                "pull_count": len(styles_manifest),
                "structure": styles_structure,
                "pulls": styles_manifest,
            },
            "routing_note": (
                "Genre and Structure hoppers are strongly Styles-biased; "
                "Lyrics and writing/content hoppers are strongly Lyrics-biased. "
                "Only user-supplied hoppers are eligible by default; assistant research/documentation hoppers are separate. "
                "All selected user hoppers remain eligible for either field."
            ),
            "divider": "",
            "text_only_note": (
                "Binary audio/image/video files are not embedded. Their filenames "
                "become short text fragments; text sidecars, captions, and metadata "
                "are also eligible."
            ),
        }
        (variant_dir / "pull_manifest.json").write_text(
            json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8"
        )
        run_manifest["variants"].append({
            "variant": index,
            "directory": variant_dir.name,
            "lyrics_characters": len(lyrics),
            "styles_characters": len(styles),
            "lyrics_structure": lyrics_structure,
            "styles_structure": styles_structure,
        })
        print(
            f"Variant {index:02d}: Lyrics {len(lyrics)}/{args.lyrics_chars} "
            f"({len(lyrics_manifest)} pulls); Styles {len(styles)}/{args.styles_chars} "
            f"({len(styles_manifest)} pulls)"
        )

    (args.out / "run_manifest.json").write_text(
        json.dumps(run_manifest, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    print(f"Loaded {len(hoppers)} hoppers and {run_manifest['fragment_count']} fragments.")
    print(f"Generated {args.variants} independent Lyrics/Styles pairs.")
    print(f"Outputs: {args.out.resolve()}")


if __name__ == "__main__":
    main()
