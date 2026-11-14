# Well, Fuck. — Living Project Plan

**Plan ID:** WF-PLAN-001  
**Version:** 1.2  
**Status:** ADOPTED BASELINE / AMENDABLE  
**Adopted:** 2026-11-13  
**Project status:** ACTIVE WORKSHOP  
**Current phase:** 3 — Productive language core  
**Canonical roadmap:** This file

## 1. What is locked, and what is not

This is the project's adopted working baseline. "Locked" means that the mission, current priorities, and development sequence below are the default direction until Nathan changes them or a documented review produces an amendment. It does **not** mean the plan is immutable, that every implementation detail is already decided, or that a proposed feature must be built regardless of what the evidence shows.

Amend the plan in place, increment its version, add a dated entry to the change history below, and record consequential changes in DECISION_LOG.md. Git history preserves earlier versions. Do not silently replace a decision or create a parallel plan just because the current one needs revision. Nathan's direct instruction takes precedence over this assistant-maintained plan.

- Minor version: sequencing, milestones, scope detail, or implementation approach changes without changing the mission.
- Major version: a material change to the mission, project identity, or core design commitments.
- A phase review or five completed operations is a natural review point, not a barrier to making a necessary change sooner.

## 2. Mission and north star

Build **Well, Fuck.**, a playful, inspectable, stochastic speleological civilization simulator: an evolving underground world in which physical processes create habitable spaces, settlements emerge and change, and communities develop languages and cultures over time.

The intended result is not merely a cave generator with buildings or a collection of decorative invented phrases. It is a small computational world whose geology, ecology, settlement patterns, language, and social behavior can interact to produce histories worth observing.

This is a creative computational experiment. It is not presently a validated geological, linguistic, anthropological, or predictive model of real-world systems. Scientific claims require separate evidence.

## 3. Design commitments

1. **Emergence over scripted spectacle.** Prefer local rules and interacting processes that can produce varied outcomes over hand-authored sequences that only imitate emergence.
2. **Inspectable worlds.** Expose enough state, history, and instrumentation to understand why a run developed as it did.
3. **Language is a system, not a label.** Develop sound, words, meanings, grammar, contextual use, transmission, and variation as connected but distinguishable mechanisms.
4. **Preserve working behavior.** Keep a known-good simulation baseline. New mechanics should not casually rewrite the physical or settlement substrate.
5. **Reproducible stochasticity.** Record seeds and preserve independent random streams where subsystem independence is intended. Verify this with tests rather than relying on comments or design intent.
6. **Incremental, testable development.** Make bounded changes with explicit stop conditions, inspectable artifacts, and regression evidence.
7. **Creative latitude with honest labels.** Keep implemented behavior, tested behavior, prior reports, hypotheses, and speculative ideas visibly distinct.
8. **Process serves the work.** Repository controls and continuity methods should reduce lost work and drift, not become a second project that consumes the first.
9. **Presentation does not steer the simulation.** UI-only actions and observational sampling must not consume or perturb the random streams that govern world or language evolution.

## 4. System map

The project is organized into five interacting layers. This is a conceptual map, not a requirement to split the current single-file prototype into separate modules immediately.

| Layer | Responsibility | Current position |
|---|---|---|
| Physical world | Cavern geometry, rock, fractures, collapse, water, light/radiation, substrate, vegetation | Existing substrate; feature development paused |
| Settlement | Buildings, settlement clusters, local viability, founding, survival, loss | Existing and active as integration substrate |
| Language | Speech communities, phonology, lexicon, meaning, grammar, utterance formation | Language Kernel 0.1 exists; primary development focus |
| Social and cultural dynamics | Inheritance, contact, borrowing, dialects, shared conventions, trade and other interactions | Mostly future work |
| Observation and experimentation | Notebooks, logs, seeds, diagnostics, metrics, regression tests, build records | Partial; expand alongside mechanics |

The current browser prototype may remain a single HTML artifact while that is the most efficient development and distribution format. Modularization is an option to evaluate when code size, testability, or collaboration makes it worthwhile, not a goal in itself.

## 5. Development roadmap and phase gates

Phases are evidence gates, not calendar deadlines. They may be revisited or resequenced when inspection shows a better route. Each phase should produce an artifact or testable result.

### Phase 0 — Repository and continuity bootstrap
**Status:** COMPLETE

Establish the project home, launch sequence, active tray, queue, decision and operation records, heartbeat, succession protocol, and structural checks.

