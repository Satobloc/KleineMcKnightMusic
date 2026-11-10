# HsH Music and Suno Archive: Discovery Register

**Snapshot date:** 2026-11-10  
**Purpose:** identify HsH music/Suno material for careful incorporation into KleineMcKnightMusic (KMcKM).  
**Source repositories inspected:** Satobloc/HsH and Satobloc/SAT_THEORY_ARCHIVE_2023-25.  
**Source branch snapshots:** HsH main at d8ff1b01c67fd5528e00b28a8f5027102be994ac; SAT archive main at 7a46a3077c20617c0163071bcdd8ab7d2e42e57e.

## Scope and search limitations

This is a **targeted discovery register, not an exhaustive archive census**.

The HsH onboarding instructions designate Mersearch as the preferred archive search route across all three repositories. The four shared Mersearch request lanes were already occupied by older requests whose results were not independently verified. They were not overwritten. I therefore used repository-scoped GitHub code search as a bounded fallback in HsH, the historical SAT archive, and HSH_RESOURCES. That search surfaced the material below, but it does not reproduce Mersearch's coverage or its exclusion controls. HSH_RESOURCES did not surface a clearly task-relevant primary Suno conversation in this limited pass; that is not evidence that none exists.

NotebookLM exports and generated summaries are treated as discovery aids, not substitutes for the underlying conversation or artifact. Exact source paths and blob SHAs are retained so future work can recover the original.

## Priority sources inspected

### 1. Blowing up Suno
- **Repository/path:** Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/26.05.21•26.05.21•Blowing up Suno — raw.json
- **Conversation ID:** 6a0f839f-99ec-83ea-a146-cdc115ce4f1c
- **Conversation date:** 2026-05-21
- **HsH blob SHA:** 50e24472054a9f02475ddfaacf82c6d6866141af
- **Evidence types:** direct user prompt artifact; user methodological correction; assistant interpretation.
- **Why it matters:** develops a structural-intermesh prompt in which distinct musical systems share a composition without being forced into a single stylistic resolution. The prompt describes rhythmic cooperation despite harmonic friction, timing drag, regional/acoustic accent retention, partial synchronization failures, resonance spillover, shifting dominance, and hooks surviving as fragments between incompatible systems. A six-phase progression moves from instrumental material through resonance and breath-like sound toward vocal emergence, contamination, convergence, and dissolution.
- **Important correction from Nathan:** instructions and lyrics must remain clearly delineated. The user reported that otherwise instructions tend to become sung material, with a start_on plus quoted-lyrics construction appearing to be a comparatively stable exception. The assistant's proposed combined global/lyrics block was rejected.
- **Evidence limit:** the inspected material establishes the prompt construction and the user's correction. It does not by itself establish that the described behavior occurred reliably in generated audio. The assistant's language about attractors, token behavior, phase-locking, and internal mechanisms remains hypothesis, not access to Suno internals.
- **Recommended KMcKM destinations:** Source_Hopper; later, a candidate behavior note and a controlled experiment proposal in SUNO_WORKDESKS. Do not promote it to a validated prompt rule without the associated generation, settings, and listening record.

### 2. Predict the Song Style
- **Repository/path:** Satobloc/HsH, Predict the Song Style.txt
- **Conversation ID:** 6ad0cf68-eebc-83ea-9da8-4aa0b56bad53
- **Conversation date:** 2026-10-15; the archive text reports 527 messages.
- **HsH blob SHA:** ec2b7b9273733ce1436f5034cc3481b3fad9e908
- **Conversation locator:** https://chatgpt.com/c/6ad0cf68-eebc-83ea-9da8-4aa0b56bad53?src=history_search
- **Evidence types:** original prompts and revisions; user listening reports; assistant analysis.
- **Why it matters:** a substantial exploratory history involving dense cross-regional genre and instrumentation combinations, personal style inventories, mashup inputs, highly malformed text, syllable/morpheme rhyme, and replacing syllables with their closest English-sounding counterparts. It also contains user descriptions of generated results, including reports of unexpectedly light/upbeat or catchy outcomes, creepy or unusual vocals, glitch-twinkly textures, and recognizable Arabic-classical elements.
- **Evidence limit:** the user's descriptions are valuable creator/listener observations, but this pass did not independently retrieve and measure the associated audio. The conversation also contains many prompt revisions, so an output cannot be attributed to a single variable without reconstructing its exact prompt lineage and settings.
- **Recommended KMcKM destinations:** Source_Hopper; candidate cases for Lyrics_Hopper/VOCALICS and Prompt_Examples_Hopper after rights review; derived observations for the behavior registry only after linking the exact audio and prompt versions.

