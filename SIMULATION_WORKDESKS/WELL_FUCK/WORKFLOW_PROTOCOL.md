# Well, Fuck. — Workflow Protocol

**Status:** PILOT  
**Purpose:** Make long-running creative/technical work recoverable across finite conversations while keeping the active context small.

## 1. Operating pattern

Use the HsH working pyramid in proportion to this project's needs:

1. **Boot capsule:** mission, current priority, load order, restart condition, and exact next cursor.
2. **Active tray:** one bounded operation, one scope boundary, one stop condition, one restart cursor.
3. **Control shelf:** phase gates, work queue, decisions, blockers, heartbeat, and receipts.
4. **Reference library:** code, experiments, source notes, methods, tools, and tests, loaded only when relevant.
5. **Parking drawer:** valuable branches with status, reason, dependency, and retrieval trigger.

The chat is a temporary working surface. The repository is the durable project state. A repository file is not active memory unless BOOT.md instructs the next conversation to retrieve it.

## 2. Bounded operation contract

Every substantial operation records:

- Operation ID and a single question or objective.
- Scope and explicit exclusions.
- Exact input artifact paths, repository, branch, commit SHA, blob SHA, version, and read range where applicable.
- What was actually read, executed, or tested, not merely searched or planned.
- Method, parameters, seed, environment, and tool versions when relevant.
- Result, uncertainty, contradictions, limitations, and negative findings.
- Artifact path, checksum, commit SHA, and independent readback.
- One next action, return cursor, and stop condition.

An operation is COMPLETE only when its stop condition is met and the receipt is independently verifiable. BLOCKED, PARKED, STOPPED, FAILED, and NEGATIVE are valid dispositions. Do not manufacture progress to keep a counter moving.

## 3. Branching work graph

Represent a meaningful branch with:

- ID and purpose;
- priority and status;
- inputs and dependencies;
- one next action;
- stop or decision condition;
- if-verified and if-blocked routes;
- return trigger;
- evidence and artifact pointers.

New discoveries may create or reprioritize branches, but must not silently expand the active tray. Only one operation is ACTIVE. Keep geology in PARKED status unless maintenance or an explicit priority change justifies reopening it.

## 4. Evidence and provenance labels

Use explicit labels when a statement's status could be misunderstood:

- **Nathan Direct:** current user instruction or decision.
- **Repository source:** a file or code artifact actually inspected, with path and commit/blob identity.
- **Conversation-derived checkpoint:** assistant-prepared summary of project-relevant conversation content, not a verbatim transcript.
- **Prior assistant report:** a result described in an earlier conversation but not independently verified in the current operation.
- **Current test:** an operation actually executed with environment and result recorded.
- **Inference / proposal:** plausible interpretation or candidate design not yet tested.
- **Unknown / not inspected:** evidence is not available or has not been checked.

Keep implemented, reported, tested, and hypothesized behavior separate.

## 5. Project-specific attention ticker

The ticker is an adaptive attention aid, not a borrowed HsH cycle and not a checklist that every turn must mechanically satisfy. The initial five modes reflect this project's present work and may be reordered, merged, split, skipped, or replaced as its needs change. Advance once per substantive assistant response when useful; a short clarification or unrelated exchange may leave it unchanged. Nathan's explicit priority always overrides the cycle.

1. **RE-ENTRY & SCOPE:** recover the project purpose, current operation, exact return point, priorities, blockers, and repository state.
2. **LANGUAGE ENGINE:** develop phonology, lexicon, morphology, syntax, semantics, pragmatics, and compositional speech. This is the current primary creative-development lane.
3. **SIMULATION INTEGRATION & CULTURE:** connect language to settlements, events, contact, migration, trade, and social identity while preserving the existing simulation substrate. Geological feature development remains paused.
4. **INSTRUMENTATION & VERIFICATION:** inspect source, build tests, track seeds and metrics, check RNG separation, reproduce results, and preserve working artifacts.
5. **EXPLORATION & EXECUTIVE REPLAN:** pursue useful lateral ideas, revisit parked branches, review the whole project, identify process friction, and select the next highest-value operation.

The current five modes are a first pilot, not a permanent taxonomy. A slot is a prompt to inspect an aspect of the work, not an instruction to divert from the active operation. Record deliberate overrides when they materially affect the plan.

## 6. Separate operation counter

The operation counter advances only when a named operation produces a checkable result or an explicit disposition and its receipt is verified. A turn can advance the attention cycle without completing an operation. An operation may span several turns without advancing the operation counter.

The visible pin should keep the two meanings separate:

WF-CYCLE 01/08 | WF-OP 01 COMPLETE | NOW ... | NEXT ... | RETURN ...

## 7. Adaptive optimization

After every five completed operations or at a phase gate, whichever comes first, evaluate the workflow as a whole. Also review the heartbeat threshold and scheduled-check cadence after five completed operations or 14 calendar days, whichever comes first. Evaluate:

- correct recovery of mission, priority, and exact cursor after interruption;
- missed or duplicated operations;
- stale or ambiguous pins;
- scope drift and accidental geology reactivation;
- recovery of parked branches when their triggers occur;
- usefulness of the attention slots and diversity of methods;
- maintenance overhead, distraction, and redundant bookkeeping.

Record KEEP / CHANGE / PARK / RETIRE decisions. Reorder, split, merge, or replace cycle slots when observed work shows a better arrangement. Do not standardize a ticker merely because it has been used. The cycle is expected to evolve with the project.

## 8. Review rhythm

- Every substantive assistant turn: refresh the interactive heartbeat and the short return pin.
- Every completed operation: update ACTIVE_TRAY.md, WORK_QUEUE.md, OPERATION_LOG.md, and affected decisions/control records.
- Every five completed operations or phase gate: perform a process and scope review.
- At five completed operations or 14 calendar days, whichever comes first: assess whether the heartbeat threshold and scheduled-check cadence are useful for this project's actual interruption pattern.
- Weekly while active: reassess project direction, dependencies, neglected branches, and whether this scaffold remains proportionate.
- Before context exhaustion or handoff: follow SUCCESSION.md and verify every referenced artifact.

## 9. Tool and repository use

Before building a new helper, inspect the existing repository tools and workflows. Prefer reuse or a small adaptation over a parallel system. Use scripts for calculations, bulk comparison, hashing, inventories, and repeatable tests where they reduce error. Record the exact seed and environment when deterministic behavior matters.

The existing KleineMcKnightMusic research on symbolic representations, phonetics, IPA, musical grammar, and multi-level alignment may provide useful cross-domain ideas. It is a source of ideas, not proof that the simulation's language system should copy a music model.

## 10. Method references

Adapted, not copied as universal law:

- HsH Primary Operational Guideline, Sections 8–10: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/NATHAN_DIRECT_2026-11-08_METHODOLOGY_AND_MODEL_OVERVIEW.md
- Big Push worker recommendations: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/BIG_PUSH/WORKER_RECOMMENDATIONS.md
- Big Push first-blush pilot: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/lane24-first-blush-return-pin-attention-cycle-pilot-20261108t1740z-001.md
- Big Push succession: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/BIG_PUSH/SUCCESSION.md

These are methodology references. They do not change the project's subject-matter authority, scientific status, or creative direction.
