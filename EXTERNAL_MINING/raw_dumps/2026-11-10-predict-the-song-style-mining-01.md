# Predict the Song Style — Mining Pass 01

**Mining date:** 2026-11-10  
**Source conversation:** `6ad0cf68-eebc-83ea-9da8-4aa0b56bad53`  
**Source title:** Predict the Song Style  
**Source snapshot:** user-uploaded `ND Predict the Song Style - raw.json`  
**Uploaded JSON Git blob SHA-1:** `4cd9a30c14b5eb206e6fd36c9a94e0ff43026ba5`  
**Conversation dates:** 2026-10-15 through 2026-11-02  
**Scale:** 612 user-authored messages; 3,233 message-bearing mapping entries (3,234 mapping nodes including the empty root).  
**Purpose:** first substantive extraction from the fuller export. This is a source-derived map and synthesis, not a raw transcript mirror and not a claim that all experiments have been reconstructed.

## 1. Important correction: the export references audio

The earlier intake note said no audio was included. That was too broad. The JSON contains **19 user audio-asset pointers**: 5 MP3 and 14 M4A references, totaling about 66.6 MB and approximately 39.5 minutes of declared duration. They occur in user messages 48, 103, 255, 264 (five clips), 272 (two clips), and 422 (nine clips). The export also contains five user image pointers and 50 tool-returned image pointers.

The audio bytes are not embedded in the JSON; these are `sediment://` references. They are not present as separate mounted files in the current working directory, so I have not listened to them or measured them. This distinction matters: the conversation contains actual audio references, but the present analysis can only use the textual listening reports and asset metadata. Recovering the referenced audio is now a priority before any acoustic claim is upgraded.

## 2. High-level map of the conversation

The 612 user messages are not 612 independent experiments. The conversation is a long exploratory session with repeated prompt revisions, response iterations, side conversations, and several distinct research streams. The following are the main music-relevant clusters, indexed by user-message ordinal in the chronological export.

| Cluster | User-message range(s) | Main activity | Evidence currently available |
|---|---:|---|---|
| Early prediction / lyric-text experiments | 1–44 | Predicting likely outcomes from dense lyrics and genre instructions; syllable substitution; pseudo-language; phonetic and rhythmic writing; numeric/music-structure notation; timbre-chord concept | Prompts, assistant predictions, and some user listening reports; no acoustic analysis yet |
| Title/artist/name-led style inference | 45–103 | Sparse or invented track/artist labels, genre inference, alternate versions, and comparisons | Several concrete user listening reports; two audio pointers at 48 and 103 |
| Music listening and cultural-reference detours | 104–252 | Broad music discussion, autobiographical anecdotes, performance references | Mostly not Suno experiments; exclude from behavior claims |
| Song/filk construction and mashups | 253–280 | Iterative style prompts, lyric adaptation, reference recognition, recording-era/scene cues, mashups | Prompt revisions, user feedback, three audio pointers at 255, 264 (five), and 272 (two); rights/source review needed |
| Experimental lyric and character material | 281–380 | VeveleveV material, singability, phonetic/orthographic play, and an extended comedic language/character interaction | User-authored creative source; not a controlled Suno test; preserve as a separate creative-language lineage |
| Song revision / style experimentation | 381–411 | Regional folk/electronic combinations, radio-friendly prompt revisions, lyric refinement, and user judgments of results | Several prompt revisions and qualitative listening reports; no direct audio pointer in this interval |
| Psychedelic / historical-style homage | 412–421 | A historical/psychedelic rock reference transformed into a future-facing style prompt; user reports partial success and identifies an earlier Balochi homage | Prompt and listening report; large embedded image/source material in message 419; requires source and rights review |
| Analog-computational musical concept | 425–455 | Invented analog-calibration / mechanical music world, contrast between precision and handmade sound, possible Sonic Pi realization | Creative concept development, not yet a Suno outcome or validated musical system |
| Suno moderation / lexical collision | 457–478 | Repeated prompt revisions after apparent moderation blocks; lexical ambiguity and accidental near-matches considered | User's prompt revisions and one reported successful render; moderation mechanism remains unknown |
| Almote / constructed-language development | 479–594 | Selecting dense non-English-like passages, morphological and part-of-speech analysis, user-led correction, semantic and grammatical formation | Strong direct evidence of a co-creative language-development process; not evidence of an established historical language or of Suno behavior by itself |
| Non-Western and nonstandard musical-structure research | 595–600 | Large genre/tradition list; select forms unlike conventional Western song structures; group by structural contrast; build a sourced terminology corpus and CSV | User's research specification and a large preceding list; source claims and terminology still require verification |
| Toolbox and workflow direction | 607–612 | Music-analysis/generation tooling; Sonic Pi as a template generator for audio inputs to Suno, not the project's primary creative endpoint | Explicit user direction; overlaps with existing KMcKM workshop planning and should be cross-referenced, not duplicated |