**Gate:** The live repository contains the control system; independent readback and the continuity workflow verify it.

### Phase 1 — Preserve the prototype
**Status:** ACTIVE

Preserve Cities Laboratory 2.11, including Language Kernel 0.1, as an identifiable repository artifact without rewriting or normalizing the source.

**Gate:** The committed file matches the source checksum; its blob and commit are recorded; independent readback succeeds; syntax and a 1,000-turn browser run have checkable results; a restorable baseline is identified. Broader multi-seed regression remains part of Phase 2.

### Phase 2 — Audit the language kernel and establish the baseline
**Status:** COMPLETE
Inspect the actual 2.11 source. Map language state, lexicon representation, IPA handling, founder-phrase selection, mutation operations, sound-change application, community inheritance, event timing, UI/notebook behavior, and all random-number call paths.

In parallel, establish repeatable baseline tests for reset behavior, seeded runs, turn stepping, language/geology-city RNG isolation, and independence from UI-only interactions. The initial audit found that “Overhear locals” currently consumes the language simulation RNG.

**Gate:** COMPLETE. The source-grounded audit is in LANGUAGE_KERNEL_AUDIT.md. The 2.12 UI-RNG correction and regression tests are recorded in OPERATION_LOG.md; three seeds were checked through 1,000 turns, with matching 2.11/2.12 physical outputs and no UI-induced language divergence.

### Phase 3 — Build a productive language core
**Status:** ACTIVE
Design and implement the foundations needed to create new utterances rather than only mutate a fixed stock of phrases. The first reviewable proposal is LANGUAGE_MODEL_DESIGN.md; it is not an approved implementation contract. Work through the following design areas, allowing the audit to determine their exact order:

- a useful concept and semantic inventory, initially covering the world inhabitants' practical environment and social life;
- phoneme inventories, phonotactics, syllable and word formation, and regular sound change;
- lexemes with forms, meanings, grammatical behavior, and semantic relations;
- productive morphology and syntax;
- compositional utterance generation and a way to represent intended meaning separately from surface form.

IPA remains the authoritative sound representation unless a logged design review changes that decision. Orthography, surface spelling, gloss, and meaning remain distinct data.

**Gate:** The system can generate and interpret novel, compositional utterances from structured meanings, with tests and inspectable examples.

### Phase 4 — Give language contextual use
Connect speech to actual simulation state and events. Develop speech acts and context-sensitive utterances for situations such as danger, discovery, shelter, food, water, visitors, loss, cooperation, and exchange. The event list is a candidate starting set, not a fixed vocabulary mandate.

Replace or extend arbitrary sample contexts with speech grounded in events that actually occurred. Preserve speaker/community identity and enough context to inspect why an utterance was produced.

**Gate:** Reproducible event scenarios generate contextually relevant utterances with traceable meaning and community form.

### Phase 5 — Develop social language evolution
Build on the existing settlement/community inheritance model. Explore founder effects, daughter communities, divergence, contact, borrowing, convergence, dialect continua, and degrees of mutual intelligibility.

Do not assume that geographic distance alone determines linguistic distance. Let the rules and experiments establish the relationship between settlement structure, contact, and language change.

**Gate:** Seeded experiments show explainable variation across communities, and intelligibility/contact measures have explicit definitions and tests.

### Phase 6 — Integrate language and civilization
Connect language to social processes such as trade, migration, cooperation, conflict, identity, and diplomacy. Start with observable communication around events. Only make language causally affect civilization outcomes when a defined mechanism and test justify it.

**Gate:** At least one end-to-end social process uses language in a traceable way without destabilizing unrelated simulation systems.

### Phase 7 — Experiment, measure, and refine
Run repeatable seeded experiments; compare alternative rules; inspect emergent diversity, stability, community differentiation, utterance quality, intelligibility, and performance. Treat proposed metrics as hypotheses until they prove useful.

**Gate:** The project has a compact experiment suite, results ledger, and evidence-based decisions about which mechanics to keep, change, or retire.

### Phase 8 — Package and maintain
Maintain versioned builds, concise change notes, reproducible tests, and a clean succession state. Release only when a build has a known identity and its stated tests have actually passed.

**Gate:** A user can retrieve the build, understand its changes and limitations, run it, and resume development from the repository records.

## 6. Priority and scope rules

