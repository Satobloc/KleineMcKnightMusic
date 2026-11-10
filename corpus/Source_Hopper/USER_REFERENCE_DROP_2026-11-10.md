# User-Supplied Music and Reference Drop — 2026-11-10

**Intake type:** user-provided ChatGPT conversation exports  
**Received:** 2026-11-10  
**Files received:** 12  
**Unique conversations:** 11 (the two “Suno prompt writing” uploads are byte-identical copies of one conversation)  
**Purpose:** source-grounded triage and routing into the existing KMcKM corpus, without copying private raw conversations or collapsing the user's creative materials into the assistant's research collections.

## Governing distinction: complementary input lanes

The user's instruction in **Predict Suno's Sound** is important to the repository architecture:

- The user's hoppers are the primary creative input. They may be deliberately messy, associative, voluminous, boundaryless, or only partly sorted. They are not a failed version of the assistant's structured work.
- Assistant-maintained research hoppers contain mined sources, public evidence, source-linked examples, technical references, and idea/experiment proposals. They must not replace or populate the user's own hoppers.
- Structured records can be derived from either lane when useful, but they are aids to retrieval and recombination, not a demand that the original material be normalized.
- The future Workbench / Idea Bench is being designed in a separate thread. This intake does not define, implement, or redesign it.

The hoppers are intentionally **not interchangeable dumping grounds**. A clean research record and an unruly creative dump can both be valuable, but they serve different jobs.

## Source inventory and routing

Git blob SHA-1 values below identify the exact uploaded JSON bytes as received. Original conversation exports remain in the conversation / private source context; this public repository contains this metadata register and concise derived summaries only.

### A. Music, Suno, genre, and composition sources

#### 1. Suno Prompt Creation
- **Uploaded file:** `ND Suno Prompt Creation - raw.json`
- **Conversation ID:** `6aab5998-9d98-83e9-b9c8-83096e998bcb`
- **Dates:** 2026-09-17; updated 2026-09-17
- **User messages:** 6
- **Git blob SHA-1:** `afabb840864c8fd105d6dce4cdf4dbde8003fc91`
- **Main object:** turn a musical “take-apart” into a Suno prompt without using the reference artist or work name, with the Lyrics field carrying structure.
- **Prompt design features:** separate Style and Negative fields (each under 1,000 characters in the requested interface) and a Lyrics/structure field under 5,000 characters; the example is a long-form, instrumental tar-shehnai composition with a strict one-instrument identity and an extended sectional trajectory.
- **Useful detail:** the assistant reported 826 characters for Style, 895 for Negative, and 3,956 for Lyrics/structure. Treat those counts as properties of the produced draft, not universal platform rules.
- **Routing:** user-originated prompt/case material belongs with the existing `Prompt_Hopper` and `Structure_Hopper` lineage. Any external instrument facts belong in `Research_Hopper` / `Source_Hopper`, with claims checked against the cited tar-shehnai references. No raw prompt is copied here.
- **Evidence limit:** the conversation documents a prompt construction, not a verified audio result. No audio output is included in this upload.

#### 2. Vocaloid Track Analysis
- **Uploaded file:** `ND Vocaloid Track Analysis - raw.json`
- **Conversation ID:** `6ac34372-fa74-83e9-91ff-d211b4a1ee20`
- **Dates:** 2026-10-05; updated 2026-10-05
- **User messages:** 3
- **Git blob SHA-1:** `3d364a7e9a4fc089866fd1a5a2100a497e7fa96d`
- **Main object:** identify a stripped-down track that represents the essence of early Vocaloid / Japanese internet music culture, then describe its production in unusually fine detail from a producer's-eye perspective.
- **Conversation's selected track:** livetune feat. Hatsune Miku, “Packaged.”
- **Analytical themes:** the voicebank and sequencer as compositional media; repetition and memorable melodic contour; four-on-the-floor pulse; synth timbre and register; arrangement economy; the relationship between an individual producer, a synthetic singer, software, an uploaded track, and a distributed audience.
- **Useful source trail:** the export contains Japanese producer interviews and music-reference links, including interviews concerning kz/livetune and production vocabulary. Preserve the native Japanese vocabulary and inspect the linked primary sources before turning the assistant's interpretation into a factual production note.
- **Routing:** `Research_Hopper` for the producer interviews and source claims; `Structure_Hopper` for arrangement/form observations; `SUNO_WORKDESKS/11_VOCALICS.md` for the voicebank / vocal-production questions. The assistant's evocative cultural reading is analysis, not a verified historical explanation.
- **Evidence limit:** the conversation analyzes a chosen track and public interviews; it does not provide a controlled Suno generation comparison.