### 3. Suno prompt writing: reconstructing a target without naming it
- **Repository/path:** Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/CONVOS_23/26.10.15•26.10.15•Suno prompt writing — raw.json
- **Conversation ID:** 6ad0c7e7-ed44-83ea-a768-f35daab5f114
- **Conversation date:** 2026-10-15
- **HsH blob SHA:** 976e7139f04d7e2fde2330b42f609576b7e1b72f
- **Evidence types:** user task; assistant-generated target decomposition and prompt proposal.
- **Why it matters:** asks for a prompt that might evoke the musical identity of a named reference without invoking the artist, title, or lyrics. The answer decomposes the target into musical architecture, emotional trajectory, vocal character, instrumentation, production, dynamics, and recording space.
- **Evidence limit:** the returned prompt is a model prediction, not a demonstrated reconstruction. It is a promising blind-evaluation design, not proof that descriptive decomposition converges on the target.
- **Recommended KMcKM destinations:** Source_Hopper and a future target-reconstruction experiment. Use blind listening and independent ratings if tested.

### 4. SUNOCLAUS
- **Repository/path:** Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_1/SUNOCLAUS.txt
- **HsH blob SHA:** 3653212cae5b116cdde2da362717a73dd8bcc1c5
- **Evidence types:** original creative prompt and multi-perspective framing experiment.
- **Why it matters:** a playful generative challenge asks the system to gather clues from a story, consider multiple character viewpoints, use the wider context, and choose a point of view for a song. It includes a discussion about originality and whether Suno can write something supposedly unseen or unheard before.
- **Evidence limit:** it is a creative mirror-test and a question about musical generation, not a controlled test of Turing completeness, originality, or model architecture.
- **Recommended KMcKM destinations:** Source_Hopper; possible case study in narrative framing and multi-perspective composition. Preserve the original in HsH.

### 5. Weirdness on Rails
- **Repository/path:** Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/Weirdness On Rails__NotebookLM_export.json
- **Notebook capture:** 2026-11-04; 50 visible sources in the export metadata.
- **HsH blob SHA:** 30ff1daff61227f3029ab504ece55b312be803fb
- **Evidence types:** NotebookLM-generated synthesis and a user-supplied song-score construction.
- **Why it matters:** contains a surreal, highly specific Suno score framed as a musical world, with chamber-folk, glitch-pop, acoustic and mechanical textures, and lyrics that mix historical, technical, and invented references.
- **Evidence limit:** this is a NotebookLM export. Its summaries and citation markers are not replacements for the underlying 50 sources. Some of the vocabulary is SAT-specific and should not be imported as KMcKM doctrine merely because it appears in a music score.
- **Recommended KMcKM destinations:** Source_Hopper and, after source-by-source review, a case note about narrative/world construction and deliberate semantic collision.

### 6. Code-like Text Style Emulation
- **Repository/path:** Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/Code-Like Text Style Emulation - bellomy - to Oct-2023.txt
- **HsH blob SHA:** b12769cf5ff8e723515647fa980b9368d558a221
- **Evidence types:** early user-authored text sample and iterative style-transformation dialogue.
- **Why it matters:** documents iterative manipulation of a dense code-like prose form: replacing generic imagery with concrete specialist vocabularies, changing punctuation and relation markers, and shifting lexical domains while preserving the overall construction. This is a useful precursor to treating text morphology, register, and vocabulary as experimental musical inputs.
- **Evidence limit:** this is a text-style experiment, not a verified Suno experiment. It should not be represented as evidence of audio-generation behavior.
- **Recommended KMcKM destinations:** Source_Hopper; possible later relation to Lyrics_Hopper, VOCALICS, and the representational-language idea mine.

