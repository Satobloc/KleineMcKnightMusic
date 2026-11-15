import importlib.util
import random
import sys
import unittest
from pathlib import Path

MODULE_PATH = Path(__file__).parents[1] / "SUNO_WORKDESKS" / "SUNO_LLM_WORKSHOP_v0.1" / "tools" / "random_hopper_compiler.py"
SPEC = importlib.util.spec_from_file_location("random_hopper_compiler", MODULE_PATH)
compiler = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = compiler
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


class ConcatenatorTests(unittest.TestCase):
    def test_fixed_concatenators(self):
        self.assertEqual(
            compiler.concatenate_samples(["one", "two", "three"], "line_break"),
            "one\\ntwo\\nthree",
        )
        self.assertEqual(
            compiler.concatenate_samples(["one", "two", "three"], "ellipsis"),
            "one…two…three",
        )
        self.assertEqual(
            compiler.concatenate_samples(["one", "two"], "em_dash"),
            "one—two",
        )
        self.assertEqual(
            compiler.concatenate_samples(["one", "two"], "double_em_dash"),
            "one——two",
        )
        self.assertEqual(
            compiler.concatenate_samples(["one", "two", "three", "four"], "alternating_parentheses"),
            "one(two)three(four)",
        )
        self.assertEqual(
            compiler.concatenate_samples(["one", "two"], "period"),
            "one.two",
        )
        self.assertEqual(
            compiler.concatenate_samples(["one", "two"], "pipe"),
            "one|two",
        )
        self.assertEqual(
            compiler.concatenate_samples(["one", "two"], "none"),
            "onetwo",
        )

    def test_concatenator_choice_is_one_of_supported_options(self):
        class ChoiceRng:
            def choice(self, values):
                self.values = values
                return values[3]
        rng = ChoiceRng()
        chosen = compiler.choose_concatenator(rng)
        self.assertEqual(chosen, "double_em_dash")
        self.assertEqual(set(rng.values), set(compiler.CONCATENATOR_CHOICES))

    def test_structural_operations_leave_styles_unchanged(self):
        lyrics = "abcdefghijklmnopqrstuvwxyz" * 8
        styles = "STYLE FIELD MUST NOT BE SEGMENTED OR REPEATED"
        transformed, untouched, meta = compiler.apply_lyrics_only_structure(
            lyrics, styles, StructuralRng([0.1, 0.1, 0.1] + [0.0] * 100, "full")
        )
        self.assertNotEqual(transformed, lyrics)
        self.assertEqual(untouched, styles)
        self.assertEqual(meta["segmentation"], "full")
        self.assertEqual(meta["repetition"], "full")


class StructuralTransformTests(unittest.TestCase):
    def test_neither_operation_leaves_text_untouched(self):
        source = "A strange fjord narrative with musical instructions."
        result, meta = compiler.apply_song_structure(
            source, StructuralRng([0.9])
        )
        self.assertEqual(result, source)
        self.assertEqual(meta["structure_gate"], "closed")
        self.assertEqual(meta["segmentation"], "off")
        self.assertEqual(meta["repetition"], "off")

    def test_segmentation_is_independent_of_repetition(self):
        source = "abcdefghijklmnopqrstuvwxyz" * 8
        result, meta = compiler.apply_song_structure(
            source, StructuralRng([0.1, 0.1, 0.9], "full")
        )
        self.assertIn("\n", result)
        self.assertEqual(meta["segmentation"], "full")
        self.assertEqual(meta["repetition"], "off")

    def test_repetition_can_run_without_segmentation(self):
        source = "abcdefghijklmnopqrstuvwxyz" * 8
        # First two draws activate repetition only; per-unit draws activate repeats.
        result, meta = compiler.apply_song_structure(
            source, StructuralRng([0.1, 0.9, 0.1] + [0.0] * 100, "full")
        )
        self.assertEqual(meta["segmentation"], "off")
        self.assertEqual(meta["repetition"], "full")
        self.assertGreater(meta["repeated_units"], 0)
        self.assertGreater(len(result), len(source))

    def test_repetition_caps_full_units_and_allows_short_final_tag(self):
        source = ("A" * 40) + ("B" * 40) + ("C" * 20)
        result, meta = compiler.apply_song_structure(
            source, StructuralRng([0.1, 0.9, 0.1] + [0.0] * 100, "full")
        )
        self.assertEqual(result.count("A" * 40), 2)
        self.assertEqual(result.count("B" * 40), 2)
        self.assertEqual(result.count("C" * 20), 3)
        self.assertEqual(meta["closing_triple_repeats"], 1)

    def test_long_final_unit_does_not_get_a_third_copy(self):
        source = ("A" * 40) + ("B" * 40) + ("C" * 40)
        result, meta = compiler.apply_song_structure(
            source, StructuralRng([0.1, 0.9, 0.1] + [0.0] * 100, "full")
        )
        self.assertEqual(result.count("A" * 40), 2)
        self.assertEqual(result.count("B" * 40), 2)
        self.assertEqual(result.count("C" * 40), 2)
        self.assertEqual(meta["closing_triple_repeats"], 0)

    def test_both_operations_can_run_together(self):
        source = "abcdefghijklmnopqrstuvwxyz" * 8
        result, meta = compiler.apply_song_structure(
            source, StructuralRng([0.1, 0.1, 0.1] + [0.0] * 100, "full")
        )
        self.assertEqual(meta["segmentation"], "full")
        self.assertEqual(meta["repetition"], "full")
        self.assertIn("\n", result)
        self.assertGreater(meta["repeated_units"], 0)


if __name__ == "__main__":
    unittest.main()
