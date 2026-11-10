# Write Suno Prompts — Source Map and Method Extraction, Pass 06

**Mining date:** 2026-11-10  
**Source conversation:** `Write Suno Prompts`, conversation `6ac36eca-e2b0-83ea-9e3c-cac83ef82fd3`  
**Source dates:** 2026-10-05  
**Scale:** 28 user-authored messages.  
**Status:** prompt methodology, genre worklist progress, and separate spoken-word case mapped; no audio result is established by this export.

## 1. User-authored nano-genre method

The conversation establishes a particularly useful method for inventing or reconstructing Suno genre fields. The user's instructions are more important than the individual genre drafts:

1. Treat each entry as a musical system, not a decorative tag.
2. Let the choices imply the tradition's **stratigraphy**: forebears, adjacent forms, scale, period, and social ecology. Do not announce the lineage in explanatory prose.
3. Write with encyclopedic sincerity and a straight face. Avoid modern genre comparisons unless historically appropriate.
4. Use the performers' plausible lives, expectations, habits, pride, humor, limitations, and social context as part of the reconstruction.
5. Where language is attested, use it; where a reconstruction is necessary, keep its evidential status explicit in working notes. Do not silently present invented lyrics as historical language.
6. In the Suno field, use compact, high-information musical descriptors rather than explanatory English.
7. Aim for under 1,000 characters, ideally with enough headroom for later lyric or structural additions.
8. Describe the range and characteristic tendencies of the genre, not one specific song arrangement unless that arrangement is universal.
9. Be precise without being exclusive; avoid cultural determinism and over-obvious environmental stereotypes.
10. Work from a copyable list and proceed at a manageable pace, two entries at a time.

The assistant independently proposed an internal epistemic distinction that fits these instructions: working notes can label material **attested / inferred / reconstructed / invented**, while the prompt itself can remain in-world and unselfconscious. This is a useful method, not evidence that any given genre entry is historically accurate.

## 2. Canonical 40-item worklist and progress

U5 supplies the canonical numbered list. It supersedes the assistant's earlier draft, which briefly misnumbered / substituted Russian Cosmism Protofilk as item 2 and Outsider Pinball as item 3.

**Drafted in the conversation:** items 1–28.  
**Not yet drafted in the conversation:** items 29–40.

| # | Worklist item | Status in source |
|---:|---|---|
| 1 | Russenorsk Work Music | Drafted; revised after canonical list |
| 2 | Kazakh Yodeling | Drafted; speculative framing acknowledged |
| 3 | Last Doggerland Islanders’ Insular Music | Drafted |
| 4 | Outsider Pinball Arcade Beatboxing | Drafted |
| 5 | Frumist Airplane Cargo Invocation | Drafted |
| 6 | Russian Cosmism Protofilk | Drafted |
| 7 | Picto-Norse Cairn Percussion | Drafted |
| 8 | Head-Shrinking Prayers | Drafted; do not reuse uncritically |
| 9 | Pan-Afroasiatic Sailing Song | Drafted |
| 10 | Imkenrivalitätsschadenparodietanz mit Farsenhupenjauspottlrvokal | Drafted |
| 11 | Lighthouseman’s Masturbation Ditties | Drafted |
| 12 | Rap-Ta-Ta / Eek-and-Response Giggleburst | Drafted |
| 13 | Funeral Polka | Drafted, then revised for grief / lament character |
| 14 | Longtalk / Jovian Pidgin Vocalization | Drafted |
| 15 | Tactile Sonar Verb-Piping | Drafted |
| 16 | Hellfire Pigeon Modulation | Drafted; assistant added “Spark-Gap Telephony Song” to the heading |
| 17 | Voice-Dove Cooing / Church Organ Psalmody | Drafted |
| 18 | Banguingui Sea-Gypsy Chant / Bell Cycle | Drafted; prompt heading softened to “Banguingui maritime chant/bell cycle” |
| 19 | He-dhu´-shka Ritual/Dance Song | Drafted |
| 20 | Non´-zhin-zhon | Drafted |
| 21 | Pawnee Sacred Parable Song | Drafted |
| 22 | Ma-wa´-da-ni / Deathless Voice Song | Drafted |
| 23 | Omaha Funeral Song | Drafted |
| 24 | Mother’s Vow / Thunder Invocation | Drafted; assistant added “Song” and assigned a Dakota framing |
| 25 | Native Flageolet Love-Call | Drafted |
| 26 | North-West Coast Game Song | Drafted |
| 27 | We´-ton Song | Drafted |
| 28 | Mi´-ka-thi | Drafted |
| 29 | Ghost Dance Song | Pending |
| 30 | Calumet / Hako Sacred Peace Choral | Pending |
| 31 | A Cholla mo run | Pending |
| 32 | Sweating-up / Fore-sheet Shanty | Pending |
| 33 | Bunt Shanty | Pending |
| 34 | West Indian House-Moving Land Shanty | Pending |
| 35 | Proportio Sesquialtera Sea Shanty | Pending |
| 36 | Volynka | Pending |
| 37 | Canntaireachd | Pending |
| 38 | Coronach | Pending |
| 39 | Piobaireachd | Pending |
| 40 | Medieval / early-modern / classical structural forms | Pending; umbrella workstream rather than a single genre |