### 7. Glossolalia source compilation
- **Repository/path:** Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/GLOSSOLALIA.txt
- **HsH blob SHA:** 43feeb89abe60c14b655aef5a90c5cc24b083e24
- **Evidence types:** embedded third-party research text and mixed collected material.
- **Why it matters:** contains a scholarly discussion of glossolalia, learned vocal behavior, phonetic production, and social/cultural context. It could inform probes that separate phonetic form from lexical semantics.
- **Evidence limit:** the file appears concatenated with unrelated material. Its complete bibliography, original article identity, source boundaries, and reuse terms require cleanup before citation or quotation. Do not mirror the article or the unrelated review material.
- **Recommended KMcKM destinations:** Source_Hopper as an unresolved research lead; later use in VOCALICS only after bibliographic and rights review.

### 8. Deep Dive Prompt Knelling Box
- **Repository/path:** Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/DEEP DIVE PROMPT KNELLING BOX.txt
- **HsH blob SHA:** 8f273b13fb26d81df943f0191901b7b39a0a3b1f
- **Evidence types:** exploratory prompt-method catalogue and assistant-generated examples.
- **Why it matters:** catalogs structural prompt patterns including role assignment, sequential task instructions, third-person projection, forced tradeoff ordering, contradiction injection, permission framing, alternative voicing, and candidate-plus-audit loops. These are useful as a menu of possible LLM elicitation strategies.
- **Evidence limit:** the catalogue is not a benchmark of prompt effectiveness. Many examples are SAT-specific, and prompts requesting an LLM to describe its inner self or hidden mechanisms do not establish that such self-reports are factual.
- **Recommended KMcKM destinations:** distilled method notes in the LLM workshop, not wholesale copied examples.

### 9. Doo-wop duet prompt
- **Repository/path:** Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_1/25.12.03•25.12.03•Doo-wop duet prompt  .txt
- **Conversation ID:** 693083da-dea4-8326-ba42-7d65f6e113b4
- **Conversation date:** 2025-12-03
- **HsH blob SHA:** 9e7c72b15d2bb61d02df12c9f40bbd342f2231b5
- **Evidence types:** prompt adaptation and creative production exercise.
- **Why it matters:** explores a strong stylistic collision, distinct duet roles, contrasting vocal performance, and translating a detailed reference description into generation-oriented language.
- **Evidence limit:** the source includes a well-known copyrighted song reference and lyrics. Keep the source linked; do not copy its lyrics or other protected material into KMcKM.

### 10. Musical taste analysis and Music Genre List
- **Musical taste analysis:** Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/25.12.03•25.12.03•Musical taste analysis  .txt; conversation ID 69309308-f878-8329-9fa7-7ecff8505258; blob SHA 0a56d16ea9b9e29b45250a5ec069890ccbba2afd.
- **Music Genre List:** Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/26.01.26•26.05.21•Music Genre List  .txt; conversation ID 69770920-1a30-832b-b5d2-af5f2d5dfe7b; blob SHA af30ad003e451e0a26b2c21d4080baae105393e2.
- **Why they matter:** the first contains a personal listening-history list used for taste analysis; the second is a very large, mixed-vintage and mixed-granularity genre vocabulary collection.
- **Import boundary:** do not publish the listening-history list or dump the giant genre list wholesale. The first is private preference material; the second needs deduplication, terminology checking, source/provenance checks, and normalization before selected terms are promoted to Genre_Hopper.

### 11. Making AI Music Weird
- **Repository/path:** Satobloc/SAT_THEORY_ARCHIVE_2023-25, DEBATING AI PODCAST/Debating A.I. On the Future of Physics - Making AI Music Weird.srt
- **Archive blob SHA:** 26bd5b4ac6dbca0617c9a289c4741409de09c94e
- **Episode metadata in transcript:** 35 minutes; published 2026-05-17.
- **Evidence types:** podcast transcript and retrospective album/lyric commentary.
- **Why it matters:** a retrospective analysis of an experimental music/lyric project and its conceptual architecture. It is adjacent to the creative-history record, not a direct Suno prompt test.
- **Import boundary:** link-only until the episode and transcript provenance, authorship, and underlying source artifacts are reviewed.

## Additional leads not yet cleared

The limited search also surfaced Song Structure Arrangement, mashup material, further deep-dive interview files, and NotebookLM collections such as All the Sweet Spots Together and To Be. These are not yet classified as direct Suno experiments. They remain second-pass retrieval candidates, not imported evidence.

## Import rule

KMcKM receives **derived research notes, source pointers, and reviewed user-authored concepts**, not raw HsH conversation exports, complete lyric collections, private listening histories, or copied third-party articles. HsH remains the authoritative home for the originals. A source being named here does not grant permission to reproduce its contents.
