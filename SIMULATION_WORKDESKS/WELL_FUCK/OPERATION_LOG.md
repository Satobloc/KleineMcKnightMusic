# Operation Log

Only bounded operations with checkable results or explicit dispositions receive completion receipts. Planned work is not completed work.

## WF-BOOT-001 — Project home and continuity scaffold

**Status:** COMPLETE  
**Scope:** Establish the project workspace, boot capsule, control records, continuity checker, and scheduled freshness alert.

**Repository changes**
- Initial workspace and control scaffold: commit 37997b4d8b3841760b839d3c6ae6ddde5065732b.
- Exact heartbeat-threshold correction: commit 5fcd3cfd6540a0b7b470b1cfea251fe60c0034ed.
- Additional boundary test and test clarification: commit b732a2a50467b486e5e95ba513cd1057a1f638af.
- Freshness check enabled for all relevant project validations, as well as the six-hour schedule: commit 5322e9d7b49e3212ddaac3ed003e2ce20400ace5.

**Verified evidence**
- Project files independently fetched from the live repository after publication.
- Continuity workflow run 43552338761: SUCCESS (structure and unit tests).
- Continuity workflow run 43552401004: SUCCESS (structure and unit tests).
- Source Hopper Checks run 43552401001: SUCCESS (existing repository test suite plus the new continuity tests).
- Continuity workflow run 43552468360: SUCCESS (structure, tests, and live heartbeat freshness check).
- The first run, 43552273994, FAILED because a synthetic unit-test timestamp set exactly at the 36-hour threshold was not classified as stale. It was not the project's live heartbeat. The implementation was corrected to use greater-than-or-equal, and the boundary test passed.

**Verified tested head before this receipt update:** 5322e9d7b49e3212ddaac3ed003e2ce20400ace5.

**Result:** The project home, boot path, control records, operation tracking, succession procedure, structural validation, unit tests, and heartbeat freshness alert are installed and verified. The HTML simulation artifact itself is not yet in the repository.

**Next operation:** WF-SIM-001, blocked pending an upload or supported transfer of the exact 2.11 HTML file.


## WF-SIM-001 — Preserve and independently verify Cities Laboratory 2.11

**Status:** COMPLETE  
**Scope:** Preserve the exact 2.11 HTML artifact in the project repository and establish its baseline identity and runtime behavior.

**Artifact**
- Repository path: `SIMULATION_WORKDESKS/WELL_FUCK/builds/Well_Fuck_Cities_Lab_2_11.html`
- Source size: 1,549,198 bytes.
- Source SHA-256: `1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05`
- Repository blob: `67d17e7efac74434570f36f6b3f726e945db6f1e`
- Commit: `4e2df3cb073b4b4dceefddf54831edab1378c17a`
- Independent repository blob readback matched the full source text exactly.

**Verification**
- Node.js v22.16.0 syntax check of the sole inline script: PASS.
- Playwright 1.57.0 / Chromium 144.0.7559.96 loaded 2.11 and advanced to turn 1,000: PASS; no page exceptions or console errors.
- 2.10 vs 2.11 comparison, seed 42, 1,000 turns: sampled building count, losses, radiation, half-life, cracks, falls, moving debris, and collapse stage were identical. Main-canvas PNG SHA-256 was identical in both runs: `54ad70bb340e2024b606af123d0ad0ae9264dd18869660fbec32e33dccfd15df`.
- The 2.10 source used in the comparison was independently identified by SHA-256 `90fd48b8e7f15c62bc7dacbcadcc73c5a46c21f142d197e52220d0ff7a253f19`.

**Limitations**
- The 2.10/2.11 comparison covered seed 42 and 1,000 turns; broader multi-seed regression remains queued.
- The 2.11 baseline is preserved unchanged. A later audit found a UI-to-language-RNG coupling, recorded under WF-LANG-001; that defect does not invalidate the artifact-preservation receipt.

**Result:** Exact 2.11 baseline preserved, independently read back, syntax-checked, and browser-tested through 1,000 turns. The artifact is a verified baseline, not a claim that every language mechanic is correct.

## WF-LANG-001 — Audit Language Kernel 0.1

**Status:** COMPLETE  
**Scope:** Inspect the committed 2.11 language implementation, settlement/community integration, RNG paths, and observation interface.

**Artifact:** `LANGUAGE_KERNEL_AUDIT.md`  
**Source:** 2.11 commit `4e2df3cb073b4b4dceefddf54831edab1378c17a`, blob `67d17e7efac74434570f36f6b3f726e945db6f1e`.

