# Work Queue

The queue is a branching priority map, not a second active tray. Only the operation named in ACTIVE_TRAY.md is active at one time.

| ID | Priority | Status | Purpose / next action | Dependency or return trigger |
|---|---:|---|---|---|
| WF-BOOT-001 | P0 | COMPLETE | Establish and verify project home and continuity scaffold | Receipt in OPERATION_LOG.md |
| WF-SIM-001 | P0 | ACTIVE | Preserve Cities Laboratory 2.11 in the repository; verify hash, syntax, runtime behavior, RNG separation, and independent readback | Exact source is available; finish publication and verification |
| WF-LANG-001 | P1 | QUEUED | Audit Language Kernel 0.1 against the committed source; map data model, sound-change pipeline, phrase lineage, community inheritance, and RNG boundaries | WF-SIM-001 |
| WF-TEST-001 | P1 | QUEUED | Establish seeded reproducibility and regression tests, including language/geology-city RNG isolation | WF-SIM-001; refine after language changes |
| WF-LANG-002 | P1 | QUEUED | Design productive lexical and grammatical machinery: concepts, phonological forms, morphology, syntax, semantic relations, and composition | WF-LANG-001 |
| WF-LANG-003 | P1 | QUEUED | Develop event-specific speech acts and contextual utterances tied to actual simulation events | WF-LANG-002 |
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
