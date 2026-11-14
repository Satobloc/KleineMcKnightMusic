# Active Tray

<!-- machine-state:start -->
operation_id: WF-LANG-004
status: ACTIVE
priority: P1
started_utc: 2026-11-14T05:01:52Z
<!-- machine-state:end -->

## Operation

**Title:** Decouple notebook/UI sampling from language simulation RNG.

**Question:** Can the “Overhear locals” observation control remain useful without changing the future language trajectory for a fixed world seed?

**Baseline**
- Preserved source: `builds/Well_Fuck_Cities_Lab_2_11.html`
- Baseline commit: `4e2df3cb073b4b4dceefddf54831edab1378c17a`
- Baseline artifact SHA-256: `1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05`
- Source audit: `LANGUAGE_KERNEL_AUDIT.md`

**Verified defect**
The “Overhear locals” button uses `langPick()`, which consumes the same `languageRng` stream as founder phrase adoption, phrase mutation, and sound changes. In a same-seed browser comparison, one click at turn 100 changed the turn-1000 phrase from “Vi fuk!” /ʋi fʌk/ to “We're fucked!” /ʋɪɹ fʌkt/. City/geology statistics and the main-canvas screenshot remained identical.

**Scope**
- Preserve 2.11 unchanged as the baseline.
- Add a separate presentation/UI RNG, or use a stateless deterministic context selector.
- Ensure reset initializes the presentation stream from the world seed without sharing mutable state with language or physical simulation streams.
- Change only the notebook's context-sampling path.
- Produce a new versioned build (2.12), not an overwrite of 2.11.
- Add a repeatable regression test proving that UI sampling does not alter the language trajectory.
- Confirm same-seed determinism and unchanged physical/city output.

**Stop condition**
A new build passes syntax and browser checks; same-seed runs with and without notebook interactions produce identical language evolution and identical physical/city outcomes; UI context sampling remains functional and deterministic; the new artifact is committed and independently read back.

**Out of scope**
- Productive grammar or broad lexicon design.
- Social contact, borrowing, dialect continua, or intelligibility.
- Geological feature development.
- Changes to existing ChatGPT scheduled tasks.

**Next cursor:** patch the UI sampling RNG path, run the paired same-seed browser regression, then publish and verify 2.12.
