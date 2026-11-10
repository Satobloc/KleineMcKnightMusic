# Predict the Song Style — Phonetic, Linguistic, and Temporal Experiments, Pass 05

**Mining date:** 2026-11-10  
**Parent source:** `Predict the Song Style`, conversation `6ad0cf68-eebc-83ea-9da8-4aa0b56bad53`  
**Source export:** `ND Predict the Song Style - raw.json` (Git blob SHA-1 `4cd9a30c14b5eb206e6fd36c9a94e0ff43026ba5`)  
**Scope:** user-message ordinals U1–U44.  
**Status:** source-derived map and correction register; no audio files are attached to this section of the export.

## 1. What this section actually contains

This is not one experiment. It is a cluster of lyric transformations, style prompts, musical-structure notation, semantic/reference tests, and user listening reports. The important distinction is between:

- a **text transformation** the user asked the assistant to perform;
- a **prompt construction** intended for Suno;
- an **assistant prediction or interpretation**;
- a **user's report of a generated result**;
- a **creative text / lyrical analysis** that may have no Suno result attached.

These categories were repeatedly blurred in the original assistant responses. This pass keeps them separate.

## 2. Case groups

### A. Rhyme-preserving phonetic substitution (U1–3)

U2 gives a tightly constrained transformation request: ignore everything except per-word or per-morpheme rhyme, and replace every syllable with the closest English-sounding syllable. The source text is supplied as an existing passage, but the task is explicitly **not translation**.

The assistant recognizes the task as sound-alike substitution and returns a phonetic English doppelgänger in a writing block. The user then jokes about removing an unwanted phrase.

**What is supported:** this is a phonetic transformation procedure with explicit constraints on rhyme unit and syllabic sound resemblance.

**What is not supported:** no user listening report or Suno generation is attached to this specific transformation. The assistant's output is not a validated phonetic-equivalence solution.

**Future test:** compare syllable-by-syllable transformation, morpheme-level rhyme preservation, and whole-word sound-alike substitution on the same source, then use the variants as separate lyric inputs.

### B. Structured nonsense / character-sheet lyric and contrasting musical result (U4–8)

U4 presents an intentionally abnormal character-sheet-like block: extreme age, unconventional pronoun strings, nonstandard identity fields, invented species/class/occupation, and other unusual metadata.

The user reports that the resulting music had creepy vocals over a surprisingly light, pretty, glitch-twinkly sound; it was catchy and upbeat, with strong Arabic-classical elements alternating with something like an Andy Griffith whistling tune (U5).

The next prompt changes the Style field to a cross-regional folk / dubstep / gangsta-rap hybrid, with a high-pitched vocal, layered octave doubles, whistle-register flourishes, sampler and flute, Tsugaru shamisen, sitar, Korean and Chinese folk strings, Pacific drums, bamboo percussion, ostinato, and glitch-cut transitions. The user reports that the result was surprisingly upbeat and fun (U7–8).

**What is supported:** the user reports a striking affective mismatch between dark / uncanny lyrical material and light, catchy or playful music. The Style field also contains multiple explicit rhythmic, vocal, production, and instrumentation cues.

**What is not supported:** the prompt's very long ingredient list prevents attribution to any individual genre, instrument, or word. There is no audio attached here.

**Mining inference:** the emotional character of the lyric and the musical character of the arrangement may be separable dimensions. Test them independently rather than assuming disturbing text produces disturbing music.

### C. Timbre-chord and folk-waltz result (U11–12)

The user defines a **timbre-chord** as a drone made by varying the timbre of a single note at multiplicative frequencies. The user also reports that a recent prompt titled “Smiling Face with Three Hearts” produced a lovely oompa-hula slow waltz with a little Latin flavor.

The assistant treats the timbre-chord as a potential compositional mechanism and connects it to the reported result, but the source does not establish that the specific generation contained the timbre-chord technique.

**What is supported:** the user-originated concept of a timbre-chord and a separate positive listening report for a slow waltz.

**Unresolved:** whether the timbre-chord was encoded in that prompt, rendered in the audio, or merely discussed alongside the result. Keep the concept and the listening report as separate records until the prompt lineage is recovered.

### D. Semantic collage, reference recognition, and intentionality (U13–21)