### Character-limit audit

The recovered prompt blocks for items 1–28 are within the intended sub-1,000-character range. For items 3–28, the longest recovered block is 992 characters including the code-block ID marker; the prompt body itself is slightly shorter. Items 1 and 2 are 727 and 653 characters respectively. The character-limit target was therefore largely met in the drafted sequence.

One formatting defect: the item 8 block in the assistant response ends with a malformed closing fence. It should not be copied as-is.

## 3. Epistemic and cultural-sourcing audit

The worklist deliberately mixes very different kinds of material. It must not be treated as a list of 40 established historical genres.

- Some entries are openly counterfactual or invented (for example, Doggerland insular music, airplane-cargo invocation, pinball beatboxing, Jovian pidgin vocalization, tactile sonar verb-piping).
- Some are speculative reconstructions built around real languages, places, or musical ecologies (for example, Russenorsk work music, Kazakh yodeling, Picto-Norse cairn percussion).
- Some use names associated with actual Indigenous, regional, or ceremonial traditions. Their assistant-generated descriptions may contain unsupported or fabricated claims about roles, ritual function, instrumentation, sacred context, or language.
- Some are established musical terms or traditions, but their local form, period, and performance context still need checking (for example, canntaireachd, coronach, piobaireachd, volynka, funeral polka).

**High-priority caution:** item 8, “Head-Shrinking Prayers,” was rendered by the prior assistant as a generic Shuar/Jivaroan ritual chant around tsantsa practices. That is not a verified musical tradition description and risks reducing a living Indigenous people to a sensationalized anthropological trope. Do not reuse the prior prompt. If the topic is retained at all, it requires specialist/community-grounded research and a respectful reframing.

Items 19–30 also include Indigenous / sacred / ceremonial references. The prior assistant's specific attributions (Omaha, Ponca, Dakota, Pawnee, North-West Coast, etc.) are **unverified assistant-drafted claims**, not facts established by this conversation. Do not generate faux sacred lyrics or imply authenticity from these drafts. First verify the source, terminology, community, period, and whether the material is public / appropriate to adapt.

Other cautions:
- “Sea-Gypsy” is an outdated outsider label; the later assistant heading “Banguingui maritime chant/bell cycle” is preferable pending source review.
- “Pan-Afroasiatic” risks collapsing multiple distinct maritime and language communities into one invented continuum.
- “Kazakh yodeling” is explicitly treated by the assistant as speculative rather than as an attested named genre.
- “Russenorsk Work Music” should remain a counterfactual reconstruction unless an actual documented repertoire is found.
- The Doggerland prompt is necessarily imaginative; archaeological objects and settlement evidence do not establish a musical canon.

The user's request for “maximum realism” is best served by strict evidence bookkeeping, not by confident invention.

## 4. Funeral Polka — user correction and moderation observation (U13–16)

The user asks for Funeral Polka to be genuinely sad, almost a polka version of a Sicilian lament. The assistant revises the Czech-language prompt toward slow 2/4, heavy gait, delayed second beats, deep minor, descending chromatic / semitone motion, sighing appoggiaturas, long lament phrases, held cadences, muted brass, clarinet and violin glissandi, broken solo or small-chorus delivery, and a dance pulse experienced as painful bodily memory rather than cheerfulness.

