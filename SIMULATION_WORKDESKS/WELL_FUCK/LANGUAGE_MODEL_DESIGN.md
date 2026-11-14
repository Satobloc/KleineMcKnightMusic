# Productive Language Model — Working Design

**Design ID:** WF-LANG-DESIGN-001  
**Version:** 0.3  
**Status:** PROPOSAL / REVIEWABLE, NOT YET AN IMPLEMENTATION CONTRACT  
**Target baseline:** Cities Laboratory 2.12  
**Research foundation:** ENGLISH_LANGUAGE_CHANGE_RESEARCH.md  
**Phase:** 3 — Productive language core  
**Purpose:** Move from evolving fixed expressions toward communities that can form new, compositional utterances.

## 1. Design objective

Retain the useful foundations of Language Kernel 0.1—IPA-segmented forms, sound-change histories, phrase lineage, lexicon inheritance, and settlement-linked speech communities—while adding a meaning layer and productive language mechanisms.

The goal is not to bolt a miniature English grammar onto the simulation. Communities should be able to express useful meanings in different ways, with their own lexical choices and grammatical profiles. The system should remain small enough to inspect, deterministic enough to test, and expressive enough to generate recognizable social language.

This document is a proposal for discussion and staged implementation. It does not authorize a wholesale rewrite of 2.12.

## 2. Design constraints and guardrails

**Research-first amendment (2026-11-14):** Historical English is now the first empirical case study for designing realistic language-change mechanisms. Read ENGLISH_LANGUAGE_CHANGE_RESEARCH.md before treating this proposal as an implementation plan. The goal is not to copy English's historical trajectory into every community. The 36 existing proto-lexicon entries and 14 founder phrases are examples of initial material, not a closed inventory, protected layer, or limit on future expression. They may survive, change, acquire new functions, be replaced, or disappear. New lexical and grammatical material must be able to arise through multiple mechanisms. The prior suggestion that these entries should necessarily be retained as a separate discourse/idiom layer is withdrawn.

1. **Meaning is independent of wording.** Represent an intended message before selecting words or arranging them.
2. **IPA remains authoritative.** Phoneme sequences are token arrays; orthography is a projection, not the underlying sound system.
3. **Community variation is real state.** A community may have its own lexicon, phonology, and selected grammar parameters.
4. **Preserve the phrase kernel.** Founder phrases and their histories remain as idioms, fossils, or formulaic expressions. Productive language grows alongside them.
5. **Event grounding comes before decorative context.** Contextual speech should be generated from actual simulation events or explicit speaker intentions.
6. **Stochasticity remains inspectable.** Seeded language generation must be reproducible. UI observation uses its own presentation RNG and must not steer simulation evolution.
7. **Incremental complexity.** Begin with a small, coherent grammar. Add typological variation only when a test or experiment can demonstrate its value.
8. **No premature realism claims.** The system is an expressive simulation model, not a claim to reproduce the full complexity of natural language evolution.

## 3. Proposed architecture

A generated utterance should pass through a traceable pipeline:

