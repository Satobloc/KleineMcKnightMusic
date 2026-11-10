# Idea mine: alternate representational languages for music
Date: 2026-11-10

These are loose creative ingredients. They are not a proposed Workbench structure, nor claims about what Suno understands.

## A. Different languages expose different relationships

- **ABC / score-like notation:** pitch, duration, meter, key, voice, and phrasing become explicit.
- **MIDI-like event streams:** music becomes a sequence of events and state changes.
- **Piano-roll geometry:** simultaneity, register, density, and duration become spatial.
- **Formal grammar:** motifs, transformations, returns, expectations, and violations become syntax.
- **IPA / phonetic spelling:** vocal material becomes articulatory sound rather than lexical meaning.
- **Syllabic notation:** vowels, consonants, stress, and syllable duration become compositional material.
- **Relational language:** parts are defined by what they do to one another, not merely by their instrument names.
- **Timelines and layouts:** the piece becomes a sequence of regions, transitions, repetitions, and changes.
- **Mathematical or procedural notation:** repetition, variation, probability, recursion, and constraint become explicit operations.
- **Multilingual / invented language:** phonetic character, ambiguity, semantic opacity, and unfamiliar word-shapes can be explored without assuming the generator interprets them consistently.

## B. Translation can be lossy, generative, or deliberately destructive

A single idea could be translated between prose, IPA, syllable strings, ABC, event lists, relational diagrams, and timeline descriptions. Each translation might preserve some properties and distort others.

Possible questions:
- Which properties survive translation?
- Which properties are lost?
- Which new associations appear?
- Does the system treat unfamiliar notation as instruction, lyric, decoration, or noise?
- Does the translation change the resulting music even when the intended musical idea remains constant?

## C. Phonetic material as composition

Potential material:
- vowel-only sequences with changing mouth shape;
- consonant clusters as percussive gestures;
- IPA sequences with deliberately unusual articulatory transitions;
- syllables with controlled stress patterns;
- invented words designed for mouthfeel rather than meaning;
- the same phonetic sequence written in ordinary spelling, IPA, and an invented orthography;
- one lyric represented as words, syllables, phonemes, and timed syllable events.

A useful distinction: phonetic notation describes intended speech sounds, but a singing model may reinterpret, simplify, or ignore it. Treat output as an observation, not proof of phonetic parsing.

## D. Grammar and procedural structures

- Motif grammar: A -> A', A'', B, return(A), fracture(A).
- Tension grammar: establish -> accumulate -> suspend -> rupture -> aftermath.
- Call/response grammar with asymmetric roles.
- Recursive structures in which a section contains a miniature version of the whole.
- Rules with exceptions, where the exception is the point.
- A score described as a sequence of transformations rather than a sequence of sections.
- A musical "syntax error" deliberately inserted at a structurally meaningful point.
- Parallel grammars that disagree about what should happen next.

These are compositional metaphors and possible textual encodings, not claims that Suno executes formal grammars.

## E. Small experiment families for later use

1. **Representation swap:** Same intended music in prose, ABC-like notation, IPA, timeline, and relational instructions.
2. **Phonetic equivalence:** Same sound sequence in ordinary spelling, IPA, and invented orthography.
3. **Semantic subtraction:** Keep phonetics while removing lexical meaning; then keep meaning while changing phonetics.
4. **Grammar mutation:** Preserve a structural grammar while changing its vocabulary, instrumentation, or genre description.
5. **Notation collision:** Mix a score fragment with emotional prose, procedural rules, or an unrelated data format.
6. **Translation cascade:** Translate prose -> notation -> prose -> phonetics -> prose, then compare the musical result to the original.
7. **Binding test:** Swap which instrument receives which attribute while keeping all words constant.
8. **Hierarchy test:** Describe the same idea at phoneme, syllable, word, phrase, section, and whole-track levels.
9. **Unreadable-but-structured:** Supply a coherent invented symbolic system and compare it with a conventional, meaningful notation.
10. **Accidental lyric test:** Put instructions in a format that might be interpreted as singable text and observe whether it becomes lyric, arrangement, or neither.

## F. A useful warning from the research
Text-audio systems can respond to a collection of correct keywords without reliably preserving the relationships among them. "Distorted guitar, clean piano" is not equivalent to "clean guitar, distorted piano." Roles and bindings are information. A representation that preserves vocabulary but loses bindings may be structurally misleading.

## G. The larger possibility
The prompt need not be written in the language of music. It could be written in the language of choreography, grammar, geometry, code, phonetics, systems theory, or something invented for one composition. The question is not whether the system understands that language in a human sense. The question is what transformations become possible when that language is introduced, and how reliably those transformations can be observed.

## Evidence reminders
Research sources are recorded in the matching raw dump and structured JSON. The most relevant include NotaGen, Text2Score, MusicLayout, Transinger, Prompt-Singer, STARS, FIGMA, CLaMP 3, and the 2026 music-generation survey.
