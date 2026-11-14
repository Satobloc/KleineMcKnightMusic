# English Language Change — Research Synthesis and Simulation Requirements

**Research ID:** WF-LING-RESEARCH-001  
**Version:** 0.1  
**Status:** INITIAL EVIDENCE SYNTHESIS / WORKING RESEARCH, NOT AN IMPLEMENTATION SPECIFICATION  
**Date:** 2026-11-14  
**Active operation:** WF-LANG-002  
**Purpose:** Establish what historically plausible language evolution looks like, using the documented history of English as a concrete case study, then translate those findings into requirements for *Well, Fuck.*

## 1. Executive conclusion

A realistic language does not evolve by periodically selecting a phrase and randomly mutating its words. It changes through the accumulation and social transmission of variation in actual language use.

The relevant unit is not simply the phrase or lexeme. It is a population of speakers using competing pronunciations, words, meanings, grammatical constructions, and discourse strategies in particular contexts. Some variants spread; others remain local, become socially marked, coexist for centuries, or disappear. Contact, mobility, social networks, identity, prestige, learning, frequency, and the structure of the language all affect what survives.

English is a useful calibration case because its documented history includes substantial regional variation, contact with Celtic, Latin, Old Norse, Norman French, and later many other languages; major phonological changes; reduction and restructuring of inflectional morphology; changes in word order and grammatical constructions; extensive borrowing and native word formation; semantic and pragmatic change; and later written standardization that did not freeze spoken English.

**Core recommendation:** build a usage-driven, population-level change model. Innovations should arise in particular contexts, compete with existing variants, and spread through speakers and social networks. Phonology, morphology, syntax, lexicon, semantics, and pragmatics should interact, but no single mechanism should rewrite the entire language arbitrarily.

This document is a first synthesis. It distinguishes well-supported historical patterns from debated causal explanations and proposed simulation approximations.

## 2. A necessary distinction: which English are we evolving?

There are two different projects that can be confused:

1. **Reconstruct the historical development of English:** start from a defensible Old English or earlier West Germanic state and model changes toward later English. This requires period-appropriate phonology, morphology, lexicon, dialects, and contact histories.
2. **Evolve a future descendant of a contemporary English-like seed:** start with modern English expressions and a modern-English-like language state, then model plausible future change. English's past supplies evidence about mechanisms, not a script that the future must repeat.

The current prototype begins with contemporary English-derived expressions such as “Well, fuck.” It does not contain a reconstructed Old English grammar or lexicon. Unless we deliberately change that initial condition, the honest default is a **future-descendant experiment with English as the empirical reference**, not a reenactment of Old-to-Modern English.

The existing 36 proto-lexicon entries and 14 founder phrases are examples of initial material, not a closed inventory or a protected linguistic layer. They may persist, change, become idioms, acquire new functions, be replaced, or disappear. New vocabulary and constructions must be able to arise independently through the language system.

## 3. What the history of English demonstrates

Historical period labels are useful navigation aids, not hard boundaries at which an entire language changes at once. Old, Middle, Early Modern, and Modern English overlap through gradual and regionally uneven change.

### 3.1 Old English was already variable

English developed from West Germanic dialects brought to Britain from around the fifth century. Old English was not one perfectly uniform language. Regional varieties included Northumbrian, Mercian, West Saxon, and Kentish, and the surviving written record overrepresents some regions and periods.

Old English had a comparatively rich inflectional system, including grammatical case, gender, number, and verbal distinctions. Word order was more flexible than in present-day English, although it was constrained by syntax, discourse, and clause type. It is misleading to describe it as having no word-order rules.

**Simulation implication:** do not create one monolithic language object and later sprinkle dialect labels over it. Variation belongs in the initial state and should be represented in the population.

### 3.2 Contact changes languages, but not by simple replacement

English experienced several historically important contact situations:

- **Latin:** Roman Britain, Christianity, literacy, church organization, learning, and later scholarship supplied vocabulary and writing conventions.
- **Brittonic Celtic:** long-term coexistence and language shift formed part of the social history of early English. The structural consequences remain a subject of scholarly discussion.
- **Old Norse:** Viking settlement and sustained contact contributed everyday vocabulary such as *sky*, *get*, and *they*. Contact may also have reinforced or facilitated grammatical changes.
- **Norman and later French:** after 1066, French held prestige in courtly, legal, administrative, religious, and educational domains. English borrowed extensively, while native and borrowed words often coexisted in socially or semantically differentiated uses.