## 3. Substantive findings and candidate case records

### A. Phonetic and lexical transformation is not one operation

The early material contains several different transformations that should not be collapsed into a generic “gibberish” category:

1. **Syllable substitution under rhyme constraints** (U2): the user asks to preserve per-word or per-morpheme rhyme while replacing each syllable with the closest English-sounding syllable in a long Gothic-text input. This is a phonetic transformation task, not translation.
2. **Pseudo-language with mixed lexical transparency** (U26–33): the user supplies material where some strings are sound words, some retain semantic content, and some are altered but still structurally meaningful. The user explicitly corrects the assistant: “Squidgy” is a sound word, while the rest carries more meaning; there is “more linguistic structure under the mutation.” That correction should govern any future analysis of this example.
3. **Phonetic erosion / language-loss staging** (U26–29): a structured lyric moves from fast, nearly unintelligible vocal delivery through throat-singing and fragments of recognizable language toward increasingly non-lexical vocal material. The prompt describes a compositional trajectory, but the export does not supply a verified listening report for this exact version.
4. **Compressed and concatenated text** (U30–33): word boundaries and punctuation are deliberately collapsed; cue markers and repeated invented hooks coexist with semantically legible lines. This is a useful contrast against the more explicitly staged bracketed lyric.
5. **Structured numeric motif notation** (U34–35): numeric patterns such as 111, 123 and 321 are used as a compact motif/variation map, alongside explicit musical descriptions (build, drop, anticipation, arpeggiation, simplification, layering, tension). This is a candidate prompt-notation test, not evidence that Suno interpreted the numbers as intended.

**Mining inference:** these examples suggest at least three separable input dimensions worth testing: phonetic resemblance, lexical/semantic recoverability, and visible segmentation. They are not proof that Suno internally processes these as separate channels. Keep the dimensions operational and testable rather than architectural.

### B. Genre density and semantic collision

Several prompts combine many regional traditions, instruments, genres, production cues, vocal traits, and mood descriptors in a single Styles field (notably U6–8, U40, U43–44, U279–280, U381, U384, U387–390). The user reports some unexpectedly light, upbeat, catchy or otherwise surprising results from prompts that appear dark, dense, or contradictory on the page.

A useful candidate question is not “does more genre vocabulary make a better result?” but:

- Which components survive in the audible result?
- Which components dominate, disappear, or appear only as fleeting accents?
- Does the order of descriptors matter?
- Do repeated or contradictory descriptors change the balance?
- Does a long list create a recognizable hybrid, or does it collapse toward a familiar default?
- Does an explicit hook / vocal identity survive the collision?

No general rule can be extracted yet. Most examples are confounded by simultaneous changes to lyrics, Style text, and other instructions.

### C. Sparse title/artist prompts as a style-inference probe

U45 begins with an unusually sparse prompt: a song title and songwriter reference. U48 records the user's positive reaction to a generated result: straight folk, a female vocal with a Dolly-like quality, and uncertainty about whether the lyrics were real words; the alternate version was later described as Casio-like. Other sparse or invented-title examples follow:

