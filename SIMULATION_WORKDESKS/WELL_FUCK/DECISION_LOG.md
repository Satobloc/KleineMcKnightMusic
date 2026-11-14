# Decision Log

Dated decisions are preserved with their provenance and status. A decision may be revised, but its earlier state is not silently erased.

## D-001 — Project home

**Date:** 2026-11-13  
**Status:** CONFIRMED  
**Decision:** Use Satobloc/KleineMcKnightMusic as the repository home for Well, Fuck. as a secondary creative-systems project, with a distinct workspace directory.  
**Provenance:** Nathan's direct instruction in the originating conversation.  
**Rationale:** The creative repository is an appropriate home for an experimental computational/creative system while retaining separation from the main music workshop.

## D-002 — Methodological references

**Date:** 2026-11-13  
**Status:** CONFIRMED  
**Decision:** Learn primarily from HsH and the relevant Satobloc repository methods for continuity, branching work, evidence, operation tracking, handoffs, and adaptive workflow. Do not import HsH/SAT subject-matter claims into this simulation by implication.  
**Provenance:** Nathan's direct instruction.

## D-003 — Conversation preservation

**Date:** 2026-11-13  
**Status:** CONFIRMED  
**Decision:** Preserve the project-relevant content of conversations as compact, source-labelled project checkpoints and continuously refreshed control records. Do not treat a public repository as a destination for raw private conversation exports or unrelated conversation content.  
**Provenance:** Nathan's clarification in the originating conversation.  
**Boundary:** This is a project-state backup, not a verbatim transcript archive.

## D-004 — Development priority

**Date:** 2026-11-13  
**Status:** CONFIRMED  
**Decision:** Pause geology development and prioritize linguistic mechanics. Preserve the existing geology/civilization substrate unless maintenance or integration requires a change.  
**Provenance:** Current project direction carried forward in the conversation.

## D-005 — Language representation

**Date:** 2026-11-13  
**Status:** WORKING DESIGN  
**Decision:** Keep IPA phoneme sequences as the authoritative sound representation for the language kernel. Treat written phrases, glosses, and orthographies as related but distinct projections.  
**Provenance:** Current Language Kernel 0.1 implementation notes and the user's established preference for IPA in phonemic work.  
**Review:** Revisit when productive phonology, morphology, or orthographic variation is designed.

## D-006 — Independent random streams

**Date:** 2026-11-13  
**Status:** WORKING DESIGN  
**Decision:** Keep language randomness separate from geology/city randomness so linguistic evolution cannot perturb the other simulation streams.  
**Provenance:** Language Kernel 0.1 implementation notes.  
**Review:** Confirm against the actual source and seeded regression tests before treating as verified behavior.

## D-007 — Hybrid project ticker

**Date:** 2026-11-13  
**Status:** PILOT / PROJECT-SPECIFIC  
**Decision:** Use a tailored attention ticker plus a separate completed-operation counter. The initial attention cycle has five project-specific modes: (1) re-entry and scope, (2) language engine, (3) simulation integration and culture, (4) instrumentation and verification, and (5) exploration and executive replan. The attention slot advances once per substantive assistant response; the operation counter advances only after a bounded operation has a checkable result or explicit disposition and a verified receipt.  
**Provenance:** Nathan's direction to adapt useful HsH/Satobloc methods without inheriting their project-specific implementation.  
**Review:** Evaluate the ticker after five completed operations or a phase gate. It is a working aid, not a mandatory sequence; skip, reorder, merge, or replace slots when the actual work warrants it.

## D-008 — Interactive heartbeat and re-entry alert

**Date:** 2026-11-13  
**Status:** PILOT / PROVISIONAL SETTINGS  
**Decision:** Maintain an interactive heartbeat and a stale-state re-entry alert. The transferable lesson is the mechanism, not HsH's specific timing or implementation. Initial pilot settings are a 36-hour stale threshold and a six-hour scheduled check, selected as starting hypotheses only. They are not requirements, not presumed optimal, and may be changed or removed after observing this project's actual interruption patterns, work cadence, and alert overhead. The check does not launch a ChatGPT worker or refresh the heartbeat.  
**Provenance:** HsH Big Push continuity work as methodological inspiration; project-specific selection remains under our control.  
**Review:** Reassess after five completed operations or 14 calendar days, whichever comes first. Record evidence and KEEP / CHANGE / RETIRE the threshold and schedule independently.

## D-009 — Method transfer, not implementation inheritance

**Date:** 2026-11-13  
**Status:** CONFIRMED  
**Decision:** Treat HsH and other Satobloc repositories as methodological sources. Extract useful principles, inspect why they work, and redesign their implementation for Well, Fuck.'s own objectives, risks, scale, and creative workflow. No inherited schedule, threshold, ticker shape, task count, architecture, or control ritual is binding merely because another repository uses it.  
**Provenance:** Nathan's direct clarification in this conversation.

## D-010 — Adopt an amendable project-plan baseline

**Date:** 2026-11-13  
**Status:** CONFIRMED  
**Decision:** Adopt PROJECT_PLAN.md version 1.0 as the working roadmap for Well, Fuck. The plan is locked as the default direction, not made immutable: consequential amendments increment its version, preserve prior history through Git, and are recorded in this decision log when they change mission, priority, phase order, or design commitments. Nathan's direct instruction overrides assistant-maintained planning records.  
**Provenance:** Nathan's direct instruction to make a plan, lock it in in a modifiable way, and move forward.


## D-011 — Presentation/UI randomness must not perturb simulation evolution

**Date:** 2026-11-13  
**Status:** CONFIRMED  
**Decision:** UI-only sampling and observational controls should not consume or alter the random streams governing world or language evolution. Use a separate presentation RNG or a stateless deterministic selector.  
**Provenance:** Source-grounded Language Kernel 0.1 audit and paired same-seed browser experiment. One “Overhear locals” click at turn 100 changed the turn-1000 language phrase while leaving city/geology statistics and the main-canvas image unchanged.  
**Review:** Confirm the correction with a regression test. Revisit only if a future interaction is deliberately designed to affect simulation state.


## D-012 — Separate presentation RNG in Cities Laboratory 2.12

**Date:** 2026-11-13  
**Status:** CONFIRMED  
**Decision:** “Overhear locals” and other observational sampling use a dedicated presentation RNG, initialized from the world seed with a distinct seed transform. They do not consume the language simulation RNG or physical/city RNG.  
**Provenance:** Implemented in Cities Laboratory 2.12 and tested against 2.11 at seeds 42, 7, and 2026 through 1,000 turns. UI interaction preserved language output, physical statistics, and the main-canvas image in all three tested seeds.  
**Boundary:** This confirms the current presentation/simulation separation; it does not establish that each speech community has its own independent RNG stream.

## D-013 — Productive language architecture proposal

**Date:** 2026-11-13  
**Status:** PROPOSAL / NOT YET ADOPTED  
**Decision:** Use LANGUAGE_MODEL_DESIGN.md as the reviewable proposal for a meaning-first, compositional language engine. It proposes message frames, concept IDs, community lexicons, a small grammar profile, and an inspectable realization pipeline.  
**Provenance:** WF-LANG-002 design work.  
**Review:** Nathan's feedback is required before the proposal becomes an implementation contract.