The familiar *cow/beef*, *sheep/mutton*, and *swine/pork* contrasts illustrate how a borrowed term can coexist with an inherited term and acquire a specialized social or semantic niche. Borrowing therefore need not erase the donor or recipient vocabulary.

Scholars debate the precise causal role of language contact in structural changes such as the loss of inflections. Contact, bilingualism, second-language learning, internal sound change, and pre-existing variation can interact. The simulation must not encode a simplistic rule such as “Norse contact causes case loss.”

**Simulation implication:** borrowing needs a contact history, a donor variety, an adoption path, and a recipient adaptation process. Borrowed words can retain donor features, adapt to recipient phonology, develop new meanings, coexist with synonyms, or remain restricted to particular domains and social groups.

### 3.3 Inflectional erosion and syntactic restructuring interacted

During the transition from Old to Middle English, unstressed syllables, especially word-final vowels, were reduced. Several inflectional endings consequently merged in pronunciation or disappeared. This weakened distinctions that had marked grammatical relationships.

English increasingly relied on more fixed constituent order, prepositions, and other analytic strategies. Subject–verb–object became the ordinary order, although the historical path involved competing constructions and gradual changes in the placement of verbs and objects.

This is not a story of grammar simply becoming easier. English lost some inflectional distinctions while developing or expanding other grammatical resources, including auxiliaries, periphrastic constructions, phrasal verbs, and more constrained syntactic patterns.

**Simulation implication:** sound change can alter morphology; morphological mergers can change the usefulness of word order and particles; syntax can then reorganize. These should be linked mechanisms, not unrelated random toggles. A language can lose one kind of complexity while gaining another.

### 3.4 The Great Vowel Shift was a system-level, gradual change

Between roughly the fifteenth and seventeenth centuries, English long vowels underwent a series of linked changes. High vowels diphthongized, while other long vowels shifted in the vowel space. The changes were gradual and did not proceed identically in all regional varieties. Some northern varieties did not undergo the full pattern.

The spelling system was becoming standardized through printing and other social processes while pronunciation continued to change. Modern English spelling therefore preserves many older relationships between letters and sounds.

**Simulation implication:** a sound change should operate on phonological representations, not spelling. It may be conditioned by phonetic environment and may spread at different rates across dialects. A system-wide chain shift is possible, but it should emerge from a set of related changes rather than a one-time arbitrary replacement of every vowel.

### 3.5 Standardization is a social and technological process

Printing in England from the late fifteenth century helped promote particular written varieties. Dictionaries, grammars, schooling, administration, and prescriptive movements later reinforced conventions.

Standardization affected writing, prestige, and judgments about correctness. It did not eliminate spoken dialects or stop language change.

**Simulation implication:** writing and orthography should be a separate layer. A community without a writing technology or standardizing institution should not acquire a standardized spelling system merely because enough simulation turns have passed.

### 3.6 English continues to change

Modern English remains internally diverse and continues to change in pronunciation, grammar, vocabulary, semantics, and pragmatic usage. Global movement and contact have produced new varieties and contact forms. Dialect levelling, dialect birth, dialect death, and standardization can occur alongside one another.

**Simulation implication:** a language is not a finished object after it reaches a familiar modern-looking state. There should be no terminal “completed language” state.

## 4. The principal mechanisms a realistic model needs

### 4.1 Variation and transmission

A change begins as variation in use or interpretation. It may be individual, cohort-specific, regional, occupational, stylistic, or associated with a social network.

For an innovation to become a community change, it must be learned, copied, accommodated to, or otherwise transmitted. Its spread depends on exposure and social structure. Prestige can matter, but so can solidarity, identity, age, peer networks, and local norms.

**Model requirement:** represent competing variants and their distributions. Avoid treating a community as a single speaker whose entire lexicon mutates simultaneously.

### 4.2 Phonetic and phonological change

Potential processes include reduction, assimilation, dissimilation, lenition, fortition, deletion, insertion, metathesis, vowel movement, diphthongization, and changes in phonotactic constraints.

A sound change is usually conditioned by its phonetic environment. Once established as a regular phonological change, it may affect many eligible forms. However, innovations spread through speakers, dialects, and sometimes through the lexicon in ways that can be gradual and uneven. Borrowed words, analogy, register, and differing histories can create apparent exceptions.

**Model requirement:** represent IPA segments as authoritative forms; describe changes with explicit conditioning environments; allow a change to begin as a variable pronunciation; track its spread across speakers, words, and communities; preserve exceptions with provenance; distinguish phonetic variation from a phonemic contrast change.