- U49–53: an invented act/title sequence; user reports funk, a “Thoroughgoodian” beat, harmonica, a stomp/breakdown, and a more energetic alternate version.
- U54–61: additional invented names; reports include honky-tonk / old blues and a slow-ska / dancehall-dub instrumental with watery synth and organ.
- U62–68: an invented name produces soft minor-key “spa music” / meditative textures in one version; another title produces a modern southern-rock/country instrumental in one version and spa-like adult-contemporary material in another.
- U69–73: a heraldic description is used as source material; two generated descriptions are supplied and the user distinguishes a roughly early-1980s heavy-metal character from a less successful alternative.
- U74–80: an eccentric invented title / performer / instrument credit is paired with chamber-cabaret descriptions; the user hears a contrasting guitar-duo flavor in the alternate.

These are promising examples of **sparse-context style completion** and **name/title association**, but the actual prompt payloads and settings must be reconstructed before comparing them. A fictional artist name may be interpreted through learned name/genre associations, but that is only one possible explanation. Do not infer the mechanism from the outcome.

### D. Filk, source recognition, and performance context

U253–280 explores a song concept through fictional artist names, sparse arrangement descriptions, a live-cassette / filk-scene framing, lyric adaptation, and mashups. The user explicitly evaluates whether Suno recognizes references and whether the output has the intended radio or period character.

This cluster should be handled as a **reference and performance-context** case, separate from the phonetic experiments. Several lyrics and references appear to derive from third-party songs, filk, books, or recordings. Preserve pointers and user-authored commentary; do not copy substantial third-party lyrics into public KMcKM files. The audio references at U255, U264, and U272 should be recovered before any sound comparison.

### E. Prompt revision and apparent moderation blocks

U457–478 documents a sequence of attempts to get a particular song prompt to render. The user reports that Suno changed the prompt to “post-genre art-pop,” then that several revised versions still failed, and later that a version rendered after further changes. The user hypothesizes that short lexical strings or initialisms may collide with words associated with drugs, sex, or other restricted material, including cases where the perceived meaning is not intended.

**Evidence boundary:** this establishes the user's observed sequence of prompt edits and render/block outcomes. It does not establish the moderation classifier's internal rules, the exact triggering token, or whether the system was reacting to the prompt, lyrics, account state, or another factor. This is a candidate matched-prompt experiment: hold the musical content constant and alter only the suspected lexical string, while recording exact UI feedback and version.

### F. Almote: a distinct constructed-language lineage

U479–594 is a sustained language-development thread. The user asks for dense passages without English glossing, explicitly authorizes inferential and cross-lexical comparisons, then corrects the assistant's proposed analyses and develops part-of-speech, morphology, word order, semantic drift, and affix placement. The user states that this is not reconstruction of an established language with a dictionary-correct answer; the participants are helping form the language.

This is valuable for a future vocal/lyric system, but it must be described as **co-created constructed-language development**, not historical linguistics. User corrections and provisional analyses are primary evidence of the emerging grammar. Keep it separate from the general Suno-behavior registry until a specific prompt/audio case links it to generation.

### G. Musical structure beyond conventional Western song form

U595 is an 86 KB genre/tradition catalogue. U596–600 then specify the research task with unusual clarity:

- Select distinctive structures that depart from conventional Western song structure.
- Do not make microtonality the primary selection criterion.
- Narrow to traditions that lean away from structured freeform.
- Group the remaining traditions by structural contrast, including combinations that seem hardest to integrate or imagine together.
- For each pairing, build a terminology corpus, prioritizing native terminology; use musicological terms where tradition-specific terms are limited, and adjacent culture-specific terminology where useful.
- Export a compact CSV with term, source, and a one- or two-word category/basic description.

This is a separate musicology research workstream, not simply a genre-name list. The catalogue and any previous assistant summaries require source checking. Preserve the requested columns and the user's distinction between structural organization and microtonal tuning.

### H. Analog-computational musical world

