# 14 — Music Workdesk Onboarding and Continuity

**Status:** Active working guide; music-domain adaptation of transferable HsH methods.
**Scope:** KleineMcKnightMusic, with immediate emphasis on the Suno LLM Workshop.
**Purpose:** A cold-start route into the existing project, its evidence, tools, creative aims, and next useful work.

This guide adopts HsH's source-first, provenance-aware, bounded-execution, branching, tool-reconnaissance, and reassessment methods. It does not import HsH's physics authority structure, worker/scheduler machinery, symbol registry, quarantine taxonomy, or three-repository control plane. The music project governs itself through its own maps, ledgers, source hoppers, rights discipline, and listening practice.

## 1. Cold-start route

Read in this order when new to the music workdesk, returning after significant drift, or entering a materially changed workflow:

1. Repository root `README.md` — project purpose and three-plane architecture.
2. `SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1/00_PROJECT_MAP.md` — live workdesk map.
3. `13_OPERATING_PROTOCOL.md` — working principles and evidence model.
4. `01_ACTION_PLAN.md` — current planned/active work; confirm status against actual artifacts before assuming a checkbox reflects completed execution.
5. `02_WORKING_THEORY.md` — qualified working model; labels and version scope matter.
6. `03_TASTE_MODEL.md` — aesthetic attractors, productive pressures, unwanted defaults; use as a fallible aid, never as a rigid preference cage.
7. `04_PROMPT_GRAMMAR.md` and `05_SONG_ARCHITECTURE.md` — current construction vocabulary and worksheet.
8. `06_EXPERIMENT_LEDGER.csv`, `07_MODEL_BEHAVIOR_REGISTRY.csv`, and `08_CASE_STUDY_INDEX.csv` — existing tests, behavior claims, and source cases; inspect linked underlying artifacts before relying on summaries.
9. `09_SOURCE_POOLS.md`, `10_OPEN_QUESTIONS.md`, and `11_VOCALICS.md` — source families, unresolved questions, and voice-access program.
10. `12_HSH_ARCHIVE_IMPORTS.md` plus the source maps it names — HsH-derived material, transfer decisions, and unresolved source-recovery work.
11. `tools/README.md` and the relevant tool source before running or extending a utility.
12. `corpus/README.md`, `docs/TOOLBOX_METHOD.md`, and `toolbox/registry.yaml` before adding source material or adopting a dependency.

For a narrow task, follow the shortest relevant route rather than rereading everything. Return to this guide after a major change in project structure, model family, evidence policy, or working protocol.

## 2. Project identity and operating posture

KleineMcKnightMusic is a modular composition and music-systems workshop, not a Suno-only prompt collection.

Its three connected planes are:

- **Music engine:** timing, rhythm, harmony, melody, prosody, arrangement, formal composition.
- **Musical knowledge:** traditions, genres, instruments, techniques, terminology, perceptual and acoustic description.
- **Experimental system:** prompts, models, versions, settings, generated audio, evaluation, and reproducibility.

The current Suno loop is:

**compile → construct → rupture → generate → listen → harvest → recombine → revise**

The project values both intended control and productive surprise. Evaluate at least three distinct outcomes when appropriate:

- **CONTROL:** an intended relation or invariant appears.
- **SURPRISE:** an unexpected contribution is musically valuable.
- **HYBRID:** the intended identity survives while the generator contributes something not specified.

Do not reduce success to literal prompt compliance, conventional polish, or predictability. Human listening remains essential; measurements supplement rather than replace it.

## 3. Lightweight work routing

Use existing structures and route an item provisionally:

| Kind of work | Where it belongs |
|---|---|
| Uncommitted phrase, sound-image, contradiction, or idea | Relevant hopper / idea mine |
| Directly heard or user-reported behavior | Observation in the relevant case or experiment record |
| External article, tool, dataset, discussion, or lead | Source_Hopper with provenance |
| Bounded uncertainty | Open Questions or an experiment proposal |
| Deliberate comparison / repeated test | Experiment ledger and its artifact folder |
| Reusable parser, compiler, analysis script, or prompt utility | Tools, with README and test evidence |
| Qualified repeated behavior | Working Theory / Model Behavior Registry |
| Prompt-construction relation | Prompt Grammar, only when it earns its place |
| Aesthetic correction or taste observation | Taste Model, with scope and context |
| Durable project choice | Relevant workdesk document with rationale and date |

Promotion is deliberate. A phrase does not become a finding by being repeated; a hypothesis does not become a rule because it sounds plausible; a useful one-off generation remains a useful one-off until there is evidence for generalization.

Do not create a separate branch, file, or ledger entry for every thought. Split work when it has a distinct question, method, evidence set, or deliverable. Preserve the original trunk and leave a return path.

## 4. Evidence, authorship, and claims

Keep these distinct:

- **Source artifact:** exact prompt, lyric, settings, generated audio, code, source URL, or original record.
- **Nathan/user observation:** reported listening impression or direct action.
- **Assistant analysis:** interpretation or proposed explanation.
- **Measurement:** result of a named procedure, with method and limits.
- **Repeated observation:** same pattern across identifiable cases.
- **Hypothesis:** a candidate explanation not yet established.
- **Project decision:** a local working convention, not a universal fact.

For generative audio, record where available: model and version, mode, settings, relevant prompt fields, reference assets, generation date, output ID or filename, and checksum. Do not silently generalize a v4.5 observation to v5.5 or v6. Treat Suno versions and interface changes as possible confounds.