**Verified findings**
- 36-entry proto-lexicon, 14 fixed founder phrases, 10 sound laws, and eight phrase mutation operation types.
- IPA segment arrays are authoritative; written form and gloss are projections.
- Communities inherit from settlement clusters; remote daughter-community founding is rare.
- Language evolution uses a distinct RNG stream from the geology/city stream; an isolated harness was deterministic across repeated seed-12345 runs and left the global city RNG unchanged.
- A seed-42 2.10/2.11 browser comparison through 1,000 turns produced identical physical/city stats and main-canvas image.
- Defect confirmed: “Overhear locals” uses `langPick()` and consumes the language simulation RNG. A click at turn 100 changed the turn-1000 language phrase in a same-seed browser comparison while leaving city stats and canvas identical.

**Result:** The current kernel is a phrase-evolution prototype, not yet a productive language engine. The audit preserves its useful foundations and identifies UI RNG isolation as the next correction.

**Next operation:** WF-LANG-004 — decouple notebook/UI sampling from language simulation RNG.


## WF-LANG-004 — Decouple notebook/UI sampling from language simulation RNG

**Status:** COMPLETE  
**Artifact:** Cities Laboratory 2.12  
**Repository path:** `SIMULATION_WORKDESKS/WELL_FUCK/builds/Well_Fuck_Cities_Lab_2_12.html`  
**Commit:** `6241026fabccb413eea6630605fdb68a36db3e70`  
**Blob:** `2be28e6df39bec77067dd147462fbf1799378a94`  
**Size:** 1,549,658 bytes  
**SHA-256:** `0c26d03352d270cb0f3ff3771a0abd5cf542e5a3e1a8ff944a154d96f9f6f486`

**Change**
- Added a dedicated `uiRng` stream with `seedUiRng`, `uiRandom`, `uiInt`, and `uiPick`.
- The presentation stream is initialized on reset from the world seed with a distinct seed transform.
- “Overhear locals” now uses `uiPick()` instead of `langPick()`.
- Added language-kernel boundary markers for source-extracted regression tests.
- Preserved Cities Laboratory 2.11 unchanged.

**Verification**
- Node syntax check: PASS.
- Node language-RNG regression test: PASS. Same seed/action sequence reproduced; UI sampling changed only the presentation RNG; language RNG and physical RNG remained unchanged.
- Playwright browser regression at seeds 42, 7, and 2026, each through 1,000 turns: PASS.
- At each seed, 2.11 and 2.12 baseline language, physical/city statistics, and main-canvas image matched.
- At each seed, a “Overhear locals” click at turn 100 in 2.12 did not change the turn-1,000 language phrase/IPA, physical/city statistics, or canvas; the notebook sample was recorded.
- No page exceptions or console errors in tested runs.

**Result:** The verified UI-to-language RNG coupling is corrected in 2.12. The 2.11 baseline remains available for comparison.

## WF-TEST-001 — Establish reproducibility and RNG-isolation tests

**Status:** COMPLETE  
**Automated test:** `tests/test_well_fuck_language_rng.js`, added to the Well, Fuck. Continuity workflow.  
**Optional browser test:** `tests/test_well_fuck_browser_regression.py`; requires Playwright and Chromium and is run manually, one seed per invocation.

**Evidence**
- Node test passed for deterministic same-seed language evolution, different-seed variation, UI/presentation RNG isolation, and physical RNG non-interference.
- Playwright browser regression passed for seeds 42, 7, and 2026 through 1,000 turns.
- For all three seeds, 2.11 and 2.12 baseline physical/city statistics and main-canvas PNG hashes matched.
- For all three seeds, the 2.12 UI sample did not change language evolution or physical/city output.

**Limit:** The three-seed suite is a useful initial regression set, not exhaustive coverage of all seeds or all possible user interactions.


## WF-LANG-002 — Historical language-change research and computational design (progress checkpoint)

**Status:** ACTIVE / RESEARCH IN PROGRESS  
**Date:** 2026-11-14  
**Research artifact:** `ENGLISH_LANGUAGE_CHANGE_RESEARCH.md`, version 0.1.  
**Working proposal:** `LANGUAGE_MODEL_DESIGN.md`, version 0.3.

**Direction established**
- Historical English is the first empirical case study for realistic language-change mechanisms.
- The model must represent population-level variation, innovation, exposure, adoption, diffusion, and loss.
- Phonology, morphology, syntax, lexicon, semantics, pragmatics, contact, and dialect structure must be able to interact.
- The current 36 proto-lexicon entries and 14 founder phrases are illustrative seed material, not a closed inventory or mandatory protected layer.
- The prior suggestion that all initial phrases should necessarily remain as a separate discourse/idiom layer is withdrawn.
- The starting condition remains open: contemporary-English future descendant versus reconstructed historical English.