U425–434 develops an image of precise-but-analog mechanical music: a Curta-style calculating mechanism, calibration, spirographic motion, interlocking drive trains, and musical patterns whose precision is achieved through an asymptotic or iterative process. The user suggests this could be programmed in Sonic Pi, perhaps with additional Ruby tooling.

This is a creative design concept and potential Sonic Pi template project. It is not yet a demonstrated Suno prompt or a validated algorithm. The user's later clarification at U610 remains controlling: Sonic Pi is mainly a template system for generating sound files that can be supplied to Suno; Suno is the primary experimental music-generation target.

## 4. Cross-case patterns worth testing (not conclusions)

1. **Sparse vs dense context:** compare a title/name-only seed with a detailed Style description for the same musical target.
2. **Descriptor order:** reorder an identical set of style descriptors without changing membership.
3. **Descriptor conflict:** compare compatible genre descriptors with deliberately difficult pairings while holding the lyric and structure constant.
4. **Lexical vs phonetic load:** vary semantic transparency while preserving syllable count, stress pattern, and rhyme where feasible.
5. **Segmentation:** compare whitespace/punctuation-preserved text with concatenated text while holding the underlying words constant.
6. **Structural notation:** compare plain-language instructions with the numeric motif notation in U34–35, but only after defining what each numeric pattern is intended to encode.
7. **Version branching:** record each alternate generation as its own output, not as an interchangeable “same prompt” result.
8. **Moderation lexical collision:** isolate suspected strings one at a time; record exact error/block state and all prompt fields.

For all tests, capture model/version, mode, exact Styles/Lyrics/Exclude fields, settings, generation date, output identity, and a short listening report. A result should not enter the behavior registry merely because it is an interesting anecdote.

## 5. Routing and non-duplication decisions

- **Do not copy raw lyrics or full conversation text** into the public repository. This note uses message ordinals and concise summaries.
- **Do not populate or reorganize the user's hoppers.** They remain the primary creative-input lane.
- Keep this record in `EXTERNAL_MINING`, which is the assistant-maintained quarry.
- Cross-reference existing `Prompt_Hopper`, `Genre_Hopper`, `Lyrics_Hopper`, and `Structure_Hopper` material only after checking exact overlap and authorship. Existing material should not be duplicated just to create a new filing.
- Do not recreate the existing symbolic/phonetic-grammar, complex-systems, information-theory, temporal-control, or v6-workflow mining records from 2026-11-10. This note's contribution is the source-grounded map of Nathan's own exploratory conversation and its reported outcomes.
- Do not add anecdotal outcomes to `07_MODEL_BEHAVIOR_REGISTRY.csv` as generalized behavior claims yet. The cases need prompt lineage, version/settings, and recovered audio where available.

## 6. Next work queue

1. **Recover the 19 referenced audio assets** or ask for them as separate uploads if the sediment references cannot be resolved. Prioritize the nine-clip U422 bundle, then the title-led cases U48/U103 and filk cases U255/U264/U272.
2. Reconstruct exact prompt lineage for U45–80 and map each alternate output to the precise title/style input and user listening note.
3. Mine U1–44 in a closer pass, especially the phonetic transformations, timbre-chord proposal, and numeric motif notation.
4. Extract the U595 catalogue's structural candidates and validate the traditions / terminology from primary or specialist sources before making the requested pairing CSV.
5. Treat U479–594 as a separate Almote grammar corpus; preserve the user's corrections and distinguish established conventions from tentative proposals.
6. Cross-reference the user's existing hopper files to identify exact duplicates before any additional routing.

## 7. Evidence labels used here

- **Direct source:** the user's prompt, correction, instruction, or explicit report in the conversation.
- **User listening report:** a first-person description of generated audio, not independently measured here.
- **Assistant prediction/analysis:** model-generated expectation or interpretation; not a Suno result.
- **Mining inference:** a testable question suggested by the source, not a claim about Suno internals.
- **Unresolved:** audio, exact prompt version, settings, or source attribution not yet recovered.
