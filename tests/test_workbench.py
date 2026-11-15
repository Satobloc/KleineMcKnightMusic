import importlib.util
import json
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path("tools/workbench.py")
spec = importlib.util.spec_from_file_location("kmckm_workbench", SCRIPT)
module = importlib.util.module_from_spec(spec)
import sys
sys.modules[spec.name] = module
spec.loader.exec_module(module)


class WorkbenchTests(unittest.TestCase):
    def test_safe_relative_rejects_escape(self):
        with self.assertRaises(ValueError):
            module.safe_relative("../outside", must_exist=False)

    def test_load_request_requires_version_and_id(self):
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "request.json"
            p.write_text(json.dumps({"version": 1, "command": "inventory", "request_id": "test_01"}))
            self.assertEqual(module.load_request(p)["command"], "inventory")
            p.write_text('{"version":1,"command":"inventory"}')
            with self.assertRaises(ValueError):
                module.load_request(p)

    def test_inventory_is_read_only_and_writes_report(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td) / "corpus"
            root.mkdir()
            (root / "sample.txt").write_text("sample", encoding="utf-8")
            out = Path(td) / "out"
            report = module.inventory(str(root.relative_to(module.ROOT)) if root.is_relative_to(module.ROOT) else "README.md", out)
            self.assertEqual(report["command"], "inventory")
            self.assertTrue((out / "inventory.json").exists())

    def test_load_request_rejects_unknown_command(self):
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "request.json"
            p.write_text('{"version":1,"request_id":"x","command":"shell"}')
            with self.assertRaises(ValueError):
                module.load_request(p)


if __name__ == "__main__":
    unittest.main()