U13 supplies a two-voice lyric: one voice uses recognizable narrative and vernacular speech; the other uses a collage of cultural, technical, artistic, and visual references. The user asks for lyrical analysis and later asks for the specific references in “Juggalette Supermodel” (U15).

The assistant initially describes some of the text as accidental or confused. The user pushes back with “Accidentally my ass” (U14). The assistant later acknowledges that the semantic discontinuity, broken causality, phonetic texture, repetition, and incompatible registers are deliberately engineered.

U16 confirms one assistant interpretation: cognition can generate an experience by confusing sensory or representational categories.

U17 continues with dense stream-of-consciousness writing and sound-driven word mutation. The user then clarifies that “Tasmanian peppery” was intended, but hyphenating the `-y` produced “why”, which the user preferred (U18). Other corrections add concrete semantic anchors:
- “Static march” is identified as a phrase (U19).
- “Liquid Leather” is a repair compound, not merely a poetic material image (U19).
- “Smothered, chunked, covered” is the Waffle House hash-brown vocabulary (U20–21).

**What is supported:** this writing deliberately combines semantic discontinuity, sound association, references, and accidental-seeming transformations. Some apparent nonsense has specific external referents or deliberate wordplay.

**Method correction:** do not treat a surprising or malformed phrase as accidental until the user says so. A phonetic mutation may preserve a hidden reference, become a new phrase, or be intentionally left ambiguous.

**Routing:** this is a writing / language / reference lineage, not a direct Suno behavior case. Preserve only the compositional methods and user listening observations relevant to music; do not copy the full lyric text into public files.

### E. SPOOKENCHOLY: three clocks and intermeshing rhythmic systems (U22–24)

U22 is one of the most explicit musical-structure prompts in the entire conversation.

It defines three clusters:
- **Cluster A:** 3/4, small pump organ and bass clarinet, unresolved three-note hook with recursive return.
- **Cluster B:** 5/8 grouped 2+3, tapan, clay pot, sparse cimbalom; slightly early and decorating missing attacks.
- **Cluster C:** 4/4, shoe-step, breath, woodblock, handbell; slightly late, keeping the floor and refusing to smooth.

The intermesh instruction says each cluster preserves its own gait; collisions may drag, clip, cough, or briefly misalign; recovery occurs without reset. The prompt includes start-on triggers and repeated text, plus a long literary passage whose lineation, repetition, and acceleration are treated as rhythmic material.

The assistant calls this a “three-clock” architecture and later calculates the common cycle for 6, 5, and 8 eighth-note units (LCM 120). That arithmetic is a useful formal consequence of the prompt's three meters, but it does not establish that Suno rendered those exact cycle lengths.

U23–24 contain the phrase “Full o surprised” followed by “Full o surprises.” The assistant asks whether this refers to surprise at the result or to Suno following the architecture. The source does not include a definitive user answer in this segment.

**What is supported:** the user explicitly designed three simultaneous metrical systems with separate carriers, local timing behavior, trigger phrases, and recovery without global reset.

**What remains unknown:** whether the output preserved the three independent clocks, whether the transitions remained metrically distinct, and whether the model followed the start-on triggers.

**Future test:** use a short fixed text and three independent musical carriers; create a control with the same instruments but one shared meter. Compare perceived independence, phase drift, recovery, and persistence.

### F. Language erosion / chickenized vocal transformation and reference recognition (U26–29)

U26 specifies a staged vocal trajectory:
1. an almost inaudible held breath;
2. fast whimpering, with language disappearing while the phrase is still happening;
3. low throat-singing using a kargyraa fundamental and thin sygyt melody;
4. continued transformation into chicken-like vocal syllables.

The user asks the assistant to look closer and later jokes, “What, you didn’t recognize the Bocelli under there?” (U27). The assistant then identifies the intended reference as Andrea Bocelli's *Con te partirò* and maps several chickenized syllable sequences to the song's Italian vocal material.

**What is supported:** the user intentionally embedded a recognizable song reference in a phonetic transformation and gave a detailed vocal-performance trajectory. The assistant's eventual recognition is a reference-detection outcome, not proof of what Suno generated.

**Evidence boundary:** the source contains no audio pointer in U26–29. Do not claim the generated audio actually moved from language to throat-singing to chicken vocalization unless the recording is recovered.

**Rights:** retain the transformation method and the fact of reference recognition; do not reproduce the original copyrighted lyrics.

