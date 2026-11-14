import datetime as dt
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from tools.check_well_fuck_continuity import (  # noqa: E402
    REQUIRED_FILES,
    heartbeat_is_stale,
    parse_aware_timestamp,
    parse_machine_state,
    structural_errors,
)


class MachineStateTests(unittest.TestCase):
    def test_machine_state_parser_reads_only_marked_block(self):
        text = (
            "# Heartbeat\n"
            "<!-- machine-state:start -->\n"
            "last_interactive_update_utc: 2026-11-14T03:27:51Z\n"
            "stale_after_hours: 36\n"
            "<!-- machine-state:end -->\n"
            "stale_after_hours: 999\n"
        )
        state = parse_machine_state(text)
        self.assertEqual(state["stale_after_hours"], "36")

    def test_machine_state_parser_rejects_missing_markers(self):
        with self.assertRaises(ValueError):
            parse_machine_state("last_interactive_update_utc: 2026-11-14T03:27:51Z")

    def test_timestamp_requires_offset(self):
        with self.assertRaises(ValueError):
            parse_aware_timestamp("2026-11-14T03:27:51")

    def test_heartbeat_freshness_boundary(self):
        now = dt.datetime(2026, 11, 14, 12, 0, tzinfo=dt.timezone.utc)
        self.assertFalse(
            heartbeat_is_stale("2026-11-13T12:00:01Z", 24, now=now)
        )
        self.assertTrue(
            heartbeat_is_stale("2026-11-13T12:00:00Z", 24, now=now)
        )

    def test_future_heartbeat_is_rejected(self):
        now = dt.datetime(2026, 11, 14, 12, 0, tzinfo=dt.timezone.utc)
        with self.assertRaises(ValueError):
            heartbeat_is_stale("2026-11-14T12:10:00Z", 36, now=now)


class StructureTests(unittest.TestCase):
    def _make_workspace(self, root: Path):
        workspace = root / "SIMULATION_WORKDESKS" / "WELL_FUCK"
        workspace.mkdir(parents=True)
        for relative in REQUIRED_FILES:
            (workspace / relative).write_text("placeholder\n", encoding="utf-8")
        (workspace / "README.md").write_text("Start with BOOT.md\n", encoding="utf-8")
        (workspace / "BOOT.md").write_text(
            "Read PROJECT_CONTROL.md, ACTIVE_TRAY.md, and HEARTBEAT.md\n",
            encoding="utf-8",
        )
        (workspace / "ACTIVE_TRAY.md").write_text(
            "<!-- machine-state:start -->\n"
            "operation_id: WF-TEST-001\n"
            "status: ACTIVE\n"
            "<!-- machine-state:end -->\n",
            encoding="utf-8",
        )
        (workspace / "WORK_QUEUE.md").write_text(
            "WF-TEST-001 | ACTIVE\n", encoding="utf-8"
        )
        (workspace / "HEARTBEAT.md").write_text(
            "<!-- machine-state:start -->\n"
            "last_interactive_update_utc: 2026-11-14T03:27:51Z\n"
            "stale_after_hours: 36\n"
            "<!-- machine-state:end -->\n",
            encoding="utf-8",
        )
        return workspace

    def test_complete_structure_passes(self):
        with tempfile.TemporaryDirectory() as temp:
            self._make_workspace(Path(temp))
            self.assertEqual(structural_errors(Path(temp)), [])

    def test_missing_file_is_reported(self):
        with tempfile.TemporaryDirectory() as temp:
            workspace = self._make_workspace(Path(temp))
            (workspace / "SUCCESSION.md").unlink()
            errors = structural_errors(Path(temp))
            self.assertTrue(any("SUCCESSION.md" in error for error in errors))

    def test_active_operation_must_appear_in_queue(self):
        with tempfile.TemporaryDirectory() as temp:
            workspace = self._make_workspace(Path(temp))
            (workspace / "WORK_QUEUE.md").write_text("WF-OTHER-001 | READY\n")
            errors = structural_errors(Path(temp))
            self.assertTrue(any("absent from WORK_QUEUE" in error for error in errors))


if __name__ == "__main__":
    unittest.main()
