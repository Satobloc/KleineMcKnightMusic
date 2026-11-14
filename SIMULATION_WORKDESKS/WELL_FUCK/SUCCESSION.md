# Well, Fuck. — Succession and Context-Limit Protocol

## Purpose

Preserve the project's actual state across conversation endings, context limits, interruptions, and successor conversations. Do not pretend that a new conversation is the same continuous instance.

## Normal checkpoint cadence

1. Refresh HEARTBEAT.md on every substantive assistant turn.
2. After each bounded operation, reconcile PROJECT_CONTROL.md, ACTIVE_TRAY.md, WORK_QUEUE.md, DECISION_LOG.md, and OPERATION_LOG.md.
3. Preserve exact artifact names, local paths where relevant, repository paths, branch, commit SHA, blob SHA, checksums, and test ranges.
4. Distinguish completed work from searched, inspected, partially read, proposed, and unverified work.
5. Record decisions, unresolved questions, competing interpretations, blockers, and parked branches.
6. Read back every newly written repository artifact and verify its commit/blob identity.
7. Keep a project-specific session checkpoint. Do not put raw private conversation exports or unrelated conversation material in this public repository.
8. Leave one precise first action for the successor.

## Before an anticipated context limit

- Stop opening new branches.
- Update the active tray with the exact state reached, including partial work and the next line/file/test cursor.
- Refresh the heartbeat and turn pin.
- Reconcile the queue and operation log.
- Record the latest verified repository commit and all local-only artifact hashes.
- Write or update the session checkpoint.
- Verify all changed files by independent readback.
- State one first action for the next conversation.

If the limit arrives without warning, the last verified repository commit is the recovery point. The next conversation must fetch live main and reconcile against that commit before continuing.

## Successor startup

1. Fetch the live repository and record the current main commit SHA.
2. Read BOOT.md, PROJECT_CONTROL.md, ACTIVE_TRAY.md, WORK_QUEUE.md, and HEARTBEAT.md.
3. Read the relevant sections of WORKFLOW_PROTOCOL.md and SUCCESSION.md.
4. Independently inspect the exact code/artifact named by the active tray. Do not rely solely on the previous conversation's description.
5. Check the interactive heartbeat against the project's current pilot threshold and inspect the continuity workflow. Treat the threshold and schedule as project settings to review, not inherited HsH requirements.
6. Resume one bounded operation. Do not redesign the project or silently broaden scope just because a new conversation began.

## Minimum handoff packet

- Project mission and current priority.
- Current phase and gate.
- One active operation, exact cursor, and stop condition.
- Current repository branch and verified commit SHA.
- Exact code/artifact paths and hashes, including local-only files.
- Work completed versus merely searched, inspected, proposed, or planned.
- Current test evidence and unverified prior reports.
- Decisions, blockers, contradictions, and parked items.
- Current ticker slot and completed-operation count.
- One first action.

## Limits

The GitHub continuity workflow checks that project controls exist and that the interactive heartbeat is fresh. It cannot inspect ChatGPT's internal context budget, preserve an unexported verbatim transcript, or start a new ChatGPT conversation. The user maintains independent file backups. If the local 2.11 HTML file is not available in a successor session, request the user's saved copy rather than reconstructing it from a summary.
