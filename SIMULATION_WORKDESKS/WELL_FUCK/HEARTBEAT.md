# Project Heartbeat

The heartbeat records meaningful, human-directed project activity. Scheduled checks and automated repository writes do not refresh it.

<!-- machine-state:start -->
last_interactive_update_utc: 2026-11-14T05:01:52Z
stale_after_hours: 36
current_cycle_slot: 01/05
completed_operations: 1
last_completed_operation: WF-BOOT-001
current_operation: WF-SIM-001
<!-- machine-state:end -->

## Restart behavior and pilot settings

The heartbeat mechanism is intended to make re-entry and checkpointing visible when a conversation may have gone stale or ended unexpectedly. It does not know ChatGPT's actual context budget, cannot detect an imminent context limit, and cannot start a replacement conversation.

The current 36-hour stale threshold and six-hour scheduled check are provisional pilot settings, not HsH requirements and not claims of optimal timing. Review both independently after five completed operations or 14 calendar days, whichever comes first. The interactive timestamp must represent actual substantive, user-directed project work. A scheduled workflow or documentation-only automation must never refresh it.

Refresh this file after substantive project work. Advance the attention ticker separately from the completed-operation counter.