Do not implement a sound-change lottery that independently swaps arbitrary phonemes in arbitrary words every few turns.

### 4.3 Morphological change

Morphological systems can change through phonological erosion of endings; merger of formerly distinct endings (syncretism); analogical leveling or extension across paradigms; reanalysis of boundaries between words and affixes; creation of new inflections; grammaticalization of lexical words or multiword expressions; and loss or redistribution of grammatical categories.

Analogy is important because speakers extend patterns they have learned. It can regularize irregular paradigms, but it can also create new distinctions or competing forms.

**Model requirement:** store paradigms and morphological functions, not only lists of suffixes. Allow sound change to affect forms, analogy to restructure paradigms, and reanalysis to create new morphemes. A change may spread through some lexical classes before others.

### 4.4 Syntactic and constructional change

Syntactic change often involves competition between constructions. Word order, argument marking, auxiliary use, clause structure, and information packaging can all shift.

A common pathway is grammatical material becoming more frequent and structurally integrated. Repeated sequences can be reanalysed as a new construction. A change can spread from a small set of verbs or contexts to a wider range of lexical items.

**Model requirement:** represent constructions with their own frequencies, contexts, and constraints. Avoid treating syntax as a single community-level setting that flips from SOV to SVO in one event.

### 4.5 Lexical innovation, borrowing, and loss

Lexical change includes new roots and labels; compounding and derivation; conversion between word classes; shortening, blending, and reanalysis; borrowing and calquing; semantic extension and specialization; competition between synonyms; and loss of low-use or context-specific forms.

Borrowing is not merely adding a donor word to a list. A borrowed form may be phonologically adapted, morphologically integrated, restricted to a domain, associated with a prestige group, or retained as a marker of identity.

**Model requirement:** the lexicon must be open-ended. It should support new forms from several sources and retain etymological and social provenance. Existing English-derived phrases are just some starting attestations among potentially many forms.

### 4.6 Semantic and pragmatic change

Words are often polysemous. Speakers use them in context, infer meanings, extend metaphors, and associate expressions with particular social situations. A new meaning can coexist with an older meaning for a long time.

Plausible processes include metaphor, metonymy, broadening, narrowing, amelioration, pejoration, bleaching, specialization, and changes driven by pragmatic inference. Pragmatic markers can develop from adverbs, ordinary clauses, questions, commands, and subordinate constructions. Phraseological units can become fixed, remain variable, or develop new functions.

**Model requirement:** do not assign each lexeme one immutable gloss. Represent senses and contexts, and track usage by meaning and discourse function. “Well, fuck.” may remain an expression, split into different functions, become a discourse marker, or vanish; its future is an outcome of use, not a privileged rule.

### 4.7 Dialect contact, divergence, and levelling

Languages change in geographically and socially structured populations. Low contact can permit divergence. Migration and dense contact can promote convergence, borrowing, and dialect levelling. New mixed varieties can emerge when speakers with different varieties interact. A prestige variety may spread without eliminating local forms.

Geographic distance is only one influence. Trade, kinship, migration, political organization, shared work, social identity, and communication networks can make distant communities closely connected or nearby communities socially separate.

**Model requirement:** language communities need contact networks and social structure, not just coordinates. Parent–daughter inheritance is only one form of transmission.

### 4.8 Writing, orthography, and codification

Spelling is not pronunciation, and written standardization is not spoken-language stabilization.

**Model requirement:** keep speech evolution independent of orthography. Add writing, literacy, spelling conventions, and standardization only when the civilization model provides a plausible social and technological basis.

## 5. Proposed computational model

The smallest credible abstraction is a population of speakers or speaker-cohorts represented by distributions of linguistic variants. We do not need to simulate every human vocal gesture, but we do need to preserve the social and historical processes that make a variant spread.

### 5.1 Core state

A later implementation should distinguish at least:
- **Speech community:** population, location, mobility, internal social groups, and contact relationships.
- **Variant:** a pronunciation, lexical form, sense, morphological pattern, syntactic construction, or pragmatic use.
- **Distribution:** how common a variant is in a community, cohort, register, and social network.
- **Usage record:** the context and approximate frequency with which a form or construction is used.
- **Innovation record:** the proposed change, its source, mechanism, conditioning environment, first known use, and adoption history.
- **Contact edge:** interaction frequency and type between communities, plus relevant bilingualism or social asymmetry.
- **Lineage:** parent forms, borrowing source, derivation, sound changes, semantic history, and community inheritance.

