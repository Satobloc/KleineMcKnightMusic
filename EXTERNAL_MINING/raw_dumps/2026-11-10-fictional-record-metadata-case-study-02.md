# Fictional Record Metadata — Source Case Study, Pass 02

**Mining date:** 2026-11-10  
**Parent source:** `Predict the Song Style`, conversation `6ad0cf68-eebc-83ea-9da8-4aa0b56bad53`  
**Source export:** `ND Predict the Song Style - raw.json` (Git blob SHA-1 `4cd9a30c14b5eb206e6fd36c9a94e0ff43026ba5`)  
**Scope:** user-message ordinals U45–U94, with U95–U103 noted as the next boundary case.  
**Status:** source lineage reconstructed; audio not yet recovered/listened to in this workspace.

## 1. What the user was varying

The central method in this section is a deliberately sparse Styles-field prompt that presents a supposed recording as a title plus artist credit, often with invented names. The input is not semantically empty. It contains different kinds of potential cues:

- recognizable words with cultural or genre associations;
- invented but pronounceable names;
- phonetic approximations of real artists or language;
- explicit historical / specialist vocabulary;
- fictional instrument credits;
- ordinary versus unusual social identities implied by an artist name.

The method therefore tests **style inference from compact metadata**, not “random nonsense” in a strict sense. Each example is an individual exploratory generation, not a controlled trial. Version, settings, generation IDs, and exact prompt histories are mostly absent from the export.

## 2. Prompt-to-outcome lineage

### Case A — “Sky Clad” by Boudleaux Bryant (U45–48; plus alternate noted U52)

**Input:** Styles field only: `"Sky Clad" by Boudleaux Bryant`.

**User observations:**
- The first result was described as real-roots country, with a female singer in a Dolly-like style (U46).
- The user clarified that “Sky Clad” was a reference to monks (U47).
- The user called it the best straight-up folksy song they had generated so far, and was unsure whether the lyrics were real words (U48).
- The attached `Sky Clad.mp3` is 1,545,756 bytes, MP3, declared duration 106.0135 seconds. The JSON contains a sediment pointer and a Library attachment ID, but the audio bytes are not available as a separate mounted file in this analysis workspace.
- An alternate version was later described by the user as sounding “like it was made on a casio” (U52). No second audio attachment is present in that message.

**What it supports:** a very sparse title/credit prompt was followed by a user-reported roots-country result and a strong vocal impression. The lyric-language uncertainty is an explicit listening question, not an established finding.

**Unresolved:** whether “Boudleaux Bryant” or “Sky Clad” carried the strongest cue; whether the vocal resemblance is stable across outputs; whether the lyrics are lexical English, pseudo-lyrics, or mixed.

### Case B — “Scuttlebut” by Neap Tidy and the Jersey Stadt Destroyas (U49–53)

**Input:** title plus a deliberately comic / invented artist name.

**User observations:**
- First version: funk, a “Thoroughgoodian” beat, harmonica, and a small stomp-like breakdown (U50–52).
- The alternate: guitar twang and piano at the opening, then a hit-bass thump and a strongly grooving feel, also described as “Thoroughgood” (U53).
- The user noted the contrast with the Casio-like alternate of *Sky Clad*.

**What it supports:** the same nominal record credit yielded two related but distinct arrangements, both of which the user associated with a blues-rock / funk-inflected guitar identity.

**Unresolved:** no audio file, exact Suno description, model version, or generation settings were supplied here. “Thoroughgoodian” is the user's stylistic shorthand and should not be normalized into a more specific genre without hearing the audio.

### Case C — “Tass Bracks” / “Ledbelly’s Grave” (U54–56)

**Inputs:** first `"Tass Bracks" by Needlenose MacKinzie and his Crowleyboy Whizzbangz`; then `"Ledbelly's Grave" by Her Royal Majesty Queen K'mokimokauea`.

**User observation:** “Hmmm. We got honkytonk, and we got some nice old blues” (U56).

**Attribution caveat:** the conversation moves from the first title to the second before the reported result. The most natural reading is that the honky-tonk / old-blues observation follows *Ledbelly's Grave*, but the source does not explicitly identify which version or prompt produced which style. Do not assign separate outputs to the two inputs without further evidence.

### Case D — “Doilies in March” by Puffin Kennedy [feat. Maxxo] (U57–61)

**Input:** title and artist/feature credit.

**User observations:**
- The result was described as a groovy, old dancehall-dub instrumental (U58).
- The user remarked that the credit sounded like an almost typical American-ish name plus a generic-sounding feature name (U59).
- Both versions had the same slow-ska beat and watery synth; the user also noticed organs (U60–61).

**What it supports:** the user perceived a shared slow-ska / dub-adjacent identity across two versions, with related synth and organ color.

