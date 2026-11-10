# HsH Music and Suno Archive: Second-Pass Intake

**Snapshot date:** 2026-11-10  
**Purpose:** supplement the first HsH source register with additional music, composition-tool, and LLM-strategy sources discovered during a bounded second pass.  
**Primary register:** [HSH_MUSIC_SOURCE_MAP_2026-11-10.md](HSH_MUSIC_SOURCE_MAP_2026-11-10.md)  
**Source repositories:** `Satobloc/HsH`; `Satobloc/SAT_THEORY_ARCHIVE_2023-25`.

## Scope

This is still a targeted discovery and triage pass, not a complete archive migration. The shared Mersearch request lanes remained occupied, so I did not overwrite them. Repository-scoped GitHub search was used as a bounded fallback. The podcast transcript and NotebookLM exports below are derivative materials; they are not substitutes for the underlying prompts, conversations, music files, or audio.

## Additional music and composition sources

### 1. Suno Nonsensorium 2
- **Repository/path:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/DEBATING AI PODCAST/Debating A.I. On the Future of Physics - Suno Nonsensorium 2.txt`
- **Blob SHA:** `29a5b67e6b469b48bed6d6cd92c6bfc7543af341`
- **Episode metadata:** 38 minutes; transcript identifies publication as 2026-08-13.
- **Evidence class:** AI-generated podcast / transcript derivative; secondary interpretation of HsH material.
- **Why it matters:** the episode describes a line of experiments using mixed scripts, Unicode, punctuation, brackets, sparse phonetic fragments, vowel-only and consonant-heavy strings, invented dialects, and deliberately malformed or dense text as inputs to Suno. It also discusses a proposed “one-word” or tiny-phonetic-seed technique, invented historical-sounding language, and a dual writing method in which mundane episodic detail is transformed through an archaic/mythic lyric register.
- **Potentially useful experimental factors surfaced by the transcript:** semantic wording; phonetic/prosodic shape; punctuation and whitespace; bracket conventions; mixed alphabets/scripts; character density; prompt sparsity; invented lexical systems; and the relationship between plain-language narrative and stylized lyric transformation.
- **Critical epistemic warning:** the podcast repeatedly presents speculative interpretations as though they were established facts about Suno's architecture. Its five “channels” (semantic associations, phonetic/prosodic material, learned document conventions, visual/sequential morphology, and generative uncertainty) are the podcast's explanatory heuristic, not verified model components. Claims that Suno literally sees the visual shape of a text block, that brackets invoke a known internal command channel, or that the model experiences “algorithmic panic” are not established by this transcript. We cannot infer tokenization, weighting, architecture, training data, or internal states from the narrator's interpretation.
- **Transcript quality:** automatic transcription appears noisy. Several coined terms and names are transcribed inconsistently. The episode description uses “Gnurshwriting”; the transcript renders variants such as “Nurse writing,” “idiolia,” and other uncertain forms. Do not treat every transcripted term as an exact user coinage without checking the original material.
- **Recommended KMcKM use:** retain as a navigational secondary source and idea prompt. Recover original HsH prompts and generated audio before creating experiment entries. Use the candidate factors above to design comparisons, not as rules.

### 2. Neo-Riemannian Cube Dance
- **Repository/path:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.07.25•24.07.25•Neo-Riemannian Cube Dance — raw.json`
- **Conversation ID:** `9af17211-eccf-41ab-9b68-767a48816791`
- **Date:** 2024-07-25
- **Blob SHA:** `ec042e53cfcf1a7b5bd6215df22f3f3906468720`
- **Evidence class:** user-directed composition-tool exploration; assistant-generated code and user-reported execution results.
- **Why it matters:** the user asks whether Neo-Riemannian P/L/R transformations can bridge arbitrary major/minor triads, then requests Sonic Pi code to find and play transformation paths. The assistant produces several versions of code. The conversation captures testing and debugging, including a simplified chord playback test that worked while the actual Cube Dance transformation code did not.
- **Important result:** this is not a successful implementation to copy as a working module. It is a useful code-generation failure and debugging case. The proposed transformation/pathfinding code has unresolved issues in pitch-class normalization, chord identity/equality, transformation definitions, and use of Sonic Pi chord objects. The final assistant response falls back to a manually enumerated chord progression rather than repairing the actual P/L/R pathfinder.
- **Recommended KMcKM destination:** cross-reference from `corpus/Sonic_Pi` and the code/tooling audit. Reconstruct the transformation graph from validated music-theory definitions, implement pitch-class canonicalization and pathfinding independently, and test each edge with exact note sets before treating it as a reusable tool. Preserve the HsH conversation as the source of the failure history.

