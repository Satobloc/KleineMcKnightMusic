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
**Status:** PILOT  
**Decision:** Use a project-specific turn-based attention ticker plus a separate completed-operation counter. The turn ticker advances once per substantive assistant response; the operation counter advances only after a bounded operation has a checkable result or explicit disposition and a verified receipt.  
**Provenance:** Adaptation of HsH methodology and Nathan's instruction that the ticker be tailored and continuously optimized.  
**Review:** Evaluate after five completed operations or a phase gate. Do not conflate attention rotation with completed work.

## D-008 — Interactive-heartbeat restart recommendation

**Date:** 2026-11-13  
**Status:** RECOMMENDED / PARTIALLY IMPLEMENTED  
**Decision:** Adopt the HsH 36-hour interactive-heartbeat freshness threshold as a project-specific re-entry trigger. A GitHub Actions check runs every six hours and on every relevant project validation; it fails visibly when the heartbeat is stale. The check does not launch a ChatGPT worker or refresh the heartbeat.  
**Provenance:** HsH Big Push continuity recommendations, clarified by Nathan.  
**Boundary:** No existing ChatGPT scheduled-task identity, schedule, phase, or enabled state is modified.
