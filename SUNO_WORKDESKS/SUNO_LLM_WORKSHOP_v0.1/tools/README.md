# Random Hopper Compiler

A deliberately rough first-pass prompt-mashup tool for the Suno workdesk.

## Run

From the repository root:

```bash
python SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1/tools/random_hopper_compiler.py
```

By default it reads every immediate subdirectory under `corpus/` as a hopper and writes:

- `hopper_pulls/lyrics_pull.txt` (up to 5,000 characters)
- `hopper_pulls/styles_pull.txt` (up to 1,000 characters)
- `hopper_pulls/pull_manifest.json` (source paths, hopper counts, lengths, and truncation)

Optional controls:

```bash
python SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1/tools/random_hopper_compiler.py --seed 20261114
python SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1/tools/random_hopper_compiler.py --corpus ./corpus --out ./my_pull --lyrics-chars 5000 --styles-chars 1000
```

## Routing behavior

- Every hopper directory is eligible. New hopper directories are discovered automatically.
- Genre and Structure pulls are strongly biased toward Styles (84%), but can land in Lyrics.
- Lyrics and writing/content-oriented hoppers are strongly biased toward Lyrics. Other hoppers use mixed routing.
- No hopper is exclusive to either field. If a preferred destination is already full, a pull can fill the other field.
- Fragments are selected randomly without replacement within a run. A shared fragment is not inserted twice.
- Fragments are concatenated with the literal divider `.` followed by a newline.
- The character limits are ceilings. If the available material is insufficient, the script reports the shortfall rather than inventing text.

Text-bearing files are split into paragraphs/rows/string values. Binary assets are not embedded; their filenames become short text fragments, while text sidecars and metadata remain eligible. Unsupported file types are ignored.

## Trial-run cautions

This is a mashup generator, not a semantic editor. It does not try to repair grammar, preserve narrative continuity, remove contradictions, or make the result conventionally coherent. That is intentional for the first trial.

Outputs are written locally and should be treated as private working material. Do not commit generated pulls or redistribute excerpts without checking source rights and privacy. Use the manifest to trace surprising or useful fragments back to their source files.

The random seed makes a run reproducible against an unchanged corpus and script version.