**Research sources**
The initial synthesis draws on The Open University, Oxford Research Encyclopedia of Linguistics, and the 2025–2026 New Cambridge History of the English Language chapters on sociolinguistic sources, historical morphology, syntax, semantics, phonology, pragmatic markers, and traditional dialects. Full source details and links are recorded in ENGLISH_LANGUAGE_CHANGE_RESEARCH.md.

**Next**
Decide the intended English starting condition and select the smallest useful computational representation for speaker variation and transmission. Do not begin a large language-engine rewrite before this design gate.


## WF-LANG-002 — MASC source identity and acquisition investigation (progress checkpoint)

**Status:** ACTIVE / acquisition still blocked  
**Date:** 2026-11-16  
**Artifact:** `MASC_SOURCE_ACQUISITION.md`

**Work performed**
- Re-entered from the live repository control records and re-read the active tray, project plan, workflow protocol, language-change laboratory design, and source/gameplay references.
- Rechecked the official ANC download, MASC overview, About, and annotation pages.
- Followed the official MASC download links to the September 2026 GitHub migration release.
- Retrieved release metadata and the migration manifest. Identified the annotated MASC 3.0.0 archive (36,358,521 bytes; published SHA-256 `0b300d96016233c7c79b43559b477a6bb0ed16bb416d5c517eccb108a6228493`) and the data-only archive (1,351,682 bytes; published SHA-256 `0c3f1fd3314ee5ec09830d6f6b217c19a6899d1cabd22c42264578c3348b2d01`).
- Confirmed the official MASC landing page states CC BY 3.0 US while the About page says no license or other restrictions. The migration release says existing dataset-specific license and attribution terms continue to apply. Adopted conservative CC BY attribution handling provisionally pending inspection of the exact archive README and source notices.
- Attempted archive retrieval through the available download route; it failed. No archive bytes were obtained.

**Result and limits**
- Package identity and release-published integrity metadata are now known.
- The archive itself, package README, and text-level notices remain uninspected. Published hashes have not been recomputed locally.
- No corpus manifest has been frozen. No E0 or E1 experiment has run.
- MASC remains a balanced 500K-word, 19-genre baseline, not a comprehensive representation of contemporary informal conversation.

**Next**
Obtain the annotated archive through a working route, verify its hash and internal notices, inspect the resource headers and genre/document mapping, then freeze the stratified sample manifest. Do not substitute web snippets or invented sample records for corpus data.


## WF-LANG-002 — Multi-source reservoir evaluation (progress checkpoint)

**Status:** ACTIVE / candidate selection open  
**Date:** 2026-11-16  
**Artifact:** `LANGUAGE_CORPUS_SOURCE_EVALUATION.md`

**Finding**
MASC 3.0.0 remains useful for its annotations and genre breadth, but should not define contemporary informal English alone. Its public browse catalogue includes dated materials (including a blog item from May 2010), and its 19-genre balance is not equivalent to a sample of everyday current conversation.

**Candidates inspected**
- MaiChat 1.0: 50 dyadic conversations, 100 participants, 4,975 messages / approximately 33,100 words, collected December 2023–May 2025, released June 2026. The README states CC BY-SA 4.0, requires attribution, and requires derivative datasets to use the same license. Promising recent typed-conversation supplement; small and not topic-annotated.
- GUM 7.0: 275 documents / approximately 273K tokens across 24 text types, with rough speech-act and rich discourse/syntactic annotation. Source rights vary; Reddit text is not included in the download and must not be treated as corpus text available for redistribution.
- LANA-CASE: very relevant 2022–2024 everyday conversation at scale, but its posted license limits use to non-commercial research/teaching, prohibits AI training and uploading transcripts to AI services that collect/save data, prohibits redistribution, and prohibits external cloud storage. Excluded from this project workflow absent separate written permission.
- English Everyday-Conversation ASR dataset: 34,777 clips / about 40 hours, stated CC BY-SA 4.0, combining spontaneous EdAcc benchmark material and scripted DailyTalk. Candidate for a later separate spoken-style stratum, subject to upstream-license and attribution verification.

**Result**
A provisional multi-source reservoir is preferable to MASC alone: MASC for annotated genre breadth, MaiChat for recent informal interaction, and possibly a separately labelled spoken corpus later. This is a candidate architecture, not a frozen source decision or sample manifest. Source-specific dates remain provenance, not separate historical speaker cohorts.

**Next**
Acquire and inspect MASC 3.0.0 and MaiChat 1.0 archives; verify their hashes, internal notices, and file structures; then choose source quotas and freeze the sample manifest. No corpus archive has been downloaded or processed in this environment. E0 and E1 remain unrun.