### G. Swidgyy: mixed sound words, semantic mutation, and emergent language (U30–33)

U30 supplies a long lyric with compressed spacing, repeated sound motifs (`Swidgyy`, `Gwydgy`, and related forms), recognizable English passages, altered phrases, parenthetical cues, character voices, and narrative fragments.

The assistant initially overweights the phonetic / nonsense interpretation. The user corrects it in two steps:
- “There’s more linguistic structure under the mutation (for some of it)” (U31).
- “Squidgy is just a sound word. It’s the rest that has more meaning” (U32).

U33 repeats the text and foregrounds its opening idea: it is easier to make something out of nothing with one's own noise.

The assistant subsequently recognizes that the surrounding mutations may contain recoverable underlying language, word morphology, names, and semantic structures. The user's correction is the controlling source statement.

**What is supported:** this material is a mixed system, not pure glossolalia. Some tokens are sound words; some are semantic phrases; some are transformations with recoverable linguistic structure; some meaning is newly constructed through mutation.

**Critical rule:** never label the whole text “nonsense language” or treat it as a cipher with one hidden original. Classify each region separately: sound-word, recognizable lexical material, transformed language, invented morphology, semantic mutation, or unresolved.

**Relationship to later Almote:** U479–594 develops a separate, more systematic constructed-language process. Do not collapse this earlier Swidgyy lyric into Almote without evidence of a direct lineage.

### H. Numeric motif notation and structural prompt language (U34–35)

U34 and U35 are identical copies of the same user message. The prompt uses compact numeric motifs and explicit comments:
- `111`: simple hook, Bb build/drop;
- `123`: add a perfect third and fifth uncertainly;
- `321`: variation with anticipation and arpeggio;
- repeated sections marked C / D / A / B;
- motif simplification, inversion, nested arpeggios, tonal tension, tremolo, rhythmic dissonance, staggered subordinate meters, melody/accompaniment swaps, echo-pan ping-pong, and increasingly complex layers.

**What is supported:** the user is experimenting with a compact notation that links numeric patterns to musical operations and arrangement trajectory.

**What is not supported:** no evidence in this section proves that Suno maps `111`, `123`, or `321` to specific pitch classes, intervals, or rhythmic operations. The intended semantics are supplied in the comments; the numeric strings themselves are not a validated score language.

**Future test:** compare (a) numeric notation plus comments, (b) comments alone, and (c) a conventional text description. Keep the musical target and all other fields fixed. Record whether the output follows the intended contrast, not whether it merely sounds complex.

### I. Non-music material to exclude (U10, U36)

U10 contains a large Sites-hosting skill instruction dump; U36 contains HsH/SAT onboarding and NotebookLM customization material. They are unrelated to the music-source extraction and should not be copied into KMcKM's music corpus.

## 3. Additional style / listening cases

### “Twentyteen 27nd” (U37–39)
The source contains a detailed style description: genre-rotating electronic chiptune, halftime DnB bounce, slow stutter-kick, double-time triplet fills, a bright synth hook, braindance / dangdut-remix / Memphis-phonk colors, sustained female vocals, quick rap-like phrasing, and glitch production. The user reports the result is lovely and “somewhat múmesque,” then characterizes the intended aesthetic as early múm made much denser, with mumble rap as muzak.

**Supported:** the user's listening comparison is to early múm; the phrase “Twentyteen 27nd” is the title. The prompt is a dense but directional style construction. The exact source of the style description (user or prior assistant) should be traced before treating it as a user-authored prompt.

### Dark, interrupted-locomotion result (U40–42)
U40 contains a dense style prompt with a low / deep female voice, Russian-English delivery, babyish commercial cadence, lurching half-time groove, noise-based hi-hats, ring-modulated chimes, degraded recording texture, and a long list of excluded genre labels. U41 reports the darkest sound in that session: pretty but disquieting, with a slow-creeping movement punctuated by “stop, step, stop, walk.” U42 says it had no mashup predecessors and was a fresh generation.

**Supported:** this is a first-person listening report of an interrupted / stop-start locomotion quality and a fresh generation without mashup source material.

**Unresolved:** the long negative-genre list makes it difficult to identify which positive cue drove the result. No audio is attached.

