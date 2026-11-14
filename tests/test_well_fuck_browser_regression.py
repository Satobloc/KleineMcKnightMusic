#!/usr/bin/env python3
"""Optional Playwright regression test for Well, Fuck. 2.11 -> 2.12.

Requires: pip install playwright; playwright install chromium
In the current container, set CHROMIUM_EXECUTABLE=/usr/bin/chromium.
Run from repository root: python tests/test_well_fuck_browser_regression.py
Run additional seeds in separate invocations: --seeds 7 or --seeds 2026.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path

from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]
BUILDS = ROOT / "SIMULATION_WORKDESKS" / "WELL_FUCK" / "builds"
PHYSICAL_FIELDS = ["buildings", "destroyed", "radiation", "halfLife", "cracks", "falls", "moving", "focus"]


def advance(page, turns: int) -> None:
    while turns >= 50:
        page.locator("#fifty").click(timeout=30_000)
        turns -= 50
    for _ in range(turns):
        page.locator("#one").click(timeout=10_000)


def run_case(browser, html: str, seed: int, turns: int, ui_turn: int | None) -> dict:
    page = browser.new_page(viewport={"width": 1440, "height": 1000})
    page_errors: list[str] = []
    console_errors: list[str] = []
    page.on("pageerror", lambda error: page_errors.append(str(error)))
    page.on("console", lambda message: console_errors.append(message.text) if message.type == "error" else None)
    try:
        page.set_content(html, wait_until="domcontentloaded", timeout=60_000)
        page.locator("#seed").fill(str(seed))
        page.locator("#new").click(timeout=10_000)
        if ui_turn is not None:
            advance(page, ui_turn)
            page.locator("#overhearLanguage").click(timeout=10_000)
            advance(page, turns - ui_turn)
        else:
            advance(page, turns)
        canvas = page.locator("#c").screenshot(type="png")
        notebook = page.locator("#languageNotebook").inner_text()
        return {
            "turn": int(page.locator("#turn").inner_text()),
            "phrase": page.locator("#languageNotebook .language-phrase").inner_text(),
            "ipa": page.locator("#languageNotebook .language-ipa").first.inner_text(),
            "stats": {field: page.locator(f"#{field}").inner_text() for field in PHYSICAL_FIELDS},
            "canvas_sha256": hashlib.sha256(canvas).hexdigest(),
            "sample_recorded": "Turn " + str(ui_turn) in notebook if ui_turn is not None else False,
            "page_errors": page_errors,
            "console_errors": console_errors,
        }
    finally:
        page.close()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seeds", nargs="+", type=int, default=[42])
    parser.add_argument("--turns", type=int, default=1000)
    parser.add_argument("--ui-turn", type=int, default=100)
    args = parser.parse_args()
    if args.turns <= 0 or args.ui_turn < 0 or args.ui_turn >= args.turns:
        parser.error("require turns > 0 and 0 <= ui-turn < turns")
    if args.turns % 50 or args.ui_turn % 50:
        parser.error("turns and ui-turn must be multiples of 50 for this harness")

    html_211 = (BUILDS / "Well_Fuck_Cities_Lab_2_11.html").read_text(encoding="utf-8")
    html_212 = (BUILDS / "Well_Fuck_Cities_Lab_2_12.html").read_text(encoding="utf-8")
    launch = {"headless": True, "args": ["--no-sandbox", "--disable-dev-shm-usage", "--disable-gpu", "--disable-background-networking"]}
    executable = os.environ.get("CHROMIUM_EXECUTABLE")
    if executable:
        launch["executable_path"] = executable
    elif Path("/usr/bin/chromium").exists():
        launch["executable_path"] = "/usr/bin/chromium"

    results = {}
    with sync_playwright() as playwright:
        for seed in args.seeds:
            # Restart Chromium per seed to bound memory in longer suites.
            browser = playwright.chromium.launch(**launch)
            try:
                baseline_211 = run_case(browser, html_211, seed, args.turns, None)
                baseline_212 = run_case(browser, html_212, seed, args.turns, None)
                observed_212 = run_case(browser, html_212, seed, args.turns, args.ui_turn)

                assert baseline_211["turn"] == args.turns
                assert baseline_212["turn"] == args.turns
                assert observed_212["turn"] == args.turns
                assert baseline_211["stats"] == baseline_212["stats"], f"physical stats changed for seed {seed}"
                assert baseline_211["canvas_sha256"] == baseline_212["canvas_sha256"], f"canvas changed for seed {seed}"
                assert (baseline_211["phrase"], baseline_211["ipa"]) == (baseline_212["phrase"], baseline_212["ipa"]), f"language baseline changed for seed {seed}"
                assert (baseline_212["phrase"], baseline_212["ipa"]) == (observed_212["phrase"], observed_212["ipa"]), f"UI action changed language evolution for seed {seed}"
                assert baseline_212["stats"] == observed_212["stats"], f"UI action changed physical stats for seed {seed}"
                assert baseline_212["canvas_sha256"] == observed_212["canvas_sha256"], f"UI action changed canvas for seed {seed}"
                assert observed_212["sample_recorded"], f"UI sample not recorded for seed {seed}"
                for case in (baseline_211, baseline_212, observed_212):
                    assert not case["page_errors"], f"page exception for seed {seed}: {case['page_errors']}"
                    assert not case["console_errors"], f"console error for seed {seed}: {case['console_errors']}"
                results[seed] = {
                    "turns": args.turns,
                    "language_baseline_matches_211": True,
                    "ui_action_preserves_language": True,
                    "physical_and_canvas_match": True,
                    "ui_sample_recorded": True,
                }
            finally:
                browser.close()

    print("PASS: multi-seed 2.11/2.12 physical regression and 2.12 UI-RNG isolation")
    print(json.dumps(results, indent=2))


if __name__ == "__main__":
    main()
