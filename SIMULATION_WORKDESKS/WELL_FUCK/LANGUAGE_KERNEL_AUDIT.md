# Language Kernel 0.1 — Source Audit

**Audit ID:** WF-LANG-AUDIT-001  
**Status:** INITIAL AUDIT COMPLETE  
**Audit date:** 2026-11-13 (local project date)  
**Source:** `builds/Well_Fuck_Cities_Lab_2_11.html`  
**Source commit:** `4e2df3cb073b4b4dceefddf54831edab1378c17a`  
**Source blob:** `67d17e7efac74434570f36f6b3f726e945db6f1e`  
**Source SHA-256:** `1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05`

## 1. Scope and method

Inspected the committed 2.11 source, including the language state and functions, settlement/community creation, the main turn-advance call path, and the Phrase Field Notebook markup. Ran syntax, browser, seeded-comparison, and isolated language-kernel tests.

This is an implementation audit of the current prototype, not a complete linguistic design specification. Findings below distinguish observed code behavior from proposed next steps.

## 2. Current implementation map

### 2.1 State and representations

The language kernel maintains:

- a global `communities` collection, serial community IDs, and a selected community ID;
- one shared `languageRng` state and a lexeme serial counter;
- a per-community lexicon, phrase sequence, founder/source phrase, display mode, adoption state, sound-change history, phrase history, contextual samples, and scheduled next phrase/sound-change turns.

The prototype lexicon contains **36 entries**. Each entry has a gloss string, an IPA segment array, and a broad class label. The class labels support substitution pools; they do not yet define a productive grammar.

IPA segment arrays are the authoritative phonological representation. Multi-character segments such as /tʃ/ and /eɪ/ are represented as single array elements. A separate mapping projects IPA segments into a rough written form. Phrase display, IPA, and gloss are therefore distinct projections, although semantic representation is currently shallow.

### 2.2 Founder language and phrase evolution

The initial proto-expression is “Well, fuck.” /wɛl fʌk/. The kernel has **14 fixed founder phrases**, all English or near-English expressions.

After turn 20, each living community adopts one founder phrase. Phrase-level change can then use eight operation types:

- expansion;
- reduction;
- replacement from a broad class-alternative pool;
- adjacent reordering;
- reduplication;
- fusion of adjacent lexemes;
- splitting/resegmentation of a multisyllabic form;
- semantic-gloss drift.

The semantic-drift table currently covers six lexeme IDs. Most phrase changes manipulate a stored sequence of lexical IDs; they do not generate novel grammatical structures or compose a new proposition from a semantic representation.

### 2.3 Sound change

There are **10 regular sound laws**:

1. /w/ → /ʋ/ word-initially;
2. /k/ → /x/ word-finally;
3. /t/ → /tʃ/ before a front vowel;
4. /l/ → /ɾ/ intervocalically;
5. /ð/ → /d/ word-initially;
6. /ɛ/ → /e/;
7. /ʌ/ → /ɔ/;
8. /n/ → /ŋ/ before a velar;
9. /s/ → /ʃ/ before /i/;
10. final /t/ loss.

A community selects an applicable law and applies it across its current lexicon. New lexemes lazily inherit the community's saved sound changes when first instantiated. The system records the law, turn, and number of changed occurrences.

### 2.4 Community formation and transmission

Community creation is coupled to building founding:

- the first founding creates an independent proto-community;
- a new building near an existing building (nearest distance under 16 grid cells) joins that building's speech community;
- a remote founding can rarely create a daughter community from the nearest building's community; the current acceptance chance is 6% after the settlement-placement conditions are met;
- a daughter community copies its parent's lexicon, phrase, source phrase, display/adoption state, sound-change list, and history, then evolves its own copied state.

A community only advances linguistically while it has at least one living building. There is no explicit migration, contact network, borrowing process, dialect continuum, or intelligibility model yet.

### 2.5 Timing and turn integration

Each community schedules phrase and sound-change events. After founder adoption, phrase events recur on a randomized interval; a phrase mutation is attempted with probability 0.82. Sound-change events recur on a longer interval. A separate low per-turn probability can replace the current phrase with another stock idiom.