Never claim access to hidden model mechanisms from output behavior, a fluent explanation, model self-report, or a single generation. Describe what happened before proposing why.

## 5. Experimental standards

A controlled experiment should normally identify:

1. The question and intended inference.
2. The exact source prompt/artifact, preserved verbatim.
3. One principal variable to change.
4. Control and comparison conditions.
5. Model/version/mode/settings and reference inputs.
6. Output identity and listening/measurement criteria.
7. Results, surprises, failures, counterexamples, limitations, and next action.

Change one principal variable at a time when practical. If multiple variables change, call the run exploratory rather than causal. Replicate when the conclusion matters. Keep the raw prompt and output even when the experiment fails.

Useful separate evaluation dimensions include control, surprise, musical quality, distinctiveness, invariant preservation, conventionality cost, sterilization cost, consistency, and listener confidence. Do not collapse them into one score unless a specific decision requires a justified weighting.

Check the experiment ledger and case index before assigning identifiers. Do not overwrite productive failures or erase contradictory evidence.

## 6. Creative-material fidelity

Original creative language is first-class source material.

Preserve exact wording, punctuation, spacing, lineation, capitalization, phonetic spellings, malformed syntax, contradictions, and variants whenever they may affect interpretation or generation. Do not normalize a source in place.

Keep separate copies or explicitly labeled transformations for:
- semantic content and phonetic form;
- lyric-eligible text and musical/production direction;
- global song-world and local event;
- deliberate ambiguity and accidental ambiguity;
- source text and assistant-edited variant.

Offer alternate readings without destroying the original. Do not replace concrete sonic situations with generic mood language merely because it is easier to summarize.

## 7. Sources, rights, and toolbox adoption

Use project maps, hopper indexes, manifests, and search as wayfinding. Inspect the underlying source before making substantive claims. Preserve source filename/canonical URL, author or origin, retrieval/extraction date, exact passage or item locator, wording status (verbatim/normalized/translated/paraphrased), rights/license status, confidence, and intended use as appropriate.

Keep three layers separate:
1. Private originals: uploads, private conversations, original lyrics, prompt records, sketches, and mixed-source files.
2. Curated research records: extracted observations, normalized terminology, references, and experiment metadata with provenance.
3. Public project assets: original code, schemas, documentation, and cleared material.

Public repository availability does not establish permission to republish. Review code, model weights, datasets, samples, voices, lyrics, third-party writing, and generated outputs separately.

Treat toolbox listings as candidates, not installed or tested capabilities. Use the existing adoption method: upstream claim, code-observed, locally tested, user-observed, inferred, or unknown. Do not promote an upstream description into a local capability claim. Adopt tools only when functional fit, reproducibility, environment, interoperability, maintenance, rights, and fallback are understood.

## 8. Tooling and repository execution

Inspect existing tools, scripts, manifests, and ledgers before inventing replacements. Prefer small, replaceable tools with explicit inputs and outputs. Use code for repeatable calculation, parsing, compilation, comparison, corpus hygiene, and validation; test it against known cases.

Before repository writes:
- inspect the current file and its SHA;
- preserve unrelated content and source originals;
- use focused, descriptive commits;
- avoid parallel writes to the same path;
- independently fetch the changed artifact and verify the intended content.

Do not publish private generated pulls, raw conversation exports, or rights-uncleared source excerpts as build artifacts. A script being committed is not evidence that it has been executed. Report attempted, completed, and independently verified operations distinctly.

## 9. Continuity and handoff

At a meaningful stopping point, keep a compact continuation record in an existing workdesk surface. It should identify:

- **Aim:** current objective and why it matters.
- **State:** what has actually been done.
- **Evidence:** exact artifacts, source paths, versions, and relevant hashes/IDs.
- **Uncertainty:** what is unresolved or merely hypothesized.
- **Next cursor:** smallest useful action and its completion condition.
- **Guardrail:** what must not be lost, assumed, published, or changed.

Prefer extending the existing action plan, experiment ledger, case index, or relevant source record over making another competing dashboard.

## 10. Reassessment and anti-rut

At natural project boundaries, after a meaningful run, when model/tool versions change, or when work becomes repetitive, ask:

- What did we actually learn?
- Which conclusions are supported, and by what evidence class?
- Which claims remain hypotheses or version-bound?
- What surprised us, including negative or contradictory results?
- Are the methods preserving the project's creative identity?
- Which procedures are useful, ritualized, redundant, or obsolete?
- What should be automated, simplified, branched, parked, or retired?

No fixed cadence is required. Reassess when change gives the review value.

## 11. Current workdesk orientation

The project map is the workdesk front door. Current known work includes completing E-0001's matched Policy / No-DEF_MODE run, core corpus extraction, historical case studies, E-0002 through E-0005, VOCALICS, and one full construct/rupture/generate/listen/harvest/rebuild cycle. Confirm actual artifact and run state before treating planned checkboxes as progress.

The random hopper compiler is a build capability, not an experimental result. Its output still requires a real corpus run, manifest inspection, prompt review, and listening-based evaluation.

## 12. Completion test

A work session is adequately oriented when it can answer:

- What is the current musical objective?
- Which workdesk document or source is authoritative for the immediate question?
- What has actually been observed, tested, measured, or merely proposed?
- Which original artifacts and rights constraints must be preserved?
- What tools already exist?
- What is the smallest useful action available now?
- Where will the result and continuation cursor be recorded?

If these answers are hard to recover, improve the relevant map or source pointer instead of relying on oral context.
