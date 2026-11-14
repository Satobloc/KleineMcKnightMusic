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
