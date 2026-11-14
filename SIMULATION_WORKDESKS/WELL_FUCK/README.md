# Well, Fuck.
## A Stochastic Speleological Civilization Simulator

**Project status:** ACTIVE WORKSHOP  
**Workspace role:** Secondary creative-systems project inside Satobloc/KleineMcKnightMusic  
**Canonical roadmap:** PROJECT_PLAN.md  
**Canonical control:** PROJECT_CONTROL.md  
**Boot sequence:** BOOT.md  
**Current focus:** Linguistic mechanics  
**Geology work:** PAUSED except for maintenance needed to preserve integration

## Project

Well, Fuck. is a browser-based stochastic 2D cavern and civilization simulation. Its initial creative image is a vast underground world of cavern shelves, settlements, and underwater bubble cities. The simulation grows an environment and its inhabitants through interacting local processes, with a deliberately irreverent narrative voice.

The project is a creative computational system, not a validated geological or sociological model. Real-world scientific claims require separate evidence and validation.

## Current prototype

The latest known prototype is **Cities Laboratory 2.11**, with Language Kernel 0.1.

- Source artifact: Well_Fuck_Cities_Lab_2_11.html
- Source size: 1,549,198 bytes
- Source SHA-256: `1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05`
- Planned repository path: `builds/Well_Fuck_Cities_Lab_2_11.html`
- Publication and independent verification: IN PROGRESS. Do not treat the source hash or a prepared Git blob as proof of a completed repository commit.

The preceding prototype, Cities Laboratory 2.10, has local SHA-256 `90fd48b8e7f15c62bc7dacbcadcc73c5a46c21f142d197e52220d0ff7a253f19`.

### Current simulation concepts

- Grid cells distinguish void, rock, purple cavern/stalactite, mossy green terrain, and water.
- Fractures spread; granular debris falls, lands, darkens, compacts, and erodes.
- Vegetation spreads and changes color.
- Settlements and buildings grow on green terrain, with placement influenced by water and neighboring buildings. Buildings can be lost when their support is removed or debris contacts them.
- The visual environment has layered cavern/collapse states, with deeper collapse exposing successive underlayers.

### Language Kernel 0.1

- Speech communities are associated with settlement clusters.
- Nearby new buildings generally inherit the local community language; rare remote foundations can become daughter communities and diverge.
- The initial proto-expression is “Well, fuck.”, represented as /wɛl fʌk/.
- Communities independently adopt founder phrases, then evolve them through expansion, reduction, replacement, reordering, reduplication, fusion, splitting/resegmentation, semantic drift, and occasional idiom replacement.
- IPA phoneme sequences are the authoritative sound representation.
- Sound changes apply across a community's lexicon and have a recorded history.
- Language randomness is intended to be separate from geology/city randomness; source inspection and seeded regression tests must establish the actual behavior.
- A Phrase Field Notebook records community, phrase, IPA, working gloss, phoneme inventory, sound changes, phrase lineage, contextual samples, and overheard speech.

The kernel is an initial phrase-evolution layer, not yet a complete productive language. Productive lexicon, morphology, syntax, contextual utterances, borrowing, dialect continua, and mutual intelligibility remain future work.

## Start here

1. Read BOOT.md.
2. Read PROJECT_CONTROL.md and PROJECT_PLAN.md.
3. Read ACTIVE_TRAY.md and WORK_QUEUE.md.
4. Read WORKFLOW_PROTOCOL.md when planning, executing, or reviewing a substantial operation.
5. Read SUCCESSION.md when handing off or recovering from a context limit.
6. Read the dated session checkpoint for conversation-derived project state.

## Workspace map

| File | Function |
|---|---|
| BOOT.md | Tiny launch capsule and load order |
| PROJECT_PLAN.md | Adopted, amendable roadmap and phase gates |
| PROJECT_CONTROL.md | Executive control shelf and current status |
| ACTIVE_TRAY.md | One bounded operation in focus |
| WORK_QUEUE.md | Priority-aware branches and parked work |
| DECISION_LOG.md | Dated decisions and their provenance |
| OPERATION_LOG.md | Completed operation receipts |
| HEARTBEAT.md | Project-specific interactive heartbeat |
| WORKFLOW_PROTOCOL.md | Execution, evidence, turn ticker, operation ticker, review |
| SUCCESSION.md | Context-limit and conversation handoff procedure |
| SESSION_CHECKPOINT_2026-11-13.md | Project-specific checkpoint distilled from the originating conversation |

## Public-repository boundary

This is a public repository. Store project-specific state, code cleared for publication, methods, test results, and concise conversation-derived checkpoints. Do not commit raw ChatGPT exports, unrelated private conversation material, personal data, credentials, copyrighted lyrics, private recordings, or rights-restricted source material. The checkpoint is an assistant-prepared project record, not a verbatim transcript.

## Method references

The project borrows operational methods, not subject-matter authority, from:

- HsH Primary Operational Guideline, Sections 8–10: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/NATHAN_DIRECT_2026-11-08_METHODOLOGY_AND_MODEL_OVERVIEW.md
- Big Push worker recommendations: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/BIG_PUSH/WORKER_RECOMMENDATIONS.md
- Big Push succession protocol: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/BIG_PUSH/SUCCESSION.md

Relevant creative-representation research already in this repository includes EXTERNAL_MINING/raw_dumps/2026-11-10-symbolic-language-phonetics-and-musical-grammar.md and EXTERNAL_MINING/idea_mines/2026-11-10-representational-languages-for-music.md. These are idea sources, not evidence that the simulation's language model behaves in any particular way.
