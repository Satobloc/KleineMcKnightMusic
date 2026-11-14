# Language Gameplay Intent — Recovered Design Notes

**Status:** RECOVERED DESIGN INTENT / WORKING DIRECTION  
**Source:** User-provided conversation archive, reviewed 2026-11-14  
**Relationship:** Complements, but does not replace, the research and computational designs in `ENGLISH_LANGUAGE_CHANGE_RESEARCH.md`, `LANGUAGE_MODEL_DESIGN.md`, and `LANGUAGE_CHANGE_LAB_DESIGN.md`.

This note preserves the original player-facing intentions that motivated the language system. It records design aims, not implementation claims or fixed parameters.

## 1. The original conceit

The civilizations begin in a shared English-speaking world. The signature expression **“Well, fuck.”** is a common point of departure and a recurring cultural marker. As time passes, communities develop their own ways of saying things.

The phrase is not meant to be the whole language. It is a memorable tracer through which the player can notice that a community has changed. The player should be able to get a quick, approximate sense of a city's history or current circumstances from how its familiar expression has evolved.

A second founder phrase is **“The irony deepens.”** Preserve it as an additional founding expression alongside “Well, fuck.” It broadens the initial expressive material; it does not replace the signature phrase or imply that every community must retain or evolve both expressions.

The more recent decision to use broad contemporary informal, idiomatic English as the starting population refines this original idea: the signature phrase remains important, but the underlying linguistic material is open-ended and varied. The 36 proto-lexicon entries and 14 founder phrases are examples, not a closed inventory or protected layer.

## 2. Time and social divergence

- The original game concept imagined returns separated by roughly twenty years. Treat this as a pacing intuition, not a hard-coded calendar rule; the simulation's turn scale can be calibrated.
- Different settlements may be more or less isolated, have different cultures, and experience different histories.
- Nearby communities may remain mutually intelligible while more isolated populations diverge.
- A remote founding, migration, contact, or other social event may create new pathways of convergence or divergence.
- Different random seeds should yield different linguistic histories. The variation should arise from different events, choices, and social transmissions, not from arbitrary end-state language assignment.

## 3. Change must be bidirectional and plausible

Language must not be modeled as a one-way reduction machine. The original conversation explicitly corrected that tendency.

The system should allow, where linguistically motivated:

- Expansion and reduction.
- Strengthening and weakening.
- Substitution and reanalysis.
- Rearrangement and constructional change.
- Fusion, splitting, and recombination.
- New lexical and grammatical material.
- Semantic and pragmatic extension or narrowing.
- Persistence, coexistence, replacement, and loss.

Phonetic change should proceed through plausible articulatory and perceptual pathways, with traceable histories. Avoid a predetermined destination, pseudo-Latin drift, or arbitrary imports of European-looking forms. English history is evidence about possible mechanisms, not a script the future languages must follow.

## 4. Background evolution, foreground discovery

Most language evolution should occur in the background as communities live and interact. The player encounters its consequences through:

- Short descriptions of settlements and their histories.
- Overheard speech and recurring expressions.
- Inscriptions, labels, fragments, and other contextual text.
- Changes in familiar forms that reveal local history.
- Partial understanding, false friends, and misunderstandings.
- Comparisons between communities and across visits.

Language should be legible enough to reward attention, but not so transparent that every community is merely an English phrase with altered spelling.

## 5. Occasional communication gameplay

The original concept also included occasional moments when the player must respond to a community.

A possible interaction loop:

1. Present a contextual utterance or short text fragment grounded in an actual event or social situation.
2. Let the player infer its meaning from accumulated exposure, recognizable forms, context, and prior encounters.
3. Allow a response when the player's interpretation is sufficiently plausible.
4. Let misunderstanding or lack of comprehension have consequences. One early idea was that a player who cannot communicate may have to offer gifts or use another nonverbal route instead.
5. Record the encounter so future language exposure and player learning can matter.

This is a design possibility, not a requirement that every conversation become a puzzle. The system should not punish players constantly for failing to memorize vocabulary. Communication challenges should be occasional, contextual, and fair.

## 6. Tone

Sarcasm and black humor are part of the game's voice. They should emerge from the collision between civilization events, local history, and the ways communities talk about them. The signature phrase can be funny, but the language engine should not force every linguistic change to be a joke.

## 7. Relationship to the current implementation track

The current work remains the standalone, usage-driven Language Change Laboratory:

- Contemporary informal, idiomatic English is the starting population.
- The 36 initial lexicon entries and 14 founder phrases are illustrative only.
- Form–function variants compete through actual use, exposure, adoption, and social transmission.
- Annotation uncertainty is distinct from innovation and adoption.
- Phonological, lexical, semantic, pragmatic, morphological, and syntactic changes must remain distinguishable.
- Exact source attestations and annotation provenance belong in backend records, not in speaker memory or routine player-facing output.
- Calibration occurs in a standalone laboratory before integration into Cities Laboratory 2.12.

The laboratory is a means to build the underlying linguistic ecology. It is not the final player experience. Once the mechanisms are credible and inspectable, later work can connect them to event-grounded utterances, player comprehension, diplomacy, and civilization history.

---

**Interpretive rule:** Preserve the original playful conceit while allowing the language system to become more general and realistic than the first phrase-mutation prototype. Do not let the implementation of the memorable phrase constrain the language that grows around it.