#### 3. Write Suno Prompts
- **Uploaded file:** `ND Write Suno Prompts - raw.json`
- **Conversation ID:** `6ac36eca-e2b0-83ea-9e3c-cac83ef82fd3`
- **Dates:** 2026-10-05; updated 2026-10-05
- **User messages:** 28
- **Git blob SHA-1:** `cabde2b08d30a251f0f807863f782034ee9844be`
- **Main object:** develop a sequence of unusual musical structures / “nano-genres” and write genre-level Suno definitions for them.
- **User's explicit constraints:** encyclopedic sincerity; define the sound from the imagined performers' and milieu's point of view; don't explain through modern adjacent genres; use native or historically adjacent language where feasible; use densely meaningful sound-bearing terminology; describe a range of possible songs rather than prescribing a single arrangement unless a convention is intrinsic; be precise without being exclusive; avoid over-obvious or culturally deterministic sonic gimmicks.
- **Material types:** a mixture of documented traditions, speculative reconstructions, deliberately invented genres, and openly absurd concepts. Those categories must remain distinguishable. A plausible-sounding description is not evidence that the tradition existed.
- **Later prompt direction:** create spoken, field-recording-like material with multiple sessions, interruptions, garbling, cutoffs, and human anecdotes, without making the recording itself the subject except for technician notes.
- **Routing:** user-owned genre/prompt ideas belong in the existing `Genre_Hopper`, `Prompt_Hopper`, and possibly `Lyrics_Hopper` after separate authorship / rights review. The assistant should mine sources and native terminology into the separate `Research_Hopper` / `Source_Hopper` lane. Do not paste the entire conversation into public hoppers.