### 3. All the Sweet Spots Together
- **Repository/path:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/4Oct2026/[🗄️] All the Sweet Spots Together__NotebookLM_export.txt`
- **Captured:** 2026-10-07
- **Visible source count:** 50
- **Blob SHA:** `124ef2c12d4af5b27fe295c24f59348f7effedd5`
- **Evidence class:** NotebookLM synthesis / generated case catalogue.
- **Why it matters:** the export surfaces a broad catalogue of experimental sound-world ideas, including viscous piano resonance, non-lexical phonetic drift, textural dropout, deliberately awkward brass intonation, braided rhythmic systems, sticky vocal layering, resonance spillover, vowel/timbre negotiation, ensemble synchronization failure, and mythic language applied to mundane material.
- **Caution:** the entries are NotebookLM-generated descriptions and may paraphrase, combine, or misattribute source material. They do not independently establish that a track exists, that a prompt was used, or that the described sound was heard. Some terminology is SAT-specific and may be a summary artifact.
- **Recommended KMcKM use:** use as a retrieval index for locating primary source prompts, conversations and audio cases. Promote an idea to `idea_mines` only with a link to the underlying source and a clear “NotebookLM-derived lead” label.

### 4. Heterogeneous music and glossolalia source collage
- **Repository/path:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/mashup.txt`
- **Blob SHA:** `dddce1beb0de8ff18a9ab749a1e1aea27c3e4d24`
- **Evidence class:** mixed external text excerpts, bibliographic fragments, music examples, and source collage.
- **Why it matters:** includes material on glossolalia phonetics, vocal production, non-lexical language, ritualized speech, pseudo-language music (including “Prisencolinensinainciusol”), and assorted musical references.
- **Caution:** the file combines material from different sources and contexts. It includes lengthy third-party text and reviews, incomplete attribution, and unrelated music references. It is not a clean research dataset. Do not copy its text into KMcKM. Bibliography and rights must be reconstructed at source level before citing or extracting.
- **Recommended KMcKM use:** link-only research lead for a future phonetic/vocal research review.

### 5. MASHUP_PROMPTS
- **Repository/path:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/MASHUP_PROMPTS.txt`
- **Blob SHA:** `ad19394acaefdb9525a4071d348be26b42edb02b`
- **Evidence class:** mixed-source prompt and reference collage.
- **Why it matters:** combines quotations, religious testimony, glossolalia references, album/record reviews, and a performance-oriented field note describing pulse, non-lexical sound, vocal timbre and transitions.
- **Caution:** the file's parts are not all user-authored and should not be treated as a single composition or controlled test. Source boundaries and rights remain unresolved.
- **Recommended KMcKM use:** preserve as a source pointer. Later extract only clearly attributable, rights-cleared claims or user-authored concepts.

### 6. music_lang
- **Repository/path:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/music_lang.txt`
- **Blob SHA:** `8f48fc8c6bfda65c734e7c3f38a5518900ae2455`
- **Evidence class:** mixed music vocabulary and third-party source collage.
- **Why it matters:** includes notes on hook vocabulary (earworm, catchphrase, tag, lick, riff, motif, stinger) and descriptors such as sticky, infectious, hypnotic, explosive, sweet and punchy, alongside very large concatenated genre strings and copied album reviews.
- **Caution:** the genre string is not delimited or attributed well enough to use as a dataset. Review text is third-party material. Do not bulk-import or normalize the file as a KMcKM vocabulary list.
- **Recommended KMcKM use:** possible source for a small, separately verified hook-vocabulary note after the provenance and rights of each element are checked.

### 7. Future of AI Music
- **Repository/path:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.07.27•24.07.27•Future of AI Music — raw.json`
- **Conversation ID:** `016d7122-fcde-4b73-b934-3e9edaebaa83`
- **Date:** 2024-07-27
- **Blob SHA:** `ba68a31e7996167454770de0cc1c7c16f33b0b19`
- **Evidence class:** historical LLM speculation.
- **Why it matters:** an early broad question about how the music world could change with ubiquitous AI-generated music. The answer imagines democratized production, new genres, human-AI collaboration, context-personalized music, abundance and curation problems, royalties and live/interactive performance.
- **Caution:** this is a single-turn historical model response, not research evidence or a reliable forecast. It can be retained as a dated snapshot of early expectations, not used as current factual analysis.

## Existing material confirmed as overlap, not a new import

### Sonic Pi Code Recall
- **Repository/path:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/24.11.11•24.11.11•Sonic Pi Code Recall — raw.json`
- **Conversation ID:** `6731acae-85cc-8003-bb40-6023bd70c8fb`
- **Date:** 2024-11-11
- **Blob SHA:** `3246eeb0239ce2edf7bdd71560834e38f7d31203`
- **Finding:** the conversation includes a large Sonic Pi sample-inventory test and an all-scales/all-chords random chord-and-arpeggio loop. The same broad materials are already present in KMcKM's `corpus/Sonic_Pi/ALL_SAMPLES.rb` and `corpus/Sonic_Pi/ALLSCALESCHORDS.rb`. This is lineage/duplicate evidence, not a reason to create another pair of source files.
- **Recommended KMcKM use:** add a provenance pointer only if useful to the existing Sonic Pi inventory; do not duplicate the code.

