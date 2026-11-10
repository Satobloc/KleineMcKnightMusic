# Future Suno Prompt Workbench — Design Seed

**Status:** design preparation only. This is not the current research workbench and does not implement the future user-facing prompt builder.

## The distinction

The repository's existing SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1 is the research and experiment environment. The future Suno Prompt Workbench is a separate creative construction tool that has not yet been built.

The future tool should not be a generic genre + mood + instrument form, a prompt-length optimizer, or an automatic prose-polisher. The existing prompt grammar, taste model, SONGPLAY material, GENRELAB, GENRE-LINGO and VOCALICS point toward a more generative, relational and event-based instrument.

## Working premise

Treat a prompt as a constructed musical situation or song-world, not merely a list of desired attributes.

The Workbench should help the user assemble interacting bodies, materials, registers, mechanisms, states, relations, events, and transformations, then serialize the construction into Suno-compatible fields while preserving productive ambiguity and rupture.

## Candidate construction layers

1. **World / invariant:** the global musical physics or identity that remains recognizable.
2. **Entities and materials:** genres, traditions, instruments, voices, physical objects, media, acoustic materials, cultural/social situations, invented concepts and impossible objects.
3. **Relations:** identity, containment, coexistence, sequence, dominance, contest, translation, infection, transfer, role swap, occupation, false reconciliation and boundary collapse.
4. **Engines and states:** rhythmic, harmonic, timbral, vocal, spatial, production and narrative processes.
5. **Events and triggers:** entrances, interruptions, conditional changes, random or periodic events, local overrides, collisions and mutations.
6. **Persistence and memory:** what continues, accumulates, returns, decays, toggles, transfers or remains as residue.
7. **Locality and scope:** which instruction applies globally, to a section, a voice, an instrument, a bar-range, a lyric anchor or one event.
8. **Rupture / contamination pass:** contradiction, overload, malformed syntax, role leakage, impossible combinations, false scope, broken wiring, dead remnants and deliberately unresolved boundaries.
9. **Serialization:** output separately for Style, Lyrics, Exclude, and any supported reference/variation workflow.

## Important behavior

- Preserve raw language and exact wording as first-class material.
- Do not silently normalize, repair, explain away or harmonize contradictions.
- Offer a warning or alternate interpretation without deleting the original.
- Allow multiple prompt constructions to coexist and compete.
- Support point-of-use definitions and local consequences.
- Keep lyric-eligible text distinct from style/arrangement instructions.
- Distinguish a semantic sound-world instruction from a token intended to be sung.
- Make scope and persistence explicit when helpful, but permit deliberately ambiguous scope.
- Preserve failures and unexpected outcomes as reusable evidence.
- Provide both a structured construction and a raw composition surface.

## Candidate operations drawn from existing research

- IDENTITY, CONTAINMENT, COEXISTENCE, SEQUENCE
- TRIGGER, PERSIST, ACCUMULATE, TOGGLE
- TRANSFER, SWAP, CLEAR, RESET, RETURN, VIOLATE
- BLEND, DOMINANCE, CONTEST, TRANSLATION
- OCCUPATION, INFECTION, ROLE_SWAP, GRAMMAR_TRANSFER
- FALSE_RECONCILIATION, BOUNDARY_COLLAPSE, MALFORMED_AGGLUTINATION

These are construction operators, not assumed literal instructions to Suno. Their utility must be evaluated by generated results.

## Material shelves the future tool should draw from

- Existing Prompt_Hopper, Genre_Hopper, Lyrics_Hopper, Structure_Hopper, Sample_Hopper and Grab_Bag.
- Existing Writing_Voice and VOCALICS material.
- Source-mining hoppers, after source review and claim triage.
- User's exact example prompts and preserved variants.
- Experiment ledger and model behavior registry.
- Audio-linked cases with model/version/settings and listening observations.

Raw or private personal materials must not be exposed in the public prompt-builder UI without deliberate review.

## Proposed workbench flow (not a fixed UI yet)

1. Begin with a tension, sound-world, process or unresolved collision.
2. Select, invent or import entities and materials.
3. Connect them using relation and transformation operators.
4. Establish global invariants and counterforces.
5. Add local events, triggers, anchors and persistence/termination behavior.
6. Run a deliberate rupture/contamination pass.
7. Produce one or more field-specific serializations.
8. Preserve the construction graph and every emitted prompt variant.
9. Link generated results back to the construction and record what actually happened.

## Evaluation criteria

A successful Workbench must increase expressive control without suppressing self-surprise. It should not optimize every prompt toward conventional coherence, generic polish or maximal literal adherence. Evaluate coherence, surprise, relational complexity, stylistic flattening, loss of distinctive material, and whether the result preserves the intended tension.

## Open design questions

- How much of the relational grammar should be visible versus implicit?
- Should entities and operators be draggable objects, structured text, graph nodes, or all three?
- How should event timing be expressed without overloading prompt length?
- How should the tool render deliberately ambiguous or malformed constructions?
- How will it distinguish a stable musical invariant from a temporary event?
- How will it preserve raw source prompts alongside structured interpretations?
- How should we show Suno's observed behavior without turning hypotheses into rules?