**Unresolved:** whether the two versions share more than groove and timbre; no audio attached in this message sequence.

### Case E — “Wonjrepp” by Tsoolgem Pakmostklitsi (U62–65)

**Input:** deliberately unfamiliar title and artist-like name.

**User-supplied generated descriptions:**
- V1: instrumental, unhurried / loosely shifting pulse, sparse unidentified tones and textures over an indistinct rhythmic bed, veiled / unstable recording texture.
- V2: unclassifiable instrumental, unsettled groove with shifting pulse, ambiguous recording texture, indistinct layers, no fixed tonal center.

**User listening observations:**
- Overall impression: minor-key spa music, very soft (U63).
- V2: soft synth-piano / tongue-drum tones; V1 opened with “pieu”-like sounds and became meditative (U64).
- V2 acquired a persistent “ta-ta-ta-ta-ta” drum figure about two-thirds through, which came and went (U65).

**What it supports:** the two textual descriptions emphasize diffuse, uncertain, non-genre-specific qualities; the user's listening report adds a softer, meditative identity and a late-arriving rhythmic motif in V2.

**Unresolved:** “pieu” is retained as the user's phonetic listening description, not interpreted as an instrument. The descriptions are not a substitute for audio inspection.

### Case F — “The Vombo Meal” by Toplame Orklyx M'Bombsa and Seeloy Hoimack (U66–68)

**Input:** title and two invented artist names.

**User-supplied generated descriptions:**
- V1: instrumental post-genre rock, crunchy rhythm guitar, sharp cowbell accents, loping half-time groove, bright compressed guitars, tight punchy mix.
- V2: instrumental post-genre groove, syncopated kit, interlocking shakers, layered wordless vocal refrains, buoyant midtempo syncopation.

**User listening observation:** V1 sounded like modern Southern-rock/country instrumental; V2 sounded like spa music / adult-contemporary groove (U68).

**Critical correction to the previous assistant analysis:** an earlier assistant inferred that the two versions shared a relatively stable musical family because their descriptions both emphasized groove and accessible rhythmic character. The user's direct listening report contradicts that broad inference: the two versions had substantially different musical personalities. This is a clear example of why textual descriptions must not be treated as interchangeable with listening evidence.

**Unresolved:** any suggestion that “Vombo” evokes *bombo* or caused the percussion is an assistant-generated speculation, not source-supported evidence.

### Case G — heraldic blazon credited to Snoop Fluid Wanxton of De-la-Croix, Wisconsin (U69–73)

**Input:** a long, technically dense heraldic blazon used as the song title, credited to `Snoop Fluid Wanxton of De-la-Croix Wisconsin`.

**Assistant prediction audit:** the assistant initially predicted smooth jazz-funk / old-school hip-hop, partly from the “Snoop” cue. The user’s “You got it” was ambiguous. The user then clarified: “No, I mean you got Churchill. Here's the songs” (U71). The assistant had recognized the blazon's heraldic source, not correctly predicted the musical output. The earlier assistant subsequently misread this as a G-funk success. That was wrong.

**User-supplied generated descriptions:**
- V1: instrumental heraldic ceremonial march, dry close-miked brass and frame drums, tape saturation, measured processional tempo, low brass fanfares, snare rolls, hammered dulcimer accents.
- V2: instrumental heraldic ceremonial march, dry close-miked studio recording, tape saturation, sharply separated layers, steady processional pace, brass fanfare, field snare, low drum, bright cymbal accents.

**User listening observation:** V1 was roughly “Pennsic Wars 1983”; V2 was more conventional / less favorably received (U72–73).

**What it supports:** the highly specific heraldic text coincided with two similarly described ceremonial-march outputs. The user’s clarification makes the assistant's G-funk prediction a documented false positive, not a partial hit.

**Unresolved:** which aspect of the blazon influenced the result, and whether the march was generated because of the title content, broader prompt context, or some unrecorded setting.

### Case H — “Zip Calliopee x2” by Quandolicious Lalabolocaramalanyang, featuring Doug Crabs and Buster Wrockler (U74–77)

**Input:** title and an elaborate fictional credit explicitly assigning Doug Crabs to glass harmonica and Buster Wrockler to “poontang”.

**User-supplied generated descriptions:**
- V1: eccentric chamber cabaret instrumental, unhurried sway, glass harmonica above playful poontang figures and winding bass clarinet, short plate reverb.
- V2: eccentric chamber novelty, lilting waltz, glass harmonica and poontang trading phrases, brush snare and celesta accents.

**User observations:**
- The user listened for the supposed “poontang figures” but did not identify a confirmed sound source (U75).
- V2 had a “Paul & Adkins” flavor, which the user corrected to “Chet & Les” (U76–77), i.e. a Chet Atkins / Les Paul-style instrumental interplay.

