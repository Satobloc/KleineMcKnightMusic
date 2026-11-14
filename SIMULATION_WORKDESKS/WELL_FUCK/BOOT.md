# Well, Fuck. — Boot Capsule

**Status:** ACTIVE / language-system focus  
**Workspace:** Satobloc/KleineMcKnightMusic/SIMULATION_WORKDESKS/WELL_FUCK/  
**Canonical control:** PROJECT_CONTROL.md  
**Current tray:** ACTIVE_TRAY.md  
**Heartbeat:** HEARTBEAT.md  
**Current operation:** WF-SIM-001, BLOCKED pending transfer of the 2.11 HTML artifact into the repository

## Mission

Develop a playful, inspectable stochastic cavern-civilization simulation, currently prioritizing its emergent language and culture systems. Preserve the simulation's existing behavior while extending it through bounded, testable increments.

## Load order

At the start of every new conversation or resumed work session:

1. Fetch the live repository state. Record the main-branch commit SHA; do not rely on a remembered or cached copy.
2. Read this file, PROJECT_CONTROL.md, ACTIVE_TRAY.md, WORK_QUEUE.md, and HEARTBEAT.md.
3. Read only the current operation's named files and relevant source/code ranges.
4. Load WORKFLOW_PROTOCOL.md when planning, executing, or reviewing a substantial operation.
5. Load SUCCESSION.md before a handoff or whenever context exhaustion is possible.
6. Use SESSION_CHECKPOINT_2026-11-13.md as a locator and project-state summary, not as a substitute for inspecting the named code or primary artifacts.

## Restart and checkpoint rule

The repository is the durable project state; a ChatGPT conversation is a temporary work surface. Refresh the project heartbeat on every substantive assistant turn. Update the active tray, queue, decision log, and operation receipt after each bounded operation. If a context limit is suspected, checkpoint immediately rather than waiting for the conversation to end.

The HsH 36-hour interactive-heartbeat restart pattern is a recommended design. This project checks heartbeat freshness on every relevant project push/pull request and on a six-hour schedule. It fails visibly when the interactive heartbeat is at least 36 hours old. This is an attention/re-entry alert, not an autonomous ChatGPT restart and not proof that work occurred. The check never refreshes the heartbeat. Actual continuation begins when a new conversation follows this boot sequence.

No existing ChatGPT scheduled-task identity, schedule, phase, or enabled state is changed by this project setup.

## Current pin

WF-CYCLE 05/05 — EXPLORATION & EXECUTIVE REPLAN  
WF-OP 01 COMPLETE — repository home and continuity checks verified  
NOW: preserve and independently verify Cities Laboratory 2.11 in the repository  
NEXT: obtain a supported upload of the identified local HTML file, then commit and test it  
RETURN: ACTIVE_TRAY.md and the WF-SIM-001 operation

## Truth conditions

A local file is not a repository artifact. A planned test is not a test result. A reported prior test is not a test independently repeated in the current operation. A checkpoint is not a verbatim transcript. A scheduled check is not an autonomous worker. When state conflicts, stop and reconcile against the live repository and exact artifact.
