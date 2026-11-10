# External mining: symbolic languages, phonetics, and musical grammar
Date: 2026-11-10

## Scope
This batch explores alternate representational languages for music: notation, event sequences, grammars, phonetic/IPA representations, syllable alignment, and text-audio embedding. These sources concern research systems and music representation generally. They do not establish how Suno parses or internally represents prompts.

## 1. Symbolic notation as a language

### NotaGen: Advancing Musicality in Symbolic Music Generation with Large Language Model Training Paradigms (IJCAI 2025)
Source: https://ijcai.org/proceedings/2025/1134
Evidence type: peer-reviewed research.
NotaGen is pretrained on more than 1.6 million pieces in ABC notation, then fine-tuned on a smaller classical corpus with period/composer/instrumentation prompts. ABC's header can encode metadata such as tempo, time signature, key, and instrumentation; the body encodes musical content across voices. The paper uses hierarchical decoders and stream-based methods for longer sequences.
Idea value: a text-like representation can carry both a compact metadata header and a structured musical body. The boundary between header and body is itself an information design choice.

### Text2Score: Generating Sheet Music From Textual Prompts (May 2026 preprint)
Source: https://arxiv.org/abs/2605.13431
Project: https://keshavbhandari.github.io/portfolio/text2score
Evidence type: research preprint.
The framework translates natural-language intent into a measure-wise structured plan, then generates sheet music using interleaved ABC notation. The plan includes instruments, key, time signature, harmony, and other attributes. The authors evaluate playability, readability, instrument use, structural complexity, and prompt adherence.
Idea value: an intermediate symbolic plan can make a musical idea inspectable before it becomes audio. This is a representation strategy, not a claim about Suno.

### MusicLayout: Explicit Structural Planning for Controllable Text-to-Music Generation (August 2026 preprint)
Source: https://arxiv.org/abs/2608.09035
Evidence type: research preprint.
MusicLayout describes a piece as a time-aligned layout of sections, textures, repetitions, variations, and instrument-level arrangements. A planning representation is generated before audio tokens, and the layout can be inspected or manipulated.
Idea value: represent the architecture of a piece independently of the sound that eventually realizes it.

### NotaGen and broader symbolic representations
The 2026 survey describes MIDI event streams, piano rolls, ABC, REMI/REMI+, compound-word representations, and score formats. Each makes different information explicit or implicit. MIDI event streams represent note-on/off and timing; piano rolls make pitch-versus-time visually explicit; ABC is compact and human-readable; REMI adds metrical, tempo, chord, time-signature, and instrument tokens to event sequences.
Survey: https://doi.org/10.1007/s10462-026-11582-x
Evidence type: peer-reviewed survey.

## 2. Music as grammar, not merely vocabulary

### Natural Language Processing Methods for Symbolic Music Generation and Information Retrieval: A Survey
Source: https://doi.org/10.1145/3714457
Evidence type: peer-reviewed survey.
The review discusses musical grammars and syntax, including tension/relaxation, harmony, and implication-realization. It also notes that music is not simply text with different tokens: polyphony introduces simultaneous voices, and musical symbols mix structural, note-level, and global information. There is no universally accepted grammar for all music, or even necessarily for one style.
Idea value: grammar can describe expectations and violations, but a grammar is a lens, not a universal law.

## 3. Phonetics, syllables, and the voice as a musical instrument

### Transinger: Cross-Lingual Singing Voice Synthesis via IPA-Based Phonetic Alignment (2025)
Source: https://pmc.ncbi.nlm.nih.gov/articles/PMC12542845/
Evidence type: peer-reviewed research.
The work uses IPA as a consistent phonetic representation across multiple languages, addressing the fragmentation of language-specific phoneme encodings such as Pinyin and ARPA.
Idea value: IPA can be a language-independent way to describe pronunciation material. It does not follow that Suno will reliably interpret IPA in a lyric prompt.

### Prompt-Singer: Controllable Singing-Voice Synthesis with Natural Language (NAACL 2024)
Source: https://aclanthology.org/2024.naacl-long.268/
Evidence type: peer-reviewed research.
The model separates lyric content from natural-language singing-style prompts. Lyrics are phonemized, and phoneme-level durations are obtained from annotations or forced alignment. Pitch representation is treated separately.
Idea value: words, pronunciation, duration, pitch, and vocal style are separable representational dimensions in a dedicated singing synthesis pipeline.

### Singing to Speech Conversion with Generative Flow (2025)
Source: https://pmc.ncbi.nlm.nih.gov/articles/PMC11893632/
Evidence type: peer-reviewed research.
The paper emphasizes that singing changes pitch, duration, and timbre over time. It argues that transcription into ordinary text can lose phonetic detail and temporal alignment. Singing pronunciation can also modify vowels or omit consonants for fluency and expression.
Idea value: phonetic identity and sung realization are not the same thing. A written lyric is only one projection of a vocal performance.

### STARS: Singing Transcription, Alignment, and Refined Style Annotation (ACL Findings 2025)
Source: https://aclanthology.org/2025.findings-acl.781/
Evidence type: peer-reviewed research.
STARS combines phoneme-audio alignment, note transcription and timing, vocal technique identification, and global style annotation. It organizes information across frame, word, phoneme, note, and sentence levels.
Idea value: the voice can be represented at several nested scales, from phonetic gesture to whole-sentence delivery.

## 4. Text-audio alignment and the limits of semantic similarity

### FIGMA: Towards Fine-Grained Music Retrieval (ACL 2026)
Source: https://aclanthology.org/2026.acl-long.2197/
Evidence type: peer-reviewed research.
FIGMA targets retrieval from descriptions of fine-grained musical attributes such as tempo, key, chord progression, and rhythmic structure. It proposes joint global and frame/token-level alignment rather than relying only on whole-caption similarity.
Idea value: a representation can preserve the overall topic while losing which attribute belongs to which instrument or moment.

### Don't CLAP: Are Music-Text Models Bag-of-Words? (September 2026 preprint)
Source: https://arxiv.org/abs/2609.30540
Evidence type: research preprint.
The authors test whether contrastive music-text models understand attribute bindings by swapping properties such as timbre, lead/accompaniment role, or order of first appearance. They report that tested contrastive models often fail to distinguish meaning-changing swaps reliably; an audio-language model does better, but the authors identify limitations in its advantage.
Idea value: a bag of correct words is not necessarily a correct description of musical relationships. Binding, role, and order matter.

### CLaMP 3: Universal Music Information Retrieval Across Unaligned Modalities and Unseen Languages (ACL Findings 2025)
Source: https://aclanthology.org/2025.findings-acl.133/
Evidence type: peer-reviewed research.
CLaMP 3 aligns sheet music, performance signals, audio recordings, and multilingual text in a shared retrieval framework, including generalization to unseen languages.
Idea value: different representational media can sometimes be connected without requiring them to be identical.

## 5. Representation distinctions to preserve
- Symbolic score is not audio.
- MIDI event stream is not piano roll.
- ABC notation is not a general-purpose polyphonic score format.
- Phonemes are not syllables; syllables are not words.
- Lyrics are not a full record of sung pronunciation.
- A global text/audio similarity score does not necessarily capture attribute binding, role, or temporal order.
- A formal grammar describes a chosen domain; it does not establish a universal musical grammar.
- Research-system capability does not imply Suno capability.

## 6. Retrieval date
2026-11-10
