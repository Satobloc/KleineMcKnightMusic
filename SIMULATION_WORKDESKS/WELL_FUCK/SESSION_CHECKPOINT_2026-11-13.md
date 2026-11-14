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

The latest known build is Well_Fuck_Cities_Lab_2_11.html. It is present in the originating work session's local working area, not yet committed to this repository.

### Local artifact identity

- Path: /mnt/data/Well_Fuck_Cities_Lab_2_11.html
- Size: 1,549,198 bytes
- SHA-256: 1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05
- Previous build 2.10 SHA-256: 90fd48b8e7f15c62bc7dacbcadcc73c5a46c21f142d197e52220d0ff7a253f19

The hash identifies the local file observed during checkpoint creation. It does not establish that the file has been uploaded to GitHub.

## 3. Simulation substrate

The current model uses a grid with cell classes for void, rock, purple cavern/stalactite, mossy green terrain, and water. Fractures spread; granular debris falls, darkens, compacts, and erodes; vegetation spreads and changes color.

Buildings are warm stone structures. Their placement is constrained by green terrain and influenced by nearby water and other buildings. Buildings can be lost if their support is removed or debris contacts them. The cavern rendering uses layered states so collapse exposes deeper visual strata.

Geology is now paused as an active development area. Preserve the existing substrate and avoid adding geological features unless maintenance, integration, or a direct priority change requires it.

## 4. Language Kernel 0.1

Language communities attach to settlement clusters. Nearby new buildings tend to inherit the local community language; rare remote foundations can become daughter communities and diverge.

The initial proto-expression is “Well, fuck.”, represented as /wɛl fʌk/. Around turn 20, communities independently adopt one of 14 English or near-English founder phrases. Examples include “Well, fuck me,” “Oh, fuck,” “For fuck’s sake,” and “Well, this is unfortunate.”

Phrase evolution operations include expansion, reduction, replacement, reordering, reduplication, fusion, split/resegmentation, semantic drift, and occasional stock-idiom replacement.

IPA phoneme sequences are authoritative. Sound laws apply across a community's lexicon and have a recorded history. The implementation notes include changes such as initial /w/ to /ʋ/, final /k/ to /x/, /t/ to /tʃ/ before front vowels, intervocalic /l/ to /ɾ/, initial /ð/ to /d/, and other context-sensitive changes.

The Phrase Field Notebook records community, phrase, IPA, working gloss, phoneme inventory, sound-change log, phrase lineage, contextual samples, and an Overhear Locals interaction.

Language randomness is intended to be separate from geology/city randomness. This design must be confirmed by inspecting the actual source and running a seeded regression test before it is treated as verified behavior.

Not yet implemented, according to the carried-forward project state:

- productive grammar;
- a broad lexicon for water, shelter, food, rock, danger, strangers, and trade;
- event-specific utterances;
- productive morphology and syntax;
- borrowing and contact effects;
- dialect continua;
- mutual intelligibility;
- contextual diplomacy and richer social pragmatics.

## 5. Prior testing status

The preceding conversation reported that the 2.11 code passed a Node syntax check and Chromium testing to 1,000 turns. It also reported a comparison of 2.10 and 2.11 through 1,020 turns with matching geology/city statistics, intended to show that the language RNG did not perturb the existing simulation streams.

These are prior assistant-reported results. They have not been independently rerun as part of this repository bootstrap. A successor must inspect the code and repeat the relevant tests before treating them as verified.

## 6. Current user direction

The current direct project instructions establish:

1. Use Satobloc/KleineMcKnightMusic as the home for this project, as a secondary workspace distinct from the music workshop's main purpose.
2. Learn primarily from HsH and relevant Satobloc repository methods for project continuity, workflow tracking, operation receipts, handoffs, and adaptive attention management.
3. Preserve the project-relevant content of conversations in the repository so sudden context limits do not erase the working state. This is not a request to mirror the repositories generally.
4. The user's independent file backups are already being maintained by the user.
5. The attention/turn ticker must be tailored to this project and continuously optimized.
6. The HsH interactive-heartbeat restart trigger is recommended even though the Big Push deployment record says its ChatGPT task overlay is not installed. Deployment status and recommendation status must not be conflated.
7. Language mechanics are the current focus; geology development is paused.

## 7. Workflow design adopted for this project

The initial pilot uses:

- a tiny boot capsule;
- one active tray;
- a durable control shelf;
- a priority-aware branching queue;
- dated decisions and operation receipts;
- a project-specific interactive heartbeat;
- a context-limit succession protocol;
- a GitHub Actions structural/freshness check;
- a tailored eight-slot turn ticker;
- a separate completed-operation counter.

The attention cycle advances once per substantive assistant response. The operation counter advances only after a bounded operation has a checkable result or explicit disposition and a verified receipt. The two counters are not interchangeable.

The proposed eight attention slots are: re-entry and scope; simulation substrate; language engine; culture and contact; instrumentation; integration and regression; exploration and cross-pollination; executive review and replan. The geology slot is maintenance-only while geological development remains paused.

## 8. Exact next actions

1. Preserve Cities Laboratory 2.11 in the repository and verify its hash, syntax, behavior, and independent readback. This is the current blocked operation because the exact HTML file has not yet been transferred into the repository.
2. Audit Language Kernel 0.1 against the actual code.
3. Design productive language mechanics and event-specific utterances.
4. Add social diffusion, contact, dialect, borrowing, and intelligibility only after the language data model is clear.

## 9. Repository bootstrap receipt

The project home is now present in Satobloc/KleineMcKnightMusic at SIMULATION_WORKDESKS/WELL_FUCK/. The root README links to it.

The bootstrap and continuity scaffolding were published and verified through these commits:

- 37997b4d8b3841760b839d3c6ae6ddde5065732b — initial project home and control records.
- 5fcd3cfd6540a0b7b470b1cfea251fe60c0034ed — inclusive heartbeat threshold correction.
- b732a2a50467b486e5e95ba513cd1057a1f638af — expanded boundary tests.
- 5322e9d7b49e3212ddaac3ed003e2ce20400ace5 — freshness check on every relevant project validation.

Verified workflow runs:
- Well, Fuck. Continuity 43552338761: SUCCESS.
- Well, Fuck. Continuity 43552401004: SUCCESS.
- Source Hopper Checks 43552401001: SUCCESS.
- Well, Fuck. Continuity 43552468360: SUCCESS, including the live heartbeat freshness check.

The first continuity run failed because an exactly 36-hour-old heartbeat was not classified as stale. The comparison was corrected from greater-than to greater-than-or-equal, and the boundary test now passes.

The HTML simulation file remains local-only. Do not treat this repository bootstrap as proof that the executable has been committed.

## 10. Method references

The workflow is adapted from HsH's Primary Operational Guideline, Sections 8–10; Big Push worker recommendations; the first-blush pin/ticker pilot; and the Big Push succession protocol. These references are operational methods, not authority for the simulation's fictional or scientific content.

Relevant local creative-repository research includes the 2026-11-10 symbolic-language/phonetics/music-grammar raw dump and the representational-languages idea mine. Treat these as exploratory source material and preserve the distinction between published research, community reports, and our own hypotheses.
