# Music Archive Access Layer

**Status:** Initial operational layer, 2026-11-18  
**Scope:** Navigation, discovery, source recovery, and bounded indexing for KleineMcKnightMusic.  
**Non-goal:** This layer does not replace the music workdesk's domain-specific methods or convert aesthetic judgments into machine facts.

## Cold start

1. Read the repository root README.
2. Read `CONVERSATIONS/README.md` for source conversations and continuity notes.
3. For Suno research, follow `SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1/14_ONBOARDING_AND_CONTINUITY.md`.
4. Use `00_PROJECT_MAP.md` to route into the workdesk. Follow `13_OPERATING_PROTOCOL.md` for evidence and working practices.
5. Consult the current experiment ledger, model-behavior registry, case-study index, source pools, open questions, and relevant hopper documentation.
6. Before using a utility, inspect its README and code. Before claiming a tool capability, inspect and test it.
7. Before reusing or publishing source material, check provenance, privacy, licensing, and rights status.

## Existing architecture (preserve it)

The repository already has three connected planes:
- **Music engine:** timing, rhythm, harmony, melody, prosody, arrangement, and formal composition.
- **Musical knowledge:** genres, traditions, instruments, techniques, terminology, and perceptual description.
- **Experimental system:** prompts, model/version/settings, generated outputs, evaluation, and reproducibility.

The archive additionally contains source conversations, external mining, corpus hoppers, Sonic Pi scripts, Suno workdesks, case/experiment records, and a separate stochastic simulation workdesk.

## Retrieval rules

Keep these evidence objects distinct:
- exact source artifact (prompt, lyric, settings, audio, code, conversation, or external source);
- user-reported observation/listening note;
- assistant interpretation;
- measurement and method;
- repeated observation across identifiable cases;
- hypothesis or provisional rule;
- project decision;
- rights/license and privacy status.

A hopper, case index, summary, or model registry is a navigation aid. Inspect the underlying artifact before relying on its exact wording or claiming a behavior. Version-bind generative-model observations. Preserve productive failures and malformed creative material without silent normalization.

## First-order source routes

| Need | Start |
|---|---|
| Music workshop continuity | `CONVERSATIONS/README.md` |
| Suno research | `SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1/14_ONBOARDING_AND_CONTINUITY.md` |
| Project map | `SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1/00_PROJECT_MAP.md` |
| Evidence / operating protocol | `SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1/13_OPERATING_PROTOCOL.md` |
| Experiment history | `06_EXPERIMENT_LEDGER.csv` |
| Model observations | `07_MODEL_BEHAVIOR_REGISTRY.csv` |
| Prompt/case genealogy | `08_CASE_STUDY_INDEX.csv` |
| Corpus structure | `corpus/README.md` and `corpus/SUNO_CORPUS_METHOD.md` |
| Source discovery | `tools/source_hopper.py`, `tools/source_queries.yaml` |
| Toolbox claims/adoption | `docs/TOOLBOX_METHOD.md`, `toolbox/registry.yaml` |
| Sonic Pi code | `SONIC_PI_SCRIPTS/` and conversation code originals |
| External ideas/research | `EXTERNAL_MINING/README.md` |

## Search/report contract

Every material search should report:
- question and bounded scope;
- repository paths and source families searched;
- exact terms and search method;
- coverage and inaccessible/unsearched areas;
- exact path and source identity (Git blob SHA; add SHA-256 in local tools);
- excerpt or faithful finding;
- evidence type and model/version scope, where relevant;
- rights/privacy handling;
- unresolved gaps and a continuation cursor.

Do not call a source search complete merely because the hopper or index returned no hits. Large conversation exports, raw audio, and binary attachments need source-specific inspection methods.

## Initial inventory

The initial recursive Git tree scan of `main` found 862 entries (including directories), not truncated:
- `corpus/`: 672 entries, with major hoppers for Lyrics, Sonic_Pi, Sample, Grab_Bag, Writing_Voice, Genre, Prompt, Structure, Community, and others.
- `CONVERSATIONS/`: raw conversation exports, notes, CSV maps, and historical Sonic Pi scripts.
- `SUNO_WORKDESKS/`: Suno LLM workshop, experiment system, onboarding and continuity.
- `SIMULATION_WORKDESKS/WELL_FUCK/`: separate creative-systems workdesk.
- `EXTERNAL_MINING/`: raw dumps, idea mines, structured inputs.
- `SONIC_PI_SCRIPTS/`: reusable audio/logo audition and sample-library tools.
- `tools/`, `tests/`, `toolbox/`, `docs/`, and GitHub Actions workflows.

Counts are a snapshot; regenerate from the live tree when needed.

## Cross-repository research integration

For SAT/H(s)H research that needs historical physics context, use HsH's existing [Mersearch worker route](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md). The Mersearch bridge is specifically for the three SAT/H(s)H archives and is not a music-corpus index. Keep the music repository's own source hoppers, experiment records, and evidence model authoritative for music work. Do not route private music lyrics or audio into physics archive indexing.

## Next infrastructure work

- [ ] Reconcile repository inventory against current manifests and hopper indexes.
- [ ] Establish one canonical source identity convention: repo/path, Git blob SHA, SHA-256, file size, extraction status.
- [ ] Build a read-only metadata index first; do not auto-normalize lyrics or conversation contents.
- [ ] Add extraction adapters for text, JSON conversation exports, CSV, Ruby/Sonic Pi, and audio metadata.
- [ ] Keep audio analysis results separate from listening judgments.
- [ ] Add rights/privacy review fields before producing shareable/public outputs.
- [ ] Build resumable, deterministic corpus scans with per-file errors and explicit coverage.
- [ ] Reconcile and document duplicate paths/content hashes without deleting source copies.
