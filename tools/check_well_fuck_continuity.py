#!/usr/bin/env python3
"""Structural and provisional heartbeat-freshness checks for the Well, Fuck. workspace."""

from __future__ import annotations

import argparse
import datetime as dt
import sys
from pathlib import Path

WORKSPACE_REL = Path("SIMULATION_WORKDESKS") / "WELL_FUCK"
REQUIRED_FILES = (
    "README.md",
    "BOOT.md",
    "PROJECT_CONTROL.md",
    "ACTIVE_TRAY.md",
    "WORK_QUEUE.md",
    "DECISION_LOG.md",
    "OPERATION_LOG.md",
    "HEARTBEAT.md",
    "WORKFLOW_PROTOCOL.md",
    "SUCCESSION.md",
    "SESSION_CHECKPOINT_2026-11-13.md",
)
MACHINE_START = "<!-- machine-state:start -->"
MACHINE_END = "<!-- machine-state:end -->"


def parse_machine_state(text: str) -> dict[str, str]:
    """Read the small key/value block bounded by explicit markers."""
    if MACHINE_START not in text or MACHINE_END not in text:
        raise ValueError("machine-state block markers are missing")
    block = text.split(MACHINE_START, 1)[1].split(MACHINE_END, 1)[0]
    fields: dict[str, str] = {}
    for line in block.splitlines():
        line = line.strip()
        if not line or ":" not in line:
            continue
        key, value = line.split(":", 1)
        fields[key.strip()] = value.strip()
    return fields


def parse_aware_timestamp(value: str) -> dt.datetime:
    parsed = dt.datetime.fromisoformat(value.replace("Z", "+00:00"))
    if parsed.tzinfo is None or parsed.utcoffset() is None:
        raise ValueError("heartbeat timestamp must include a UTC offset")
    return parsed.astimezone(dt.timezone.utc)


def heartbeat_is_stale(
    timestamp: str,
    threshold_hours: int,
    now: dt.datetime | None = None,
) -> bool:
    if threshold_hours <= 0:
        raise ValueError("stale_after_hours must be a positive integer")
    last = parse_aware_timestamp(timestamp)
    current = now or dt.datetime.now(dt.timezone.utc)
    if current.tzinfo is None or current.utcoffset() is None:
        raise ValueError("comparison time must include a UTC offset")
    age = current.astimezone(dt.timezone.utc) - last
    if age.total_seconds() < -300:
        raise ValueError("heartbeat timestamp is unexpectedly in the future")
    return age >= dt.timedelta(hours=threshold_hours)


def structural_errors(repository_root: Path) -> list[str]:
    workspace = repository_root / WORKSPACE_REL
    errors: list[str] = []

    for relative in REQUIRED_FILES:
        if not (workspace / relative).is_file():
            errors.append(f"missing required project file: {WORKSPACE_REL / relative}")

    if errors:
        return errors

    readme = (workspace / "README.md").read_text(encoding="utf-8")
    boot = (workspace / "BOOT.md").read_text(encoding="utf-8")
    active = (workspace / "ACTIVE_TRAY.md").read_text(encoding="utf-8")
    queue = (workspace / "WORK_QUEUE.md").read_text(encoding="utf-8")
    heartbeat = (workspace / "HEARTBEAT.md").read_text(encoding="utf-8")

    if "BOOT.md" not in readme:
        errors.append("project README must point to BOOT.md")
    for required_pointer in ("PROJECT_CONTROL.md", "ACTIVE_TRAY.md", "HEARTBEAT.md"):
        if required_pointer not in boot:
            errors.append(f"boot capsule is missing pointer: {required_pointer}")

    try:
        active_state = parse_machine_state(active)
        heartbeat_state = parse_machine_state(heartbeat)
    except ValueError as exc:
        errors.append(str(exc))
        return errors

    operation_id = active_state.get("operation_id", "")
    status = active_state.get("status", "")
    if not operation_id:
        errors.append("active tray has no operation_id")
    if status not in {"ACTIVE", "BLOCKED"}:
        errors.append("active tray status must be ACTIVE or BLOCKED")
    if operation_id and operation_id not in queue:
        errors.append(f"active operation {operation_id} is absent from WORK_QUEUE.md")

    try:
        parse_aware_timestamp(heartbeat_state["last_interactive_update_utc"])
        threshold = int(heartbeat_state["stale_after_hours"])
        if threshold <= 0:
            raise ValueError("stale_after_hours must be positive")
    except (KeyError, TypeError, ValueError) as exc:
        errors.append(f"invalid heartbeat machine state: {exc}")

    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--check-stale",
        action="store_true",
        help="also fail when the interactive heartbeat meets or exceeds its provisional freshness threshold",
    )
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help=argparse.SUPPRESS,
    )
    args = parser.parse_args()

    errors = structural_errors(args.root)
    if errors:
        for error in errors:
            print(f"ERROR: {error}", file=sys.stderr)
        return 1

    print("PASS: project continuity structure is complete and internally linked.")
    if not args.check_stale:
        return 0

    workspace = args.root / WORKSPACE_REL
    state = parse_machine_state(
        (workspace / "HEARTBEAT.md").read_text(encoding="utf-8")
    )
    threshold = int(state["stale_after_hours"])
    timestamp = state["last_interactive_update_utc"]
    try:
        stale = heartbeat_is_stale(timestamp, threshold)
    except ValueError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1

    if stale:
        print(
            f"STALE: interactive heartbeat {timestamp} meets or exceeds "
            f"the {threshold}-hour threshold.",
            file=sys.stderr,
        )
        return 2

    print(f"PASS: interactive heartbeat {timestamp} is within {threshold} hours.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
