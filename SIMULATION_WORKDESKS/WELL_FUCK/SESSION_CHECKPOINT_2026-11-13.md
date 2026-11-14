# Session Checkpoint — 2026-11-13

**Record type:** Assistant-prepared, project-specific conversation checkpoint  
**Source:** Project-relevant content available in the originating ChatGPT conversation and its carried-forward state  
**Status:** Distilled working record, not a verbatim transcript or complete export  
**Purpose:** Allow a successor conversation to recover the simulation without relying on the original chat remaining available.

## 1. Project origin and creative premise

The project began from a sketch of enormous underground caverns, settlements on cavern shelves, and underwater bubble cities. It developed into a browser-based stochastic speleological civilization simulator with emergent geology, water, vegetation, settlement growth, cultural divergence, and black-humor narration.

The working title is Well, Fuck. The prototype has been developed through successive single-file HTML laboratories.

## 2. Prototype lineage

Known local artifact sequence:

- Collapse Lab 1.4
- Cities Lab 1.5
- Cities Lab 1.6
- Cities Lab 1.7
- Cities Lab 2.9
- Cities Lab 2.10
- Cities Lab 2.11

The latest known build is Well_Fuck_Cities_Lab_2_11.html. It is available in the current working environment and has now been identified through a generated conversation-file copy.

### Local artifact identity

- Path: /mnt/data/Well_Fuck_Cities_Lab_2_11.html
- Size: 1,549,198 bytes
- SHA-256: 1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05
- Previous build 2.10 SHA-256: 90fd48b8e7f15c62bc7dacbcadcc73c5a46c21f142d197e52220d0ff7a253f19

The checksum was recomputed in the working environment. The matching generated conversation-file copy was compared byte-for-byte with the local file. Repository publication and independent readback remain in progress until a branch commit is verified.

## 3. Simulation substrate

The current model uses a grid with cell classes for void, rock, purple cavern/stalactite, mossy green terrain, and water. Fractures spread; granular debris falls, darkens, compacts, and erodes; vegetation spreads and changes color.

Buildings are warm stone structures. Their placement is constrained by green terrain and influenced by nearby water and other buildings. Buildings can be lost if their support is removed or debris contacts them. The cavern rendering uses layered states so collapse exposes deeper visual strata.

Geology is paused as an active development area. Preserve the existing substrate and avoid adding geological features unless maintenance, integration, or a direct priority change requires it.

## 4. Language Kernel 0.1

Language communities attach to settlement clusters. Nearby new buildings tend to inherit the local community language; rare remote foundations can become daughter communities and diverge.

The initial proto-expression is “Well, fuck.”, represented as /wɛl fʌk/. Around turn 20, communities independently adopt one of 14 English or near-English founder phrases.

Phrase evolution operations include expansion, reduction, replacement, reordering, reduplication, fusion, split/resegmentation, semantic drift, and occasional stock-idiom replacement.

IPA phoneme sequences are authoritative. Sound laws apply across a community's lexicon and have a recorded history. The implementation includes rules such as initial /w/ to /ʋ/, final /k/ to /x/, /t/ to /tʃ/ before front vowels, intervocalic /l/ to /ɾ/, initial /ð/ to /d/, and other context-sensitive changes.

The Phrase Field Notebook records community, phrase, IPA, working gloss, phoneme inventory, sound-change log, phrase lineage, contextual samples, and an Overhear Locals interaction.

Language randomness is intended to be separate from geology/city randomness. This design must be confirmed against the actual source and seeded regression tests before it is treated as verified behavior.

Not yet implemented, according to the carried-forward project state:

- productive grammar;
- a broad lexicon for water, shelter, food, rock, danger, strangers, and trade;
- event-specific utterances;
- productive morphology and syntax;
- borrowing and contact effects;
- dialect continua;
- mutual intelligibility;
- contextual diplomacy and richer social pragmatics.

## 5. Testing status

The preceding conversation had reported Chromium runs to 1,000 turns and a 2.10/2.11 comparison. Those reports have now been independently checked in this session.