The main simulation calls `advanceLanguages()` at the end of a turn, after geology, debris, ecology, and building-survival updates. Language evolution is therefore integrated into the turn loop without being used to calculate those physical updates.

### 2.6 Observation interface

The interface exposes Speech Communities and a Phrase Field Notebook. The notebook displays the current phrase, IPA, source phrase, gloss, phoneme inventory, recent sound changes, phrase lineage, and contextual samples.

The “Overhear locals” control currently does **not** generate a new utterance from an actual simulation event. It records the current phrase and chooses one label from a fixed list of seven possible contexts (roof fracture, sudden flood, successful harvest, stranger at the entrance, new tunnel, clearing sky, or a building lost to the ground).

## 3. Random-stream audit

The language subsystem uses a separate xorshift stream:

- `seedLanguageRng(seed)` initializes it from the world seed XORed with a fixed constant;
- `langRandom()`, `langInt()`, `langPick()`, and `langChance()` draw from that stream;
- the inspected language-kernel block contains no direct calls to the geology/city `random()` function.

This separation is supported by the following reproducible observations:

1. An isolated language-kernel harness produced identical 1,200-turn outcomes when repeated with seed 12345.
2. A different language seed (12346) produced a different language trajectory.
3. The global city RNG state remained unchanged during isolated language evolution.
4. A full-browser comparison of 2.10 and 2.11, seed 42, 1,000 turns, produced identical displayed geology/city statistics and an identical main-canvas screenshot hash.

**Important qualification:** all communities currently share one global language RNG. This is separate from the physical/city RNG, but it is not a separate random stream per community. The order and number of community draws can therefore affect later communities' random outcomes. Whether per-community streams are worth the added complexity is an open design question.

## 4. Verified defect: UI sampling perturbs language evolution

The “Overhear locals” control calls `langPick()` to select its context label. `langPick()` draws from the same `languageRng` used by phrase adoption, mutation, and sound changes.

A same-seed browser experiment demonstrates the consequence:

| Run | Action | Turn-1000 phrase | IPA |
|---|---|---|---|
| Baseline | No notebook interaction | “Vi fuk!” | /ʋi fʌk/ |
| UI sample | Click “Overhear locals” once at turn 100 | “We're fucked!” | /ʋɪɹ fʌkt/ |

Both runs used seed 42 and reached turn 1,000. Their displayed building counts, losses, radiation, half-life, cracks, falls, moving debris, collapse stage, and main-canvas screenshot hash were identical. There were no page exceptions in either run.

The click therefore changes the future language trajectory while leaving the physical/city trajectory unchanged. This is an unintended coupling between presentation interaction and simulation evolution.

**Required correction:** presentation-only sampling must use a separate UI/presentation RNG or a stateless deterministic selector. It must not consume the language simulation stream. Add a regression test proving that inserting an “Overhear locals” action does not change the eventual language state for a fixed seed.

## 5. Test evidence

Environment: Node.js v22.16.0; Python 3.13.5; Playwright 1.57.0; Chromium 144.0.7559.96.

| Test | Result | Scope / limitation |
|---|---|---|
| Extract sole inline script and run `node --check` | PASS | Syntax only |
| Load 2.11 into Chromium with Playwright and advance to turn 1,000 | PASS | No page exceptions or console errors; five speech communities present |
| 2.10 vs 2.11, seed 42, 1,000 turns | PASS | All sampled city/geology stats identical; main-canvas PNG SHA-256 identical: `54ad70bb340e2024b606af123d0ad0ae9264dd18869660fbec32e33dccfd15df` |
| Isolated language kernel, seed 12345 repeated | PASS | Same phrase, IPA, gloss, lexeme count, sound-change sequence, history length, and final language RNG state |
| Isolated language kernel, seed 12346 | PASS | Different language trajectory |
| Isolated language updates vs global city RNG | PASS | City RNG state unchanged |
| “Overhear locals” UI action at turn 100 | FAIL / DEFECT CONFIRMED | Changes turn-1000 language phrase by consuming simulation language RNG |
| Full multi-seed 2.10/2.11 comparison | NOT YET RUN | Remains a broader regression task |