- **Current primary lane:** language mechanics.
- **Current prerequisite:** preserve and audit the 2.11 prototype before substantial language redesign.
- **Geology:** paused for new feature development. Maintenance and changes strictly necessary for integration are allowed; broader geological work requires explicit reprioritization.
- **Settlement/civilization:** preserve the existing substrate and use it as the social context for language development.
- **Testing:** cross-cutting. Add tests with the mechanics they protect; do not postpone all verification until Phase 7.
- **Exploration:** new ideas may be recorded and parked. They do not silently displace the active operation.
- **No arbitrary deadlines:** prioritize by dependency, risk reduction, and creative value until a real external deadline exists.

## 7. Immediate execution sequence

1. **WF-SIM-001 — Preserve Cities Laboratory 2.11.** COMPLETE: exact artifact committed, read back, syntax-checked, and browser-tested through 1,000 turns.
2. **WF-LANG-001 — Audit Language Kernel 0.1.** COMPLETE: source-grounded implementation map and limitations are in LANGUAGE_KERNEL_AUDIT.md.
3. **WF-LANG-004 — Decouple notebook/UI sampling from simulation RNG.** COMPLETE: Cities Laboratory 2.12 uses a separate presentation RNG; the 2.11 baseline remains unchanged.
4. **WF-TEST-001 — Establish reproducibility tests.** COMPLETE: automated Node language-RNG regression plus optional Playwright browser regression; seeds 42, 7, and 2026 passed through 1,000 turns.
5. **WF-LANG-002 — Design the productive language model.** ACTIVE: review LANGUAGE_MODEL_DESIGN.md, settle the minimal concept/message/lexeme model, and define the first implementation gate.
6. Proceed to contextual speech, social evolution, and civilization integration through the gates above.

The queue in WORK_QUEUE.md owns operation-level status and dependencies. ACTIVE_TRAY.md names the one operation currently being executed.

## 8. Evidence and completion standard

A phase or operation is not complete because its design has been described or its code has been written. Completion requires the declared stop condition and a checkable receipt. For code work, preserve as relevant:

- exact source and output paths;
- repository branch, commit, and blob identities;
- checksum and independent readback;
- seed, environment, command, and test range;
- test results, failures, warnings, and unverified areas;
- known behavior changes and regression comparisons.

A failed or inconclusive test is useful evidence when recorded honestly. It is not a reason to conceal uncertainty or to claim completion.

## 9. Plan amendment and review

At a phase gate, after five completed operations, or whenever new evidence materially changes the best route, review:

- whether the mission and priorities still fit;
- whether dependencies and phase order remain sensible;
- whether the language work is becoming productive and observable;
- whether the physical and settlement substrate is being preserved;
- whether instrumentation and tests catch meaningful regressions;
- whether the workflow is helping more than it costs.

Record each consequential amendment in the change history and DECISION_LOG.md. Keep this file as the single living roadmap; use Git history for prior versions rather than multiplying competing plan documents.

## 10. Change history

| Version | Date | Change |
|---|---|---|
| 1.0 | 2026-11-13 | Adopted the initial project mission, design commitments, phase gates, priority rules, and immediate execution sequence. |
| 1.1 | 2026-11-13 | Updated the roadmap after the 2.11 browser and seeded-comparison tests; added the presentation-RNG isolation guardrail and the verified notebook RNG-coupling fix to the immediate sequence. |
| 1.2 | 2026-11-13 | Recorded the 2.12 UI-RNG correction, multi-seed regression evidence, completion of Phase 2, and the first reviewable productive-language design proposal. |

## 11. Current return point

- **Active operation:** WF-LANG-002 — design the productive language model.
- **Latest prototype:** Cities Laboratory 2.12 at `builds/Well_Fuck_Cities_Lab_2_12.html`.
- **2.12 commit:** `6241026fabccb413eea6630605fdb68a36db3e70`; artifact blob `2be28e6df39bec77067dd147462fbf1799378a94`.
- **2.12 SHA-256:** `0c26d03352d270cb0f3ff3771a0abd5cf542e5a3e1a8ff944a154d96f9f6f486`.
- **Preserved 2.11 baseline:** commit `4e2df3cb073b4b4dceefddf54831edab1378c17a`; unchanged.
- **Audit:** LANGUAGE_KERNEL_AUDIT.md. **Design proposal:** LANGUAGE_MODEL_DESIGN.md (reviewable, not yet adopted).
- **Next:** settle the first semantic/message-frame and lexeme schema, then specify a small productive clause generator.