- Node.js v22.16.0 syntax check of 2.11's sole inline script: PASS.
- Playwright 1.57.0 / Chromium 144.0.7559.96 browser run: 2.11 reached turn 1,000 with no page exceptions or console errors.
- 2.10 vs 2.11, seed 42, 1,000 turns: sampled city/geology statistics and main-canvas PNG hash identical.
- Isolated language-kernel harness: same seed repeated deterministically; a different seed produced a different language trajectory; the city RNG state was unchanged by language evolution.
- A same-seed browser test also confirmed that clicking “Overhear locals” changes later language evolution because it consumes the language RNG. City statistics and canvas remain unchanged. This defect is documented in LANGUAGE_KERNEL_AUDIT.md and is the next correction.

Broader multi-seed regression remains to be run.
## 6. Current user direction

The current direct project instructions establish:

1. Use Satobloc/KleineMcKnightMusic as the home for this project, as a secondary workspace distinct from the music workshop's main purpose.
2. Learn primarily from HsH and relevant Satobloc repository methods for project continuity, workflow tracking, operation receipts, handoffs, and adaptive attention management.
3. Preserve project-relevant conversation content in the repository so sudden context limits do not erase the working state. This is not a request to mirror the repositories generally.
4. The user's independent file backups are already being maintained by the user.
5. The attention/turn ticker must be tailored to this project and continuously optimized.
6. Use the underlying lesson of an interactive heartbeat and visible re-entry trigger, but do not inherit HsH's exact implementation. The threshold, schedule, ticker, review cadence, and automation are this project's own design choices and must be justified against its workflow.
7. Language mechanics are the current focus; geology development is paused.
8. PROJECT_PLAN.md version 1.0 is adopted as the amendable working roadmap; consequential changes are versioned and logged.

## 7. Workflow design adopted for this project

The pilot uses:

- a tiny boot capsule;
- one active tray;
- a durable control shelf;
- a priority-aware branching queue;
- dated decisions and operation receipts;
- a project-specific interactive heartbeat;
- a context-limit succession protocol;
- a GitHub Actions structural/freshness check;
- a tailored five-mode attention ticker;
- a separate completed-operation counter.

The five attention modes are: re-entry and scope; language engine; simulation integration and culture; instrumentation and verification; exploration and executive replan. These are tailored to the present project and remain subject to continuous review. The ticker is an attention aid, not a mandatory checklist. The separate operation counter advances only after a bounded operation has a checkable result or explicit disposition and a verified receipt.

The 36-hour stale threshold and six-hour scheduled check are provisional starting settings, not inherited HsH requirements. They are due for review after five completed operations or 14 calendar days, whichever comes first.

## 8. Adopted project roadmap

PROJECT_PLAN.md version 1.0 is the canonical living roadmap. Its phases are:

0. Repository and continuity bootstrap — COMPLETE.
1. Preserve the 2.11 prototype — ACTIVE.
2. Audit Language Kernel 0.1 and establish a reproducible baseline.
3. Build a productive language core.
4. Ground speech in actual simulation events.
5. Develop social language evolution and intelligibility.
6. Integrate language with civilization.
7. Run experiments, measure, and refine.
8. Package and maintain stable builds.

The plan is locked as the default direction but amendable through versioned changes and the decision log. Phases are evidence gates, not calendar deadlines.

## 9. Current operation and test progress

**WF-SIM-001 — Preserve and independently verify Cities Laboratory 2.11: COMPLETE.**

- Exact local file: /mnt/data/Well_Fuck_Cities_Lab_2_11.html.
- Size: 1,549,198 bytes.
- SHA-256: 1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05.
- Repository path: SIMULATION_WORKDESKS/WELL_FUCK/builds/Well_Fuck_Cities_Lab_2_11.html.
- Commit: 4e2df3cb073b4b4dceefddf54831edab1378c17a.
- Blob: 67d17e7efac74434570f36f6b3f726e945db6f1e.
- Independent blob readback matched the full source text exactly.
- Node syntax: PASS. Playwright/Chromium 144 browser run to turn 1,000: PASS, no page exceptions or console errors.
- 2.10 vs 2.11, seed 42, 1,000 turns: sampled city/geology statistics and main-canvas screenshot hash identical.

**WF-LANG-001 — Audit Language Kernel 0.1: COMPLETE.**

