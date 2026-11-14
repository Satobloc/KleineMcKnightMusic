# Work Queue

The queue is a branching priority map, not a second active tray. Only the operation named in ACTIVE_TRAY.md is active at one time.

| ID | Priority | Status | Purpose / next action | Dependency or return trigger |
|---|---:|---|---|---|
| WF-BOOT-001 | P0 | COMPLETE | Establish and verify project home and continuity scaffold | Receipt in OPERATION_LOG.md |
| WF-SIM-001 | P0 | COMPLETE | Preserve Cities Laboratory 2.11 exactly; verify checksum, independent readback, syntax, and 1,000-turn browser run | Receipt in OPERATION_LOG.md |
| WF-LANG-001 | P1 | COMPLETE | Audit Language Kernel 0.1 against the committed source; map data model, sound-change pipeline, phrase lineage, community inheritance, and RNG boundaries | Audit in LANGUAGE_KERNEL_AUDIT.md |
| WF-LANG-004 | P1 | COMPLETE | Decouple “Overhear locals” UI sampling from the language simulation RNG; publish and verify 2.12 | Receipt in OPERATION_LOG.md; 2.11 preserved |
| WF-TEST-001 | P1 | COMPLETE | Establish repeatable seeded tests for UI-action independence and multi-seed 2.11/2.12 physical/city regression | Node test in CI; optional Playwright browser test and three-seed receipts |
| WF-LANG-002 | P1 | ACTIVE | Specify and calibrate a usage-driven population model from contemporary informal English; build a standalone lab and test before integration | LANGUAGE_CHANGE_LAB_DESIGN.md v0.1; frozen corpus manifest and E0–E4 results pending |
| WF-LANG-003 | P1 | QUEUED | Build the first event-grounded productive utterance generator | WF-LANG-002 research and change-model design accepted |
| WF-SOC-001 | P2 | QUEUED | Explore contact, borrowing, dialect continua, divergence, and mutual intelligibility | Language production and community state available |
| WF-CIV-001 | P2 | QUEUED | Integrate language with trade, migration, conflict, settlement identity, and social organization | WF-LANG-003 |
| WF-GEO-001 | P3 | PARKED | Resume geological feature development only when language milestone or user reprioritization permits | Geology is explicitly paused |
| WF-EXP-001 | P3 | PARKED | Lateral experiments and cross-domain representational ideas | Activate during exploration/review when useful |

## Queue rules

- A new discovery may create a branch, but it does not silently replace the active operation.
- Every branch needs an ID, purpose, status, dependency, one next action, and a return trigger.
- A blocked branch stays visible and does not count as completed.
- The active tray is the only source of truth for what is being executed now.
- PROJECT_PLAN.md is the canonical phase roadmap; this queue tracks operation-level execution and dependencies.
- Presentation/UI interactions must not consume simulation RNG streams; this guardrail is recorded in DECISION_LOG.md.
- The 2.11 artifact remains preserved. New builds use new versioned filenames; do not overwrite the baseline.