### Documentary narrative / cross-tradition prompt (U43)
U43 supplies a deep-pop style prompt with Latin mumble-rap framing, steel-guitar tremolo, slap bass, finger snaps, sleigh bells, sub-bass, close-mic murmured phrasing, slow build, creepy sound design, and a very large concatenated genre stream. Its lyric is a chronological narrative about paleontologist Edward Drinker Cope.

**Supported:** this is a move away from pseudo-language and toward dense documentary / biographical narrative as lyric material, combined with a large style vocabulary.

**Unresolved:** the exact prompt lineage and whether this is the same output analyzed later in the conversation should be checked before creating a separate case.

### “Nonlinear story songs” prompt (U44)
U44 combines a 1950s folk / folk-dance sway, clipped spoken-sung female character voices, tape edits, accordion and shaker, and references to hula stubemusik, upopo quadrille, Sardinian throat-singing, Ukrainian balalaika, and Prussian brass. The lyrics deliberately alternate historical / dramatic ballad material, absurdist dialogue, and technical / autobiographical fragments.

**Supported:** the user is explicitly using contrasting voice identities and incompatible narrative registers as a compositional structure.

**Caution:** the listed tradition labels are prompt ingredients, not verified ethnomusicological descriptions. In particular, do not assume “upopo quadrille” or “Sardinian throat-singing” is a precise native genre label without specialist checking.

## 4. Cross-case patterns worth retaining

1. **Sound and meaning coexist.** A word may be a sound token, a mutated lexical item, or a semantic hinge. Classify locally.
2. **Accidental-looking mutations can be deliberate.** The user may preserve a transcription or hyphenation accident because it creates a better phrase.
3. **The lyric can contain its own performance architecture.** The SPOOKENCHOLY prompt uses metre, carrier, timing behavior, triggers, and reset conditions as part of the text.
4. **A prompt can specify several clocks without specifying one global meter.** The three-cluster system is a concrete example.
5. **A recognizable source can be buried in phonetic transformation.** The Bocelli / chicken case is a reference-detection test, not just glossolalia.
6. **Numeric notation is a candidate interface, not a proven control language.** The user defines the semantics; the model's response still needs matched tests.
7. **Dense genre lists and structural constraints are different prompt variables.** Avoid treating them as one “complex prompt” condition.
8. **User listening reports are evidence about the output's perceived effect, not objective acoustic measurements.** No audio in U1–44 is independently inspectable from this export.

## 5. Routing and non-duplication

- Keep this pass in `EXTERNAL_MINING`; it is assistant-maintained source research and method extraction.
- Do not populate or reorganize `Prompt_Hopper`, `Genre_Hopper`, or `Lyrics_Hopper`.
- Keep the user's actual lyrics and full text artifacts in their original source locations. This note summarizes and points to message ordinals rather than mirroring the lyrics.
- Cross-reference the later `Swidgyy` and Almote work only as a possible lineage; do not merge them.
- Cross-reference the SPOOKENCHOLY multi-clock prompt with the existing workshop's temporal-control and global/local prompt-grammar work. Do not recreate those assistant-mined records.
- Do not add these anecdotal cases to the model-behavior registry until exact prompt lineage, version/settings, and audio are available.

## 6. Next steps

1. Trace the prompt lineage for U4–8 and U37–44, separating user-authored Style text from assistant-generated suggestions.
2. Recover audio for the listening reports if available elsewhere; none is attached in U1–44.
3. Reconstruct the SPOOKENCHOLY meter / trigger architecture as a clean test specification, retaining the original prompt's separate clocks and no-reset behavior.
4. Compare the Swidgyy source text across U7, U30–33, and later U479–594 without merging distinct language-development stages.
5. Test numeric motif notation against prose-only controls before treating it as a repeatable prompt grammar.
6. Keep the “timbre-chord” as a user-originated compositional hypothesis until a concrete prompt and audible example can be linked.

## 7. Evidence labels

- **Direct user instruction:** a prompt constraint or correction explicitly stated by the user.
- **User listening report:** the user's description of generated audio.
- **Assistant prediction / interpretation:** model-generated analysis, not an outcome.
- **Source text:** lyric or other material supplied in the conversation.
- **Mining inference:** a candidate relationship suggested by the source.
- **Unresolved:** missing audio, prompt lineage, version/settings, or ambiguous attribution.