#### 4. Predict the Song Style — extended export
- **Uploaded file:** `ND Predict the Song Style - raw.json`
- **Conversation ID:** `6ad0cf68-eebc-83ea-9da8-4aa0b56bad53`
- **Dates:** 2026-10-15; updated 2026-11-02
- **User-authored messages:** 612 (3,233 message-bearing mapping entries across all roles / tool records)
- **Git blob SHA-1:** `4cd9a30c14b5eb206e6fd36c9a94e0ff43026ba5`
- **Relationship to earlier intake:** this is the larger raw export of the same conversation already represented in HsH's `Predict the Song Style.txt` and in KMcKM's `corpus/Grab_Bag/Predict the Song Style — raw__chunk_0001_of_0003.txt`. Treat the current raw upload as the newer / fuller source snapshot, not a second independent conversation. The previously recorded 527-message description refers to the earlier derivative and should not be used as the count for this raw export.
- **Main content:** extensive iterative prompt and output exploration: per-word / per-morpheme rhyme; syllable replacement by closest English-sounding syllables; malformed, pseudo-language and multilingual lyric material; unusual cross-regional genre combinations; user-reported descriptions of generated results; genre-structure taxonomy; gathering native terminology and musicological descriptors; and plans for Suno prompt, musical structure, instrument and Sonic Pi tooling.
- **User's important later direction:** identify musical forms that depart from conventional Western song structure without making microtonality the primary criterion; group forms by structural contrast; build terminology sets from native and musicological terms; retain user lyric and sound experiments as source material.
- **Routing:** leave the existing user material in `Grab_Bag`, `Prompt_Hopper`, `Genre_Hopper`, and `Lyrics_Hopper). Use the newer export to mine and cross-reference, not to create duplicate hopper files. Separate creator-reported audio impressions from direct audio evidence and assistant interpretation.

#### 5. Suno prompt writing — exact duplicate exports
- **Uploaded files:** `ND Suno prompt writing - raw.json` and `ND Suno prompt writing - raw (1).json`
- **Conversation ID:** `6ad0c7e7-ed44-83ea-a768-f35daab5f114`
- **Date:** 2026-10-15
- **User messages:** 1 per export
- **Git blob SHA-1 for both:** `976e7139f04d7e2fde2330b42f609576b7e1b72f`
- **Main object:** reverse-describe a named reference song ("The Boxer") without using the song or artist name or lyrics.
- **Routing / status:** exact byte-identical duplicates of each other and of the HsH source already recorded in the first HsH intake. No new content import required. Keep the existing source pointer in `HSH_MUSIC_SOURCE_MAP_2026-11-10.md`.

#### 6. Song Structure Arrangement
- **Uploaded file:** `ND Song Structure Arrangement - raw.json`
- **Conversation ID:** `6ac7d85d-008c-83ea-a921-d4bdc1977344`
- **Dates:** 2026-10-08; updated 2026-11-02
- **User messages:** 23
- **Git blob SHA-1:** `c3c1ae5c4a04d46e83cf6482f4854baf6692aaca`
- **Music-relevant content:** arrange an existing long text into a song-like structure without adding or editing its words; generate sonic structure from existing material; establish a world through placement and relationships rather than explanatory additions; and turn a supplied songwriting checklist into an algorithmic process.
- **Songwriting framework in the conversation:** beat; hook; topic; subtopic; simplify the subtopic into a title; develop verse details using who/what/when/where/why/how; then lyrics and arrangement. It records proposed verse, chorus, pre-/post-chorus, bridge, intro/outro lengths and functions, as well as question/answer phrases, motifs, steps/skips, static motion, and thirds.
- **Cross-project branch:** the later Plotto discussion and interactive story-plotter idea belong to the separate Storyo / narrative-tool project, not KMcKM's music corpus.
- **Existing overlap:** KMcKM already has `2Song Structure Arrangement — raw.txt` in both `Structure_Hopper` and `Lyrics_Hopper` with the same stored file SHA (`e889f5751c4bc3fc65d3d93f6d8394404a1429fc`). Do not add another copy. This register records the newer raw JSON export and clarifies which part is music-relevant.

#### 7. Weird Writers Group Rejection
- **Uploaded file:** `ND Weird Writers Group Rejection - raw.json`
- **Conversation ID:** `6ab6db73-360c-83ea-b00d-5d809de1fdb4`
- **Dates:** 2026-09-25; updated 2026-10-19
- **User messages:** 4
- **Git blob SHA-1:** `650555b5a2e64f4e393e12f8ca9f66d3b1769dde`
- **Main object:** a conversation about being rejected from a writers' group, followed by a request to compile the VeveleveV material.
- **Why it matters to music work:** VeveleveV is a source of deliberately alien character voice, category errors, phonetic / semantic instability, and raw lyrical material. The source itself is creative writing, not evidence about Suno.
- **Routing:** private / user-originated writing and lyric material; future mining belongs with `Writing_Voice` and `Lyrics_Hopper`. Keep the raw text and assistant compilation out of the public corpus unless separately approved.

#### 8. Predict Suno's Sound
- **Uploaded file:** `ND Predict Suno’s Sound - raw.json`
- **Conversation ID:** `6af292d0-5030-83e9-802c-a0e891c91974`
- **Dates:** 2026-11-10; updated 2026-11-10
- **User messages:** 23
- **Git blob SHA-1:** `8bdf6764f2e194f1b7fdc5de73b559af585c193c`
- **Central research question:** how does Suno's interpretation of a musical prompt differ from an LLM's interpretation? The user explicitly suspects the systems are solving different problems and asks how to reason about Suno without pretending to know its private architecture.
- **Conversation arc:** deliberately compound / invented style strings and lyrics; user-reported generation outcomes; a request to learn about audio models generally; a request to inspect community reports; and instructions to build a research library / scraper and additional hoppers.
- **Most important workflow instruction:** the user's hoppers are the bulk creative input; assistant-created hoppers should supply mined sources, templates, experiment ideas, structure mines, and small flavor drop-ins. Do not create competing copies of the user's hoppers or privilege tidy assistant-mined material over the user's unstructured input. The actual Workbench / Idea Bench is being built in a separate thread.
- **Existing work already present:** the conversation's earlier assistant-mined outputs are represented in `EXTERNAL_MINING/` (including complex-systems, information-theory, symbolic / phonetic grammar, temporal-control, and v6 workflow records and idea mines). Do not recreate those records merely because the raw conversation was supplied again.
- **Routing:** user's creative examples remain with `Prompt_Hopper`, `Grab_Bag`, `Genre_Hopper`, and the other user-originated collections. Public technical research belongs in `Research_Hopper`, `Community_Hopper`, `Tooling_Hopper`, `Source_Hopper`, or `EXTERNAL_MINING` as appropriate. Keep user observations, external research, and our hypotheses separately labeled.

### B. Adjacent LLM / HsH references not imported into KMcKM

#### 9. Discussing The Gauge
- **Uploaded file:** `ND Discussing The Gauge - raw.json`
- **Conversation ID:** `6ab9b0aa-4c70-83ea-bec1-3b5fd2fba00f`
- **Dates:** 2026-09-28; updated 2026-10-02
- **User messages:** 2
- **Git blob SHA-1:** `629e301712bced369528e4b6727df1f97c02ea6e`
- **Main object:** a specially constrained conversational role with a deferred “gauge” metaphor and a tightly specified criterion for a large structural shift.
- **Disposition:** not a Suno experiment and not transferred into the music prompt system. It may be useful as an example of role / attention management in a general LLM methods collection, but keep it separate from music evidence.

#### 10. KAR-HNN Translation
- **Uploaded file:** `ND KAR-HNN Translation - raw.json`
- **Conversation ID:** `6a2b1335-8224-83ea-94eb-26ba71d701ae`
- **Dates:** 2026-06-11; updated 2026-10-06
- **User messages:** 21
- **Git blob SHA-1:** `d10093449751f0c6e38b2a867d7627018a646e43`
- **Disposition:** HsH / physics and LLM-workflow material, including H(s)H playground instructions and theory development. Not a KMcKM music source. Preserve in its original project context.

#### 11. Electron Paths in Chips
- **Uploaded file:** `ND Electron Paths in Chips - raw.json`
- **Conversation ID:** `69ad7a19-9edc-8331-8d9d-d781b8d1a277`
- **Dates:** 2026-03-08; updated 2026-10-06
- **User messages:** 49
- **Git blob SHA-1:** `44d2b7a84051525000e6a2d787b6b753ff37d032`
- **Disposition:** HsH / physics, geometric-path and epistemology material. Not a KMcKM music source. Preserve in its original project context.

## Existing KMcKM material checked for overlap

This intake intentionally avoids duplicating creator-originated sources that are already in the appropriate hoppers:

- `corpus/Prompt_Hopper` already contains the user's prompt drafts, Goodsong experiments, Suno intake material, and other creative prompt history.
- `corpus/Grab_Bag` already contains the chunked `Predict the Song Style` material, Suno library snapshots, `Suno Best`, genre collections, and mixed creative references.
- `corpus/Genre_Hopper` already serves as the user's low-friction, unsorted genre / tradition / terminology holding area.
- `corpus/Structure_Hopper` and `corpus/Lyrics_Hopper` already contain the Song Structure Arrangement text derivative.
- `EXTERNAL_MINING/` already contains assistant-mined outputs that appear within the Predict Suno's Sound conversation. Those stay distinct from user-created materials.
- `corpus/Research_Hopper`, `Community_Hopper`, and `Tooling_Hopper` remain assistant-maintained external research / public report / tool lanes.

## Evidence and reuse rules

1. A ChatGPT conversation is evidence of what was asked, proposed, or reported in that conversation. It is not automatically evidence that a generated audio result behaved as described.
2. Preserve the distinction between user-authored prompts, assistant-generated prompt drafts, external sources, user-reported listening observations, actual audio, measured features, and our later interpretation.
3. Preserve the explicit separation between real traditions, speculative reconstructions, and invented genres.
4. Do not publish raw conversation exports, private writing, full lyrics, account material, or third-party text from these sources by default.
5. Do not infer Suno's internal architecture from a prompt/output anecdote. Treat internal-mechanism language as a hypothesis unless independently supported.
6. No audio files were included in this 12-file upload. Reported sound descriptions remain user/assistant text, not independently listened-to evidence.

## Next work queue

1. Use the Tar Shehnai conversation as a field-separation / structural-prompt case only after locating any associated audio result.
2. Extract the 25-genre prompt-development sequence into a private working taxonomy, keeping invented, speculative, and documented traditions separate and traceable.
3. Continue the Vocaloid “Packaged” source review using the linked producer interviews and a source-linked track-analysis note.
4. Use the Song Structure Arrangement material already in the hoppers; do not duplicate it. Keep the Plotto / Storyo branch separate.
5. Treat the November 2 Predict the Song Style export as the richer source snapshot for further mining; reconcile its full branch structure with the earlier HsH text derivative.
6. Continue Predict Suno's Sound with separate user-originated experimental material and assistant-mined technical / community references. Do not let the research hoppers substitute for the planned Workbench.
7. Leave Gauge, KAR-HNN, and Electron Paths outside KMcKM unless a later music-specific question creates a clear, bounded reason to cross-reference them.