# KMcKM Workbench

A small request-driven runner for experiments in this repository.

## Request protocol

1. Edit `REQUEST.json` and commit it.
2. A push touching that file triggers the Workbench.
3. The runner checks out the exact triggering commit, validates the request, runs the selected command, and uploads a run-specific artifact.
4. The artifact contains the original request, a receipt, logs, and command outputs.
5. Each request ID is single-use. A rerun that would overwrite an existing run is rejected.

The runner does not commit generated outputs or modify corpus inputs. All command outputs are written beneath `workbench_runs/<request_id>/` inside the runner and returned as an Actions artifact.

## Commands

### inventory

Read-only structural inventory of a repository folder.

```json
{
  "version": 1,
  "request_id": "inventory_corpus_001",
  "command": "inventory",
  "target": "corpus",
  "max_files": 10000
}
```

### hopper-trial

Runs the existing random hopper compiler against an explicit list of exact hopper directory names.

```json
{
  "version": 1,
  "request_id": "hopper_mix_001",
  "command": "hopper-trial",
  "corpus": "corpus",
  "include_hoppers": ["Genre_Hopper", "Structure_Hopper", "Prompt_Hopper", "Lyrics_Hopper"],
  "lyrics_chars": 1800,
  "styles_chars": 500,
  "seed": 20261114
}
```

The compiler is a deliberately rough mashup generator. It does not establish semantic coherence, musical usefulness, or rights clearance.

## Adding commands

Add a function in `tools/workbench.py`, validate its inputs, write only to its supplied run directory, return a structured result, and add tests. Do not turn arbitrary shell execution into a public request feature.