**What it supports:** the supplied descriptions echo the fictional instrument credit and frame the two instruments as exchanging phrases. The user's actual listening association concerns the conversational / traded-phrase quality of V2.

**Evidence boundary:** no proof that Suno created a stable, distinct timbre for “poontang”. The descriptions may simply be reflecting the supplied credit. Do not record the fictional instrument as an acoustically realized instrument without listening and repeated tests.

### Case I — “Whaffin” by Spoiler Crackman + Poiz (U78–79)

**Input:** compact title and two-person credit joined with a plus sign.

**User-supplied generated descriptions:**
- V1: instrumental reggae dub, rub-a-dub bass guitar, wandering melodica, slow half-time pulse, heavy low end, spacious tape-delay echoes.
- V2: instrumental reggae, deep dub echo throws, lurching one-drop sway, skanking guitar, sharp brass stabs.

**User observation:** the user said the system had “invented a genre I thought I'd coined back in the 90s” (U79).

**What it supports:** the two descriptions are related by reggae/dub vocabulary but emphasize different arrangements: spacious melodica-led dub versus a fuller one-drop ensemble.

**Unresolved:** the exact genre term the user had in mind. The previous assistant identified “rub-a-dub” as an established reggae term, but that historical assertion has not been independently verified in this mining pass. Do not overwrite the user's intended meaning with the assistant's guess.

### Case J — “Shit Take Number 664” / “Soldered Regret” (U80–82)

**Input sequence:** `"Shit take number 664" by My Buddy Dave`, followed by the user's comment “Oh, it didn't like my title lol” and a replacement `"Soldered Regret"` with two style descriptions.

**Replacement descriptions:**
- Rough-edged comedic rock, feedback guitar leads, chunky electric rhythm guitar, instrumental, compressed bass grit, dry scrappy mix, loose midtempo backbeat.
- Comedy rock, tight kick/snare, brisk straight-ahead groove, picked electric bass, scrappy guitar accents, casual irreverent instrumental phrasing.

**User listening observation:** “It's just ordinary hard blues rock” (U82).

**Evidence boundary:** “didn't like my title” does not tell us whether the original title was blocked by moderation, rejected by a generation workflow, or simply disliked by the user. Do not infer a moderation classifier trigger from this one remark.

### Case K — French-looking / artist-identity sequence (U83–94)

This is a particularly valuable **incremental cue-strengthening** sequence.

**K1.** `"Q'est le Moin l'Entfinte" by Joilse Imlbleu` (U83).

- User's intended target: Carla Bruni.
- Output descriptions: one instrumental folk-club arrangement with concertina and a lilting acoustic accompaniment; another instrumental acoustic-folk arrangement with steel-string guitar and natural room ambience (U84).
- User: “It's pretty enough” (U84).
- The assistant had predicted French chanson/musette from the French-looking orthography, but the user reports that the intended Carla Bruni vocal identity did not appear.

**K2.** `"Quail'en med m’a Zaz" by Gilberta Tedeschi` (U85).

- The user confirms that the assistant picked up on “Zaz” (U86).
- The assistant interprets “Gilberta Tedeschi” as a disguised reference to Carla Bruni's full birth name and “Zaz” as a direct reference to the French singer Zaz. This decoding is assistant analysis, but the user's confirmation specifically supports the intentional Zaz cue.
- Two descriptions: French chanson / musette with accordion and understated acoustic accompaniment; then instrumental French chanson with gypsy-jazz guitar, warm acoustic bass, and light brushed percussion (U87).
- The user says the result was pleasant but not ideal “quailing music” (U89). The user does not report a vocalist in these instrumental descriptions.

**K3.** Same disguised credit plus explicit vocal direction and the title `"Douce doleur"` (U87–94).

The user added: `Sweet pain vocals en Francais, pure intimacy, breathy, raspy at the hard parts`.

Two generated descriptions:
- Intimate French chanson, breathy vocal turning raspy at the peaks, close-miked / soft production, brush-played jazz drums, understated piano, warm bass, unhurried sway.
- Intimate French chanson, breathy close-miked vocals turning raspy at harder phrases, dry hushed production, muted trumpet answering soft piano and fingerpicked guitar.

The conversation then includes auto-generated French lyrics (U88; not reproduced here). User feedback:
- Strong positive response to the voice (U90).
- Described it as a smoky Carla / Zaz timbre (U91–93).
- Noted a higher-pitched crescendo (U94).

**What this sequence supports:** the user's reports distinguish three stages:
1. French-looking orthography + disguised name, but instrumental folk;
2. clearer musical/biographical references, instrumental chanson/musette;
3. explicit vocal-performance instructions, with a user-reported compelling female vocal character.

