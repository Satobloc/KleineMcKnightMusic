import importlib.util
import random
import unittest
from pathlib import Path

MODULE_PATH = Path(__file__).parents[1] / "SUNO_WORKDESKS" / "SUNO_LLM_WORKSHOP_v0.1" / "tools" / "random_hopper_compiler.py"
SPEC = importlib.util.spec_from_file_location("random_hopper_compiler", MODULE_PATH)
compiler = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(compiler)


class StructuralRng:
    def __init__(self, random_values, choice_value="full"):
        self.values = iter(random_values)
        self.choice_value = choice_value

    def random(self):
        return next(self.values)

    def choice(self, values):
        return self.choice_value

    def randint(self, low, high):
        return min(max(40, low), high)

    def randrange(self, stop):
        return 0


class StructuralTransformTests(unittest.TestCase):
    def test_neither_operation_leaves_text_untouched(self):
        source = "A strange fjord narrative with musical instructions."
        result, meta = compiler.apply_song_structure(
            source, StructuralRng([0.9, 0.9])
        )
        self.assertEqual(result, source)
        self.assertEqual(meta["segmentation"], "off")
        self.assertEqual(meta["repetition"], "off")

    def test_segmentation_is_independent_of_repetition(self):
        source = "abcdefghijklmnopqrstuvwxyz" * 8
        result, meta = compiler.apply_song_structure(
            source, StructuralRng([0.1, 0.9], "full")
        )
        self.assertIn("\n", result)
        self.assertEqual(meta["segmentation"], "full")
        self.assertEqual(meta["repetition"], "off")

    def test_repetition_can_run_without_segmentation(self):
        source = "abcdefghijklmnopqrstuvwxyz" * 8
        # First two draws activate repetition only; per-unit draws activate repeats.
        result, meta = compiler.apply_song_structure(
            source, StructuralRng([0.9, 0.1] + [0.0] * 100, "full")
        )
        self.assertEqual(meta["segmentation"], "off")
        self.assertEqual(meta["repetition"], "full")
        self.assertGreater(meta["repeated_units"], 0)
        self.assertGreater(len(result), len(source))

    def test_both_operations_can_run_together(self):
        source = "abcdefghijklmnopqrstuvwxyz" * 8
        result, meta = compiler.apply_song_structure(
            source, StructuralRng([0.1, 0.1] + [0.0] * 100, "full")
        )
        self.assertEqual(meta["segmentation"], "full")
        self.assertEqual(meta["repetition"], "full")
        self.assertIn("\n", result)
        self.assertGreater(meta["repeated_units"], 0)


if __name__ == "__main__":
    unittest.main()