## Additional NotebookLM and LLM-method leads

### NotebookLM source catalogues
- `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/[🗄️] 🕸️🪢MODES_environment.forcefit_active__NotebookLM_export.json`
- **Blob SHA:** `685a6d1457ff5d626fd98143590442f3072be84d`
- The export contains 50 sources and a visible output named “The Four-Dimensional Morphology of Music: An Analysis within the Scalar-Angular-Torsion Framework.” This is SAT-framed NotebookLM synthesis, not established musicological or Suno research. It is low-priority unless a primary musical artifact can be recovered.

### LLM and prompt-workflow references
- `DEVELOPMENT_FULL_CONVOS/CONVO_HAUL_2NOV2026/Prompt Puller.md` (HsH blob SHA `51349ac0767c12e5a7868974c10c9da9db5bdc37`): a 146-message prompt-source extraction conversation. Its transferable lesson is to preserve complete source prompts and attached preference/control tags, while recognizing document-specific segmentation. It concerns Midjourney/OS-00 material, not Suno. Its assistant-generated parser proposal used blank-line splitting and would risk fragmenting multiline prompts; the user's correction emphasized preserving the source block and its tags.
- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/CGPT_USAGE.txt` (HsH blob SHA `c7597ec17b7eee3aebf0297e6ddc07527af5725e`): historical ChatGPT plugin and code-review settings inventory. It includes account/activity details and unrelated workflow information. It is not a transferable instruction guide and was not copied.
- `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/NLM MODES.txt` (HsH blob SHA `36ecd6c3341aa737645cb761fb84ab6210c92ccd`): an exported NotebookLM workspace page, not a reliable general LLM operating manual. It is strongly SAT-specific.
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/MAKING FRIENDS WITH NOTEBOOKLM.txt` (HsH blob SHA `160d20c6f7026d43ca851589c9f8a76054d572dc`): contains NotebookLM-generated summaries that make very strong, unsupported claims about the SAT/Blockwave framework. It is a useful negative example: never treat fluent NotebookLM synthesis, model self-description, or cited-looking prose as proof. Claims must be checked against underlying primary material and calculations.
- `INTERNAL/WORKING_INSTRUCTIONS.md` (HsH blob SHA `54f047b90c42a5bd9fc0d3b06bdd16a33cb492b4`): HsH theory-specific contributor instructions. Its generalizable method is “Observe → Catalog → Contextualize → Evaluate,” together with the rule that indexes are navigational aids, not truth or canonical status. Its physics prerequisites, stop orders, and theory-specific workflow are not KMcKM rules.
- `🔑/🔑.md` (HsH blob SHA `c05b39f8a84bcc95bcc59c9e09f8a3ac98064cab`): a SAT/H(s)H teaching overview and physics-specific instructions. Not a music import.

## Transfer decisions

- Import **source identities, provenance, user-authored methodological corrections, and carefully bounded derived summaries**.
- Keep raw HsH conversations and NotebookLM exports in HsH. KMcKM's source and privacy policy does not call for copying full conversation exports.
- Do not publish copyrighted song lyrics, long album reviews, private listening histories, or third-party research excerpts from the mixed source files.
- Do not treat an AI podcast, NotebookLM summary, or prior assistant code as a validated description of Suno or a functioning composition tool.
- For any candidate experimental claim, recover the exact prompt and output lineage, model/version, mode, settings, source/reference inputs, and listener/measurement evidence before creating a behavior-registry rule.
- Keep composition-tool lineage (Sonic Pi, Neo-Riemannian transformations, chord-pathfinding) distinct from Suno-specific prompt behavior.

## Next cursor

1. Use these new source pointers to recover primary prompts, code states, and audio cases.
2. Audit Neo-Riemannian code with a deterministic pitch-class test suite before deciding whether to adopt or replace it.
3. Trace the “All the Sweet Spots Together” NotebookLM entries to the original cases.
4. Reconstruct citations for the glossolalia material before drafting any literature note.
5. Run Mersearch over the three HsH/SAT/HSH_RESOURCES repositories when a request lane is safely available. This second-pass list does not replace that search.