This is the strongest within-conversation contrast in the section, but it is still not a controlled experiment: title, credit, lyric content, and vocal instructions change together. The defensible finding is that the explicit vocal instruction coincided with the appearance of the desired vocal identity. We cannot claim it alone caused the change.

## 3. Pattern map: hypotheses worth testing

| Candidate variable | Source-grounded clue | Test that would isolate it |
|---|---|---|
| Title semantics | Heraldic blazon coincides with ceremonial-march descriptions | Same artist credit, compare semantically rich blazon title with neutral title |
| Artist-name phonetics | Invented names accompany diverse outcomes; no stable direction yet | Same title and settings, vary only artist-name phonetic profile |
| Real-artist phonetic / biographical hints | “Zaz” recognized by user and assistant; “Gilberta Tedeschi” intended as biographical cue | Compare Zaz cue alone, Bruni biographical cue alone, both, and neither |
| Language-like orthography | French-looking title produces folk/chanson-adjacent descriptions | Matched pseudo-French vs ordinary English vs actual French wording |
| Explicit vocal constraints | Vocal directions coincide with desired vocal character after instrumental outputs | Hold title, credit, lyrics, and style constant; add/remove only vocal direction |
| Instrument credits | Generated descriptions repeat glass harmonica / “poontang” labels | Keep title fixed; remove fictional instrument credit and compare actual audible timbre |
| Version divergence | Same prompt may yield country vs spa, or two related dub variants | Generate multiple outputs under fixed prompt/settings and rate them independently |
| Generated descriptions vs listening | Vombo descriptions suggest related groove but user hears Southern rock vs adult contemporary | Blind audio rating against descriptions; separately code description similarity and audio similarity |

## 4. Methodological corrections to carry forward

1. **Do not confuse recognition of a reference with prediction of the sound.** The Churchill case is the clearest correction: the assistant recognized the heraldic source and mistakenly claimed the user confirmed its G-funk prediction.
2. **Do not let generated descriptions stand in for listening.** The Vombo Meal case directly demonstrates the risk.
3. **Treat each version as a separate observation.** “Same prompt” does not imply same musical result.
4. **Do not infer causality from one prompt change when several fields changed.** The French chanson sequence is suggestive but not controlled.
5. **Do not infer internal Suno mechanisms from word associations.** “Vombo” → “bombo”, “Snoop” → G-funk, and similar token-level explanations remain hypotheses unless isolated experimentally.
6. **Preserve user shorthand exactly.** “Thoroughgoodian”, “Pennsic Wars 1983”, “spa music”, “Chet & Les”, and “quailing music” are useful listening descriptors. Do not flatten them into generic genre tags.
7. **Treat the absence of a reported result as missing data.** The *Tass Bracks* outcome is not separately established; the title rejection in U81 does not prove moderation.

## 5. Audio and source-recovery status

- The source export contains an attachment record for `Sky Clad.mp3` (U48), 106.0135 seconds. It has a Library attachment identifier in the JSON metadata, but the audio is not independently retrievable through the current mounted-file interface used for this pass.
- No separate audio attachment is recorded in U45–94 for the other examples above.
- The later U103 attachment is `Birch Park Dr 9.mp3`; it belongs to the next source-reference case and should be examined separately rather than assumed to be one of the fictional-record outputs.
- The larger export includes additional audio pointers outside this section. They remain queued for recovery and listening.

## 6. Next steps

1. Recover or request the separate `Sky Clad.mp3` and any other source audio files so the user reports can be checked against actual recordings.
2. Build a small controlled matrix around the French sequence: French-looking title only; Zaz cue only; Bruni biographical cue only; both references; explicit vocal direction added as the sole change.
3. Build a second matrix around title semantics: neutral title, invented title, and semantically rich blazon, keeping the artist credit fixed.
4. Continue the source lineage into U95–103, especially the `Der Bua` reference-audio case. The user supplied a `Birch Park Dr 9.mp3` attachment at U103 after saying they would provide an audio file for analysis.
5. Only after listening, create audio-grounded behavior records or update the model-behavior registry. This case study belongs in the evidence quarry, not as a generalized Suno rule.

## 7. Provenance and evidence labels

- **Direct input:** exact user-supplied title / credit or instruction, summarized without reproducing full third-party lyrics.
- **User listening report:** first-person description of the generated audio.
- **User-supplied generated description:** a description pasted by the user, retained as textual output evidence but not assumed to be a faithful acoustic measurement.
- **Assistant interpretation/prediction:** model-generated reading; not evidence of Suno behavior.
- **Mining inference:** a candidate relationship to test.
- **Unresolved:** missing prompt settings, output identity, audio, or attribution.
