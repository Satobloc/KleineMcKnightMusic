# Well, Fuck. — Boot Capsule

**Status:** ACTIVE / language-system focus  
**Workspace:** Satobloc/KleineMcKnightMusic/SIMULATION_WORKDESKS/WELL_FUCK/  
**Canonical roadmap:** PROJECT_PLAN.md  
**Canonical control:** PROJECT_CONTROL.md  
**Current tray:** ACTIVE_TRAY.md  
**Heartbeat:** HEARTBEAT.md  
**Current operation:** WF-SIM-001, ACTIVE while the exact 2.11 artifact is published, read back, and tested

## Mission

Develop a playful, inspectable stochastic cavern-civilization simulation, currently prioritizing its emergent language and culture systems. Preserve the simulation's existing behavior while extending it through bounded, testable increments.

## Load order

At the start of every new conversation or resumed work session:

1. Fetch the live repository state. Record the main-branch commit SHA; do not rely on a remembered or cached copy.
2. Read this file, PROJECT_PLAN.md, PROJECT_CONTROL.md, ACTIVE_TRAY.md, WORK_QUEUE.md, and HEARTBEAT.md.
3. Read only the current operation's named files and relevant source/code ranges.
4. Load WORKFLOW_PROTOCOL.md when planning, executing, or reviewing a substantial operation.
5. Load SUCCESSION.md before a handoff or whenever context exhaustion is possible.
6. Use SESSION_CHECKPOINT_2026-11-13.md as a locator and project-state summary, not as a substitute for inspecting the named code or primary artifacts.

## Restart and checkpoint rule

The repository is the durable project state; a ChatGPT conversation is a temporary work surface. Refresh the project heartbeat on every substantive project turn. Update the active tray, queue, decision log, and operation receipt after each bounded operation. If a context limit is suspected, checkpoint immediately rather than waiting for the conversation to end.

The transferable lesson from HsH is to maintain an interactive heartbeat and make stale continuity visible. This project has its own provisional settings: a 36-hour stale threshold and a six-hour scheduled check, plus checks on relevant project changes. These are starting hypotheses, not inherited requirements or presumed optimal values. Reassess them after five completed operations or 14 calendar days, whichever comes first, using this project's actual interruption patterns and alert overhead. This timer detects prolonged inactivity; it does not predict conversation context saturation or an imminent context limit. Sudden conversation endings are addressed through incremental repository checkpoints and the succession procedure. A stale result is a re-entry prompt, not an autonomous ChatGPT restart or proof that work occurred. The check never refreshes the heartbeat. Actual continuation begins when a new conversation follows this boot sequence.

No existing ChatGPT scheduled-task identity, schedule, phase, or enabled state is changed by this project setup.

## Current pin

WF-CYCLE 01/05 — RE-ENTRY & SCOPE  
WF-OP 01 COMPLETE — repository home and continuity checks verified  
WF-OP 02 IN PROGRESS — preserve and independently verify Cities Laboratory 2.11  
NOW: publish the exact 2.11 artifact and complete its verification  
NEXT: audit Language Kernel 0.1 against the committed source  
RETURN: ACTIVE_TRAY.md and the WF-SIM-001 operation

## Truth conditions

A local file is not a repository artifact. A prepared Git blob is not a branch commit. A planned test is not a test result. A reported prior test is not a test independently repeated in the current operation. A checkpoint is not a verbatim transcript. A scheduled check is not an autonomous worker. When state conflicts, stop and reconcile against the live repository and exact artifact.