\`simulation event or speaker intention → message frame → lexical selection → morphology → syntax → phonological realization → orthography\`

Each stage should preserve enough information for the Phrase Field Notebook to show what the speaker intended, how the community encoded it, and how it sounded.

### 3.1 Message frame

Represent the intended meaning as a structured object rather than a gloss string. A first version can use:

- **speech act:** report, warning, request, command, offer, refusal, greeting;
- **predicate:** the action, state, or event being communicated;
- **roles:** agent, patient/theme, location, recipient, experiencer, or other relevant participants;
- **polarity:** positive or negative;
- **time/aspect:** current, completed, ongoing, imminent, habitual;
- **modality/urgency:** certainty, possibility, obligation, urgency;
- **context:** event ID, place, participants, and relevant shared knowledge.

Illustrative frame, not a committed schema:

\`\`\`json
{
  "speech_act": "warning",
  "predicate": "collapse",
  "roles": {
    "location": "nearby",
    "patient": "shelter",
    "affected_group": "us"
  },
  "polarity": "positive",
  "time": "imminent",
  "urgency": "high"
}
\`\`\`

The first implementation should support only the fields needed by its initial event set. Avoid building an elaborate ontology before the simulation can use it.

### 3.2 Concept inventory

Create stable concept IDs that are independent of English labels and community word forms. Start with a compact inventory in domains that matter to underground life:

| Domain | Candidate concepts |
|---|---|
| Terrain and material | rock, opening, wall, floor, tunnel, depth, stable, loose |
| Water | water, flow, pool, wet, dry, flood |
| Ecology and resources | food, growth, green, dead, light, dark, heat |
| Shelter and settlement | shelter, building, home, group, neighbor, outsider, path |
| Movement and events | move, enter, leave, fall, crack, build, find, lose |
| Social exchange | give, take, want, help, share, refuse |
| Qualities and relations | safe, dangerous, near, far, many, few, here, there |
| Discourse | I, we, you, now, before, not, yes, no |

These are candidates, not a finalized list. The initial concept set should be small enough that every concept can be exercised by an event or interaction.

### 3.3 Lexicon

A lexeme should map one or more concept IDs to a community-specific form. Proposed fields:

- stable lexeme ID;
- one or more concept/sense IDs;
- IPA token array;
- orthographic form or derivation rule;
- lexical class;
- argument/valency information where relevant;
- grammatical features;
- origin and derivation history;
- frequency or usage weight;
- register or pragmatic restrictions when useful.

This separates a concept from the word a community uses for it. It also permits synonyms, polysemy, semantic drift, compounding, and borrowing without rewriting a gloss string and pretending that the meaning model changed with it.

### 3.4 Phonology and word formation

Retain IPA token arrays and the existing regular sound-law mechanism. Add explicit phonotactic constraints and a syllable/word generator so new lexemes are well-formed under a community's phonology.

The first pass should decide:

- phoneme inventory and permitted segments;
- syllable shapes and consonant-cluster constraints;
- stress or prominence, if needed;
- whether compounds are concatenated, fused, or marked;
- how new roots are generated and how existing roots are reused.

Do not add every possible phonological parameter at once. The existing sound laws are a useful start; their ordering, conditioning, and application to derived forms should be covered by tests.

### 3.5 Morphology

Begin with a few high-value grammatical distinctions rather than a full paradigm:

- plural or collective marking;
- negation;
- a small set of time/aspect distinctions;
- possession or relational marking if the first event set needs it.

The implementation should allow more than one strategy: a separate particle, an affix, a stem change, or no overt marking. Which strategies communities use is an open design decision.

Derivation and compounding should also allow communities to create new words from known concepts and roots.

### 3.6 Syntax

Use a compact clause grammar with a community-level profile. A first profile might include:

- default constituent order (for example SOV, SVO, or VSO);
- whether roles are marked by position, particles, or morphology;
- default placement of negation;
- basic question/command patterns.

Do not assume English word order or require every language to use the same surface sequence. Keep the first grammar small and deterministic; richer variation can emerge through rare, explicit change operations later.

### 3.7 Realization and observation

The generator should return both the surface utterance and its derivation trace:

- intended message frame;
- selected lexemes and senses;
- morpheme sequence and grammatical features;
- constituent structure or ordering decisions;
- IPA token sequence;
- orthographic rendering;
- literal gloss and naturalized working translation;
- community and turn provenance.

The Notebook should be able to show a phrase without losing the meaning that produced it.

## 4. First productive-language milestone

A deliberately modest first milestone could support:

- a compact concept inventory grounded in the current simulation;
- lexical items for entities, actions, qualities, relations, and discourse;
- a small number of event/message frames;
- one or two productive word-formation processes;
- a few grammatical distinctions;
- a community grammar profile with a small number of stable parameters;
- generation of novel clauses from message frames;
- a traceable IPA and gloss display.

The milestone is complete when the simulation can generate new, compositional utterances that are not merely selected or mutated founder phrases, and the intended meaning can be inspected.

## 5. Evolution path

Keep the following mechanisms distinct so they can be tested and added incrementally:

1. **Lexical change:** new roots, semantic extension, synonym competition, loss, compounding.
2. **Phonological change:** regular sound laws operating on phoneme sequences.
3. **Morphological change:** affix creation, fusion, erosion, reanalysis, and grammaticalization.
4. **Syntactic change:** shifts in ordering and role-marking strategies.
5. **Pragmatic change:** conventionalized speech acts, politeness, emphasis, taboo, and idioms.
6. **Social transmission:** inheritance, contact, borrowing, convergence, divergence, and intelligibility.

The current phrase-level mutation system can remain active as one source of idioms and formulaic expressions. It should not be mistaken for the entire language-evolution engine.

## 6. Testing requirements

A productive-language increment should be testable against at least these properties:

- fixed seed and fixed event sequence reproduce the same output;
- changing the UI observation sequence does not change simulation language;
- every generated lexeme maps to a concept or documented derivation;
- every generated utterance retains its intended message frame;
- all IPA segments are valid members of the community inventory;
- generated words satisfy the community's phonotactic constraints;
- morphology and syntax produce valid structures;
- a simple parser or trace can recover the intended roles and predicate;
- sound changes preserve valid segment sequences or explicitly record a permitted exception;
- community inheritance copies the intended state without accidental shared mutable objects.

## 7. Open design decisions

These questions should be answered after the first data-model sketch and a small worked example, not all at once:

1. How many concepts are required for the first meaningful simulation interactions?
2. Which grammatical distinctions are essential for the first utterances?
3. How much grammar varies by community at the outset, and how much changes over time?
4. Should communities eventually receive independent language RNG substreams, or is one language stream sufficient once UI sampling is isolated?
5. What is the simplest useful word-generation mechanism: root invention, derivation from existing forms, compounding, or a mixture?
6. How should the system represent synonyms, polysemy, metaphor, and semantic drift?
7. When should the event model begin producing actual speaker intentions rather than just event labels?

## 8. Proposed implementation sequence

1. Agree on the minimal message-frame schema and first concept domains.
2. Define the lexeme and community grammar-profile data structures.
3. Add phonotactic validation and a small word-form generator.
4. Add lexical selection for a handful of concepts and predicates.
5. Add a minimal morphology and clause-order system.
6. Generate and inspect novel utterances from hand-authored test frames.
7. Connect those frames to actual simulation events.
8. Add social transmission and richer linguistic evolution only after the productive core works.

## 9. Status and amendment rule

This is a working proposal, not an approved specification. Nathan's feedback may change the concept inventory, grammar approach, data structures, or implementation order. Once a minimal model is accepted, record it as a dated decision and update this document's version. Do not let this proposal silently become a code contract.


## 10. Worked message-frame examples

These examples exercise the proposed architecture without inventing community word forms prematurely. Lexeme IDs and morphemes are placeholders; the actual IPA forms should come from the community phonology and lexicon.

### Example A — Warn that a nearby shelter is about to collapse

**Simulation event:** a collapse-risk or collapse event affects a building near the speaker's settlement.

**Communicative intent:** warn nearby community members.

**Illustrative message frame:**

```json
{
  "id": "frame:warning:001",
  "speech_act": "warning",
  "predicate": "event.collapse",
  "arguments": [
    {
      "role": "theme",
      "concept_id": "entity.shelter",
      "referent_id": "building:17"
    },
    {
      "role": "location",
      "relation": "near_speaker",
      "referent_id": "place:nearby"
    }
  ],
  "features": {
    "polarity": "positive",
    "time": "imminent",
    "urgency": "high"
  },
  "provenance": {
    "source": "simulation_event",
    "event_id": "collapse-risk:17",
    "turn": 234
  }
}
```

**Lexicalization slots:** `entity.shelter`, `event.collapse`, a near-speaker relation, and an imminent/aspect marker.

**Illustrative grammar profile:** SOV-like clause order, locative particle after the location phrase, imminent marker after the predicate. This is an example profile only, not the default for every community.

**Schematic realization:** `[SHELTER] [NEAR] [COLLAPSE] [IMMINENT]`

The realization trace should retain the original frame, selected lexeme IDs, morpheme IDs, final IPA token array, orthography, and gloss. A different community may order or mark these same roles differently while preserving the same message frame.

### Example B — Report that the group found water here

**Simulation event:** a community member discovers a water source.

**Communicative intent:** report the discovery to the group.

**Illustrative message frame:**

```json
{
  "id": "frame:report:002",
  "speech_act": "report",
  "predicate": "event.find",
  "arguments": [
    {
      "role": "agent",
      "concept_id": "entity.group",
      "referent_id": "community:1"
    },
    {
      "role": "theme",
      "concept_id": "entity.water",
      "referent_id": "water-source:9"
    },
    {
      "role": "location",
      "concept_id": "deictic.here",
      "referent_id": "place:current"
    }
  ],
  "features": {
    "polarity": "positive",
    "time": "completed"
  },
  "provenance": {
    "source": "simulation_event",
    "event_id": "discovery:9",
    "turn": 241
  }
}
```

**Lexicalization slots:** group/we, water, find, here, and a completed/past marker if the community marks it.

**Schematic SOV realization:** `[WE] [WATER] [FIND] [COMPLETED] [HERE]`

Again, these are structural slots, not proposed IPA forms.

## 11. First concept inventory — candidate set

The current 36-entry `PROTO_LEXICON` is largely English-derived phrase material: pronouns, function words, expletives, evaluatives, and idiom components. It does not contain a useful core vocabulary for rock, water, shelter, food, movement, or cavern events. It should not be treated as the complete semantic lexicon.

**Recommended direction:** preserve the current phrase stock as a formulaic/discourse layer, map its entries to concept IDs where that is meaningful, and build a separate concept-driven lexicon for the simulated world. This preserves the project's original “Well, fuck.” lineage without forcing every new environmental word to descend from English expletives.

A first candidate concept set:

| Domain | Candidate concept IDs |
|---|---|
| Entities | `entity.person`, `entity.group`, `entity.outsider`, `entity.shelter`, `entity.rock`, `entity.water`, `entity.food`, `entity.tunnel`, `entity.path`, `entity.light`, `entity.dark` |
| Events and actions | `event.collapse`, `event.crack`, `event.flow`, `event.build`, `event.enter`, `event.leave`, `event.find`, `event.lose`, `event.give`, `event.take`, `event.help`, `event.want` |
| Qualities and relations | `property.safe`, `property.dangerous`, `relation.near`, `relation.far`, `deictic.here`, `deictic.there`, `time.now`, `time.soon`, `polarity.not`, `quantity.many` |

This is a candidate inventory, not a final ontology. Concepts should be retained only when they can be used in an event, interaction, or meaningful utterance.

## 12. Proposed minimum viable grammar profile

The first productive-language milestone should not attempt to model every natural-language distinction. A small community profile could expose only:

- **Clause order:** SOV, SVO, or VSO.
- **Role marking:** primarily position, a separate particle, or a case-like affix.
- **Negation:** a separate particle or an affix.
- **Time/aspect:** no marking, a separate particle, or an affix.
- **Number/collective:** no marking, a plural/collective particle, or an affix.

A community receives a stable initial profile from its seed. Changes should be rare, recorded, and testable. Do not independently randomize every parameter every turn; that would produce noise rather than a recognizable language.

For the first generator, three speech acts (report, warning, request) and a small number of event predicates are likely enough. The exact count should be set after selecting the first event set.

## 13. Separation of event, intention, and utterance

Keep three objects distinct:

1. **Simulation event:** what happened in the world.
2. **Communicative intent:** whether a speaker chooses to tell someone, warn them, request something, or remain silent.
3. **Message frame / utterance:** the intended content and the language-specific realization.

An event should not automatically become speech. This separation leaves room for attention, knowledge, audience, urgency, social relationship, and pragmatic choice later, without forcing those systems into the first lexical/grammar implementation.


## 14. Research-first direction

The design must now be grounded in a model of socially transmitted variation and change. Do not implement phrase mutations as the primary engine of language evolution. Phrase-level change remains a possible mechanism for particular expressions, but the language model must account for change in pronunciation, morphology, syntax, lexicon, semantics, pragmatics, and the social distribution of language.

The first design deliverable is a computationally economical representation of competing variants, use, exposure, adoption, and diffusion. See ENGLISH_LANGUAGE_CHANGE_RESEARCH.md for the current synthesis and proposed calibration experiments.
