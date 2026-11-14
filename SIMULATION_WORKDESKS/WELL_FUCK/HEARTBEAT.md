# Project Heartbeat

The heartbeat records meaningful, human-directed project activity. Scheduled checks and automated repository writes do not refresh it.

<!-- machine-state:start -->
last_interactive_update_utc: 2026-11-14T03:36:43Z
stale_after_hours: 36
current_cycle_slot: 01/08
completed_operations: 1
last_completed_operation: WF-BOOT-001
current_operation: WF-SIM-001
<!-- machine-state:end -->

## Restart behavior

The 36-hour threshold is a project-specific re-entry alert adapted from the HsH recommendation. GitHub Actions checks freshness on relevant project changes and every six hours. If stale, the workflow fails and exposes the need for a human-directed restart from BOOT.md. This is not autonomous ChatGPT continuity, and it is not proof that a worker has performed any operation.

Refresh this file on every substantive assistant turn. Advance the turn ticker separately from the operation counter.