- Audit file: LANGUAGE_KERNEL_AUDIT.md.
- Current kernel: 36-entry proto-lexicon, 14 founder phrases, 10 sound laws, eight phrase mutation operations, IPA-segment representation, community inheritance, and a shared language RNG.
- Verified issue: “Overhear locals” consumes the language simulation RNG. A click at turn 100 changed the turn-1000 phrase under the same seed, while city statistics and the canvas remained identical.
- Isolated language test: same seed repeated deterministically; a different seed changed the language trajectory; global city RNG state remained unchanged.

## 10. Exact next actions

1. WF-LANG-004: decouple notebook/UI sampling from the language simulation RNG and publish a new versioned build without overwriting 2.11.
2. WF-TEST-001: add repeatable regression tests for UI-action independence and multi-seed physical/city behavior.
3. Continue productive-language design with WF-LANG-002 after the RNG guardrail is tested.

## 11. Repository bootstrap receipt

The project home is present in Satobloc/KleineMcKnightMusic at SIMULATION_WORKDESKS/WELL_FUCK/. The root README links to it.

The bootstrap and continuity scaffolding were published and verified through these commits:

- 37997b4d8b3841760b839d3c6ae6ddde5065732b — initial project home and control records.
- 5fcd3cfd6540a0b7b470b1cfea251fe60c0034ed — inclusive heartbeat threshold correction.
- b732a2a50467b486e5e95ba513cd1057a1f638af — expanded boundary tests.
- 5322e9d7b49e3212ddaac3ed003e2ce20400ace5 — freshness check on every relevant project validation.
- 009bed48ec4d9952d581f362d772cb0d6e487d64 — refreshed interactive heartbeat and clarified update rule.

Verified workflow runs:
- Well, Fuck. Continuity 43552338761: SUCCESS.
- Well, Fuck. Continuity 43552401004: SUCCESS.
- Source Hopper Checks 43552401001: SUCCESS.
- Well, Fuck. Continuity 43552468360: SUCCESS, including the live heartbeat freshness check.
- Latest continuity run 43553994751 for 009bed48ec4d9952d581f362d772cb0d6e487d64: SUCCESS.

The first continuity run failed because a synthetic unit-test heartbeat set exactly 36 hours in the past was not classified as stale. That timestamp was a deliberately constructed test input, not the project's live heartbeat. The comparison was corrected from greater-than to greater-than-or-equal, and the boundary test passed.

The HTML simulation file remains subject to its own artifact-preservation and runtime-verification operation. Do not treat the repository control bootstrap as proof that the executable has been committed or tested.

## 12. Methodology clarification

Nathan clarified that HsH and the other Satobloc repositories are methodological sources, not templates. The project should extract useful lessons and independently design its own controls around its own creative priorities, interruption risks, scale, and operational needs. No particular HsH interval, schedule, ticker shape, automation, or documentation ritual is binding.


## 13. Latest project update — 2026-11-13

**Project plan:** PROJECT_PLAN.md v1.1 is the adopted, amendable roadmap. It adds the working guardrail that UI/presentation actions must not perturb simulation RNG streams.

**Preserved 2.11 baseline**
- Commit: 4e2df3cb073b4b4dceefddf54831edab1378c17a.
- Artifact blob: 67d17e7efac74434570f36f6b3f726e945db6f1e.
- Source SHA-256: 1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05.
- Exact source-text readback, Node syntax check, and a 1,000-turn Playwright/Chromium browser run all passed.
- Seed-42 comparison with 2.10 through 1,000 turns yielded identical sampled physical/city statistics and identical main-canvas screenshot hash.

**Language audit:** WF-LANG-001 is complete. LANGUAGE_KERNEL_AUDIT.md records the 36-entry proto-lexicon, 14 founder phrases, 10 sound laws, eight phrase mutation operations, community inheritance, shared language RNG, current limitations, and test results.

**Verified defect:** “Overhear locals” consumes the language simulation RNG. One same-seed click at turn 100 changed the phrase at turn 1,000 while leaving city/geology outputs unchanged. This is a UI-to-language coupling defect, not a physical RNG leak.

**Current operation:** WF-LANG-004, decouple notebook/UI sampling from the language simulation RNG. Preserve 2.11 unchanged; produce a new 2.12 build and a regression test.