These are conceptual requirements, not a finalized data schema.

### 5.2 A change cycle

1. **Use:** speakers produce utterances in response to communicative intentions and social contexts.
2. **Variation:** multiple forms or constructions may be used for the same or overlapping functions.
3. **Innovation:** a new pronunciation, lexical item, construction, inference, or reanalysis appears in a plausible context.
4. **Exposure:** other speakers encounter the variant through social interaction.
5. **Adoption:** speakers or cohorts acquire it at rates influenced by exposure, identity, network position, prestige, and usefulness.
6. **Diffusion:** the variant spreads, remains local, crosses into other communities, or fails.
7. **Reanalysis and interaction:** accumulated sound, semantic, morphological, and syntactic changes may create new structures or alter the function of existing ones.
8. **Retention or loss:** variants stabilize, coexist, become marked, or disappear.

This is a conceptual loop. The exact probabilities, time scales, and social variables must be calibrated rather than guessed.

### 5.3 Event use must drive language use

A geological or settlement event does not automatically become a spoken utterance. A speaker or group must notice it, interpret it, and have a reason to communicate about it.

Keep separate: what happened in the world; what a speaker knows or believes happened; what the speaker wants to communicate; what utterance the language system produces; and who hears and learns from that utterance.

### 5.4 Avoid arbitrary time-triggered mutation

The current prototype schedules phrase and sound changes against simulation turns. That is a useful experiment, but a realistic model should eventually relate change opportunities to language use, population size, interaction frequency, cohort replacement, and contact.

A turn is not automatically a generation, a year, or a fixed number of utterances. We must establish what simulation time means before assigning linguistic rates.

### 5.5 Preserve causality and uncertainty

Every important change should have an inspectable explanation: what changed; which forms or constructions were eligible; what social or linguistic context enabled it; how the variant spread; which communities adopted or rejected it; and what other linguistic structures it affected.

The simulation should permit multiple causes and competing explanations. Historical linguistics itself often debates why a change began, even when its later trajectory is well documented.

## 6. English-based calibration experiments

| Calibration case | Historical pattern to capture | Mechanisms to test |
|---|---|---|
| Contact vocabulary | Old Norse everyday loans; French prestige-domain loans; coexistence of native and borrowed terms | Contact exposure, borrowing, phonological adaptation, semantic/register differentiation |
| Inflectional restructuring | Unstressed ending reduction and merger, followed by changes in how grammatical roles are marked | Conditioned sound change, syncretism, analogy, syntactic competition, function-word expansion |
| Long-vowel shifts | Linked changes across a vowel system, with regional differences | Phonetic movement, system interaction, dialect diffusion, variable adoption |
| Grammaticalization | Lexical expressions acquiring auxiliary or discourse functions | Repetition, contextual inference, reanalysis, semantic bleaching, phonological reduction |
| Dialect formation | Regional varieties diverging, converging, levelling, or becoming socially differentiated | Population structure, network contact, mobility, prestige, identity |
| Standardization | Written conventions spreading while spoken variation continues | Literacy, institutions, print-like technology, codification, prestige |

The goal is not to force the simulation to reproduce every historical detail. It is to test whether the mechanisms can produce coherent, causally connected change without hardcoding the desired endpoint.

## 7. Minimum implementation sequence

1. Research the historical cases: assemble representative forms, timelines, dialect differences, and competing scholarly explanations.
2. Define the change ontology: decide what counts as a variant, innovation, adoption, diffusion, reanalysis, and loss.
3. Define population and exposure: determine whether the first implementation uses speaker cohorts, aggregate distributions, or a hybrid.
4. Build a small change laboratory: test lexical borrowing, conditioned sound change, and one linked morphology/syntax pathway outside the full simulation loop.
5. Validate the laboratory: use fixed seeds, explicit inputs, lineage traces, and tests for reproducibility and causal isolation.
6. Integrate with Well, Fuck.: connect actual communicative events and community relationships to the change laboratory.
7. Expand incrementally: add semantics, pragmatic change, richer morphology, dialect networks, and orthography when supported by experiments.

Do not implement every process simultaneously. First demonstrate that the basic transmission model works.

## 8. Open questions

1. Is the intended starting point a future descendant of contemporary English, or a deliberately reconstructed historical English stage? The current prototype supports the former more naturally.
2. Should language populations be represented by explicit speaker cohorts, aggregate frequency distributions, or a hybrid?
3. What does one simulation turn represent, and how many communicative interactions or generation changes can occur within it?
4. Which historical English cases should become the first executable benchmarks?
5. How should social identity and prestige be represented without reducing them to one generic influence score?
6. How much language variation should exist within one settlement/community?
7. When should a speech community split, merge, become dormant, or disappear?

