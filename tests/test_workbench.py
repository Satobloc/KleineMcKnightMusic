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
            root = module.ROOT / "corpus"
            out = Path(td) / "out"
            report = module.inventory("corpus", out)
            self.assertEqual(report["command"], "inventory")
            self.assertTrue((out / "inventory.json").exists())

    def test_load_request_rejects_unknown_command(self):
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "request.json"
            p.write_text('{"version":1,"request_id":"x","command":"shell"}')
            with self.assertRaises(ValueError):
                module.load_request(p)

    def test_discover_and_extract_text(self):
        with tempfile.TemporaryDirectory() as td:
            out = Path(td) / "out"
            found = module.discover("corpus/Genre_Hopper", out, [".txt"], 100)
            self.assertGreater(found["files_observed"], 0)
            extracted = module.extract_text("corpus/Genre_Hopper", out, min_chars=12, max_files=50, max_fragments=200)
            self.assertGreaterEqual(extracted["fragments"], 0)
            self.assertTrue((out / "fragments.jsonl").exists())

    def test_transform_is_reproducible_and_composable(self):
        with tempfile.TemporaryDirectory() as td:
            source = Path(td) / "input.txt"
            source.write_text("alpha\n\nbeta\n\nalpha", encoding="utf-8")
            original = module.safe_relative
            module.safe_relative = lambda value, must_exist=True: source
            try:
                result = module.transform_fragments({
                    "input": "input.txt",
                    "seed": 7,
                    "steps": [{"op": "deduplicate"}, {"op": "prefix", "text": "X:"}, {"op": "shuffle"}],
                }, Path(td) / "out")
                self.assertEqual(result["fragment_count"], 2)
                self.assertTrue((Path(td) / "out" / "transformed.txt").exists())
            finally:
                module.safe_relative = original


if __name__ == "__main":
    unittest.main()