This is a cross-cultural affective instruction, not evidence of an authentic Sicilian funeral-polka tradition. The prompt's named setting remains Czech-Moravian-Silesian borderlands.

The user then notices an apparent rapper-name collision. The assistant runs a substring check and identifies `ti` within Czech `chromatické`, suggesting `půltónové` instead. This is a plausible lexical-collision hypothesis, but the source does not show a confirmed moderation reason or a controlled test. Keep the exact prompt revision and any UI block outcome separate.

## 5. Spoken-word field-tape composite (U20–26)

This is a distinct prompt-development case, not one of the 40 nano-genres.

### User's target

- Early oral-history / field-tape recording with multiple sessions roughly edited together.
- People talking about ordinary matters, personal anecdotes, names, memories, questions, and answers.
- Spoken rather than sung.
- No explanatory commentary about the recording except plausible technician remarks.
- Rough, decontextualized cuts, eventually hidden inside tape noise rather than explicitly marked as formal edits.
- Old local dialect voices; technician in a transatlantic-but-not-polished register.
- Amateur, unpracticed speech, tangents, self-interruption, self-correction, run-ons, interjections, and some word-boundary mutations.
- Most, but not all, lines run together.
- At least one long meandering anecdote in which the speaker comments to himself, comments on his own comment to the interviewer, interrupts himself, corrects himself, and finds himself funny.
- Tinny, old-fashioned recording character; high/thin voices and irregular speech tempo.

### Iterative construction

The user progressively tightened the brief:
1. rougher and clearly decontextualized;
2. rough cuts of 200–1,000 characters, about 5,000 characters total;
3. remove explicit cut labels; let tape-noise breaks flow into the next fragment;
4. specify voice and delivery in detail;
5. increase amateur tangents, dialect spelling, run-together words;
6. make most lines run together and add one long self-interrupting anecdote.

The final assistant version is titled “Rough Tinny Field-Tape Speech Composite.” Its opening performance direction describes narrow bandwidth, rolled-off bass, brittle upper mids, papery hiss, high/thin/nasal voices, irregular speech tempo, clauses bunching and stalling, blurred word boundaries, migrating consonants, attached articles/clitics, and collapsed unstressed syllables.

### Evidence boundary

This source documents prompt and text construction, not a generated Suno audio result. The fictional field-tape should not be described as a recovered historical recording. If dialect authenticity matters, the voice profile and spellings need checking against documented regional speech rather than escalating eye-dialect.

## 6. Cross-reference: the Kroger “Thursday Only! Meat Sale!” fair-ride piece

At U27–28 the user asks to return to a previous “weird sort of fair ride odd song.” The source conversation identifies it as the Kroger “Thursday Only! Meat Sale!” fair-ride piece.

A separate Library source, `Suno Library — 2026-11-02 — raw (1).json`, has now been located. It contains the full prompt text under the title **KROGER DELI BLACKLIGHT SALE / THURSDAY-ONLY MARKET RESEARCH AUTOANALYSIS**, not merely the earlier summary. A separate case note records its architecture and output metadata.

## 7. Next work queue

1. Keep the 40-item list and prompt method as a source-derived register; do not silently promote invented or assistant-generated traditions into factual genre records.
2. Continue from item 29 only after reviewing the status of items 19–30 and their source basis. Do not generate sacred / ceremonial lyric imitations without community-grounded sourcing and appropriateness checks.
3. Verify every attested / Indigenous / regional entry against primary or specialist sources before revising the prompts.
4. Preserve the Funeral Polka revision and record the suspected `ti` collision as an unverified moderation hypothesis.
5. Treat the field-tape composite as a spoken-word prompt / text case and keep it separate from Suno output evidence.
6. Use the recovered Kroger Library record as the source for its own case study; do not reconstruct it from memory or copy the full prompt into a public source map.

## 8. Evidence labels

- **User specification:** direct requirements from U1–U4 and U20–U26.
- **User worklist:** canonical list supplied in U5 / repeated in U17.
- **Assistant draft:** generated genre definitions; not evidence of historical authenticity.
- **User correction:** changes to intent, affect, or wording.
- **Moderation hypothesis:** proposed lexical trigger, not verified platform behavior.
- **Prompt artifact:** text constructed for possible Suno use.
- **Unresolved:** source authenticity, cultural permission, actual audio behavior, or prompt/output lineage.