## 9. Research cautions

- Do not equate language change with random mutation.
- Do not equate language evolution with inevitable simplification.
- Do not assume that contact mechanically causes a particular grammatical change.
- Do not apply every sound change instantly to every eligible word in every community.
- Do not assume a word has only one meaning at a time.
- Do not treat a written standard as the whole language.
- Do not mistake conventional historical period boundaries for abrupt system-wide transitions.
- Do not hardcode the Great Vowel Shift, Old English case loss, or SVO order as universal destinations for all simulated languages.

## 10. Sources and research trail

1. Marisa Lohr, **“From old English to modern English,”** The Open University, updated 1 March 2019.  
   https://www.open.edu/openlearn/history-the-arts/english-language/from-old-english-modern-english

2. Ans van Kemenade, **“History of the English Language,”** Oxford Research Encyclopedia of Linguistics, 28 August 2018.  
   https://academic.oup.com/edited-volume/61882/chapter-abstract/547702487

3. Markku Filppula and Juhani Klemola, **“External Influences in the History of English,”** Oxford Research Encyclopedia of Linguistics, 27 August 2020.  
   https://academic.oup.com/edited-volume/61882/chapter-abstract/547684022

4. Devyani Sharma, **“Sociolinguistic Sources of Change,”** *The New Cambridge History of the English Language*, Cambridge University Press, published online 8 March 2026.  
   https://www.cambridge.org/core/books/abs/new-cambridge-history-of-the-english-language/sociolinguistic-sources-of-change/338DDA5167C8ABAF6EA53B406B4A3743

5. Elżbieta Adamczyk, **“Historical Morphology,”** *The New Cambridge History of the English Language*, Cambridge University Press, published online 30 October 2025.  
   https://www.cambridge.org/core/books/abs/new-cambridge-history-of-the-english-language/historical-morphology/80CE78044593F2221C48FD5242545103

6. Bettelou Los, **“Historical Syntax,”** *The New Cambridge History of the English Language*, Cambridge University Press, published online 30 October 2025.  
   https://www.cambridge.org/core/books/abs/new-cambridge-history-of-the-english-language/historical-syntax/DEC2B852C8E73E59BB598581D5FF849F

7. Kathryn Allan, **“Historical Semantics,”** *The New Cambridge History of the English Language*, Cambridge University Press, published online 30 October 2025.  
   https://www.cambridge.org/core/books/abs/new-cambridge-history-of-the-english-language/historical-semantics/231816E693C61CB6E03DC2446E276D18

8. Laurel J. Brinton, **“The Development of Pragmatic Markers,”** *The New Cambridge History of the English Language*, Cambridge University Press, published online 23 October 2025.  
   https://www.cambridge.org/core/books/abs/new-cambridge-history-of-the-english-language/development-of-pragmatic-markers/C73DC1A024A7D46859C72A2E147F8F3C

9. Warren Maguire, **“The Traditional Dialects of England and the History of English,”** *The New Cambridge History of the English Language*, Cambridge University Press, published online 8 March 2026.  
   https://www.cambridge.org/core/books/abs/new-cambridge-history-of-the-english-language/traditional-dialects-of-england-and-the-history-of-english/640E97FD0603EF4EDB78DA0A80B19987

10. Terttu Nevalainen, **“Early Modern English,”** Oxford Research Encyclopedia of Linguistics, 22 August 2017.  
    https://academic.oup.com/edited-volume/61882/chapter/547677079

11. Donka Minkova, **“Historical Phonology,”** *The New Cambridge History of the English Language*, Cambridge University Press, published online 30 October 2025.  
    https://www.cambridge.org/core/books/abs/new-cambridge-history-of-the-english-language/historical-phonology/CFE20618B57F2C3F4AE8C6D3FD85B41F

12. William Labov, **“The Regularity of Regular Sound Change,”** Cambridge University Press, published online 1 January 2026.  
    https://www.cambridge.org/core/journals/language/article/abs/regularity-of-regular-sound-change/2DEADF07279768D6DCF60F1C86E5DAC2

## 11. Status

This is an initial research synthesis, not a settled theory or implementation contract. The next design decision is how to represent population-level variation and transmission in a computationally economical way. The first executable milestone should be a small change laboratory, not a wholesale rewrite of Cities Laboratory 2.12.
