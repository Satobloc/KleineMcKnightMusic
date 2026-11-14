# Well, Fuck. — Project Control

**Status:** ACTIVE  
**Plan:** PROJECT_PLAN.md, version 1.0 (adopted baseline; amendable)  
**Phase:** 3 / productive language core  
**Priority:** P1 productive language design and implementation  
**Workspace:** Satobloc/KleineMcKnightMusic/SIMULATION_WORKDESKS/WELL_FUCK/  
**Project authority:** Nathan's direct instructions govern intent and priority. This file and the other workspace records are assistant-maintained execution records, not user-authored doctrine or scientific authority.

## Purpose and scope

Build and study a stochastic, browser-based cavern-civilization simulation with emergent environments, settlements, language, and culture. The project is a creative computational experiment. It does not claim that its current rules constitute validated geology, linguistics, anthropology, or a predictive model of real civilizations.

The current priority is linguistic mechanics. Geology expansion is paused. Preserve the existing geological simulation and change it only when needed for maintenance, integration, or an explicitly reprioritized task.

## Current state

- Latest prototype: Cities Laboratory 2.12, with presentation-RNG isolation.
- Latest artifact: `builds/Well_Fuck_Cities_Lab_2_12.html`, 1,549,658 bytes.
- 2.12 SHA-256: `0c26d03352d270cb0f3ff3771a0abd5cf542e5a3e1a8ff944a154d96f9f6f486`.
- 2.12 commit: `6241026fabccb413eea6630605fdb68a36db3e70`; blob: `2be28e6df39bec77067dd147462fbf1799378a94`.
- 2.11 remains preserved unchanged as the baseline: SHA-256 `1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05`.
- Repository path: `builds/Well_Fuck_Cities_Lab_2_11.html`.
- Repository commit: `4e2df3cb073b4b4dceefddf54831edab1378c17a`; blob: `67d17e7efac74434570f36f6b3f726e945db6f1e`.
- Source SHA-256 was verified locally; independent repository blob readback matched the full source text exactly.
- Node syntax check passed. Playwright/Chromium completed 1,000 turns without page exceptions or console errors.
- Seed-42 comparison of 2.10 and 2.11 through 1,000 turns produced identical sampled physical/city statistics and identical main-canvas screenshot hashes.
- Previous local prototype: Cities Laboratory 2.10, SHA-256 `90fd48b8e7f15c62bc7dacbcadcc73c5a46c21f142d197e52220d0ff7a253f19`.
- Language Kernel 0.1 has been audited; findings are in LANGUAGE_KERNEL_AUDIT.md.
- WF-LANG-004 is complete: 2.12 gives notebook sampling its own presentation RNG.
- WF-TEST-001 is complete: automated language-RNG tests and optional Playwright browser regression passed at seeds 42, 7, and 2026 through 1,000 turns.
- Productive grammar, broad lexicon, event-specific utterances, borrowing, dialect continua, and mutual intelligibility remain future work.
- The first productive-language proposal is in LANGUAGE_MODEL_DESIGN.md; it is reviewable, not yet an approved implementation contract.
- Prior conversation reported Chromium runs and a comparison intended to show that language RNG did not alter geology/city outcomes. Those are historical assistant-reported results and have not been independently rerun in this repository bootstrap.

## Phase plan and exit evidence

The canonical roadmap and detailed phase gates live in PROJECT_PLAN.md. The executive sequence is:

| Phase | Purpose | Exit evidence |
|---|---|---|
| 0. Repository and continuity bootstrap | Establish project home and control system | COMPLETE: controls read back; continuity and repository test workflows pass |
| 1. Prototype preservation | Preserve Cities Laboratory 2.11 exactly and verify its behavior | COMPLETE: committed artifact, checksum, independent readback, syntax check, and 1,000-turn browser run |
| 2. Language-kernel audit and baseline | Inspect actual implementation and establish reproducible tests | COMPLETE: audit, 2.12 RNG correction, automated and three-seed browser regression |
| 3. Productive language core | Add concepts, lexicon, phonology, morphology, syntax, semantics, composition | ACTIVE: review LANGUAGE_MODEL_DESIGN.md and settle the first schema | Novel compositional utterances, inspectable data, tests |
| 4. Contextual speech | Generate utterances grounded in actual simulation events | Traceable event-linked speech examples and tests |
| 5. Social language evolution | Develop contact, borrowing, dialect divergence, and intelligibility | Explicit rules and repeatable experiments |
| 6. Civilization integration | Connect language to social processes | At least one traceable end-to-end social process |
| 7. Experiment and refinement | Compare rules, measure outcomes, and prune weak mechanics | Reproducible experiments and evidence-led decisions |
| 8. Release and maintenance | Package stable builds and preserve continuity | Versioned build, known identity, verified tests, current controls |

Phases are revisitable. A phase is not complete merely because a narrative description exists.

## Priority rules

1. Preserve project intent and continuity before extending features.
2. Preserve the current 2.11 artifact and establish a verified repository copy.
3. Work on language mechanics before resuming geology expansion.
4. Keep language RNG independent from geology/city RNG unless a deliberate, tested design change is approved.
5. Keep UI/presentation randomness out of simulation RNG streams; observational controls must not change future world or language evolution.
5. New features enter through a bounded operation with a stop condition and a verification plan.
6. Keep speculative mechanics distinguishable from implemented and tested behavior.

## State vocabulary

- ACTIVE: one bounded operation is currently being executed.
- READY: a branch has enough information to be selected.
- BLOCKED: an explicit dependency prevents progress; record what would unblock it.
- PARKED: worthwhile but not currently eligible or important enough to displace the active operation.
- COMPLETE: the defined stop condition was met and a receipt was recorded.
- STOPPED: deliberately ended with a reason and preserved result.

Do not mark a branch complete from intention, a plan, or an unverified claim.

## Current control pointers

- Canonical roadmap: PROJECT_PLAN.md.
- Single active operation: ACTIVE_TRAY.md.
- Priority and dependency map: WORK_QUEUE.md.
- Dated decisions: DECISION_LOG.md.
- Completed operation receipts: OPERATION_LOG.md.
- Interactive heartbeat: HEARTBEAT.md.
- Language implementation audit: LANGUAGE_KERNEL_AUDIT.md.
- Productive-language proposal: LANGUAGE_MODEL_DESIGN.md.
- Execution and ticker method: WORKFLOW_PROTOCOL.md.
- Context handoff: SUCCESSION.md.

## Review gates

Review scope, dependencies, parked branches, source freshness, test coverage, and procedural overhead after every five completed operations or at a phase gate, whichever comes first. Review the heartbeat threshold and scheduled-check cadence after five completed operations or 14 calendar days, whichever comes first. These are project pilot parameters, not inherited HsH requirements. Record KEEP / CHANGE / PARK / RETIRE decisions with evidence. Conduct a wider project review at a cadence that proves useful for the actual work; weekly is a candidate, not an obligation. Do not add process merely to make the paperwork look complete.