The 2.10 comparison source was independently identified by SHA-256 `90fd48b8e7f15c62bc7dacbcadcc73c5a46c21f142d197e52220d0ff7a253f19`.

## 6. Limitations and design gaps

1. **Phrase evolution is not productive grammar.** Word order, class substitution, fusion, and splitting create variation, but there is no productive syntax or morphology.
2. **Meaning is represented mainly by gloss strings.** There is no structured semantic inventory, compositional meaning, argument structure, or interpretation layer.
3. **Lexical productivity is limited.** The 36-entry proto-lexicon and 14 founder phrases are fixed; fusion and splitting derive forms from existing material rather than introducing a concept-driven lexicon.
4. **Contextual samples are labels, not event-grounded speech.** The current notebook does not yet generate utterances from actual event state.
5. **Communities share a language RNG.** This is physically separate but creates possible ordering dependence between communities.
6. **UI interaction affects the language stream.** The verified “Overhear locals” coupling must be removed.
7. **Social transmission is rudimentary.** Inheritance and rare daughter-community founding exist; contact, borrowing, convergence, dialect continua, and mutual intelligibility do not.
8. **Community extinction is implicit.** A community with no living buildings stops evolving but remains in the community collection; there is no explicit extinction or dormant-state model.

## 7. Recommended next steps

1. Decouple notebook/UI sampling from the language simulation RNG and add a regression test.
2. Add multi-seed regression tests comparing 2.10 and 2.11 physical/city outcomes, then use the same suite to protect future language changes.
3. Preserve the existing kernel rather than replacing it wholesale. Its IPA representation, sound-law history, phrase lineage, inherited lexicon, and community scaffolding are useful foundations.
4. Design a structured concept/semantic layer and productive lexicon before adding broad grammatical machinery.
5. Treat contextual speech as a later event-linked layer, replacing arbitrary sample labels with actual event contexts.
6. Defer per-community RNG streams until experiments show that community-order dependence is materially harmful.

## 8. Audit conclusion

Language Kernel 0.1 is a working phrase-evolution prototype with real phonological state and community inheritance, not yet a productive language engine. The physical/city random stream remained unchanged in the tested seed-42 2.10/2.11 comparison. The most immediate defect is narrower: the notebook's “Overhear locals” interaction consumes the language simulation RNG and changes later linguistic evolution. Fix that coupling before expanding the language model.


## 9. Follow-up correction and verification in Cities Laboratory 2.12

The defect in Section 4 was corrected in 2.12 without modifying the preserved 2.11 artifact.

**Implementation**
- Added a separate `uiRng` stream, seeded on reset from the world seed with a distinct seed transform.
- Added `seedUiRng()`, `uiRandom()`, `uiInt()`, and `uiPick()`.
- Changed “Overhear locals” to use `uiPick()` rather than `langPick()`.
- Added explicit language-kernel source markers so the simulation logic can be tested in isolation.
- Kept 2.11 unchanged as the comparison baseline.

**2.12 identity**
- Commit: `6241026fabccb413eea6630605fdb68a36db3e70`.
- Artifact blob: `2be28e6df39bec77067dd147462fbf1799378a94`.
- SHA-256: `0c26d03352d270cb0f3ff3771a0abd5cf542e5a3e1a8ff944a154d96f9f6f486`.
- Size: 1,549,658 bytes.

**Regression result**
At seeds 42, 7, and 2026, each run advanced to turn 1,000:

- 2.11 and 2.12 baseline language phrase/IPA matched.
- 2.11 and 2.12 physical/city statistics matched.
- Main-canvas PNG hashes matched.
- A turn-100 “Overhear locals” action in 2.12 did not change the turn-1,000 phrase/IPA or physical/city outputs.
- The UI sample remained recorded in the notebook.
- No page exceptions or console errors occurred.

The automated Node regression is `tests/test_well_fuck_language_rng.js` and is included in the continuity workflow. The optional Playwright browser suite is `tests/test_well_fuck_browser_regression.py`; it can be run one seed per invocation.

**Conclusion:** The specific UI-to-language RNG coupling identified in 2.11 is corrected and regression-tested in 2.12. The broader design question of one shared language RNG versus per-community streams remains open.
