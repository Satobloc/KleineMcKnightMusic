# GENECLECT — Structural Taxonomy and Terminology Audit, Pass 03

**Mining date:** 2026-11-10  
**Parent source:** `Predict the Song Style`, conversation `6ad0cf68-eebc-83ea-9da8-4aa0b56bad53`  
**Scope:** U595–U600 and the assistant's subsequent structural taxonomy, pairings, lexicon, CSV construction, and Suno prompt.  
**Status:** source-derived reconstruction and structural QA completed; specialist source verification remains a separate task.

## 1. User's actual research brief

The source sequence gives a clear, staged specification:

- **U595:** a large GENECLECT-style catalogue of contemporary microgenres and traditional / regional music references.
- **U596:** select distinctive examples where musical structure differs from conventional Western music; do not prioritize microtonality.
- **U597:** narrow to traditions that are not primarily structured freeform; group the remainder by structural contrast, especially difficult-to-imagine combinations.
- **U598:** for each pairing, compile terminology, prioritizing native / milieu-specific terms; supplement with applicable musicological terms and adjacent culture-specific vocabulary; conduct thorough web research.
- **U599:** consolidate into a CSV with exactly three columns: `term`, `source`, and `category/basic description`, using compact one- or two-word descriptions.
- **U600:** turn the resulting material into a Suno prompt.

The CSV's `source` column is used as a tradition / cultural context label (for example, `Andean siku`), not as a bibliographic citation. Bibliographic sources were listed separately in the assistant's research response. This distinction should remain explicit.

## 2. Candidate selection lineage

### Initial structural survey

The assistant selected 15 examples, then produced a shortlist of seven. The 15 included:

1. Shona mbira interlocking patterns.
2. Balinese kotekan.
3. Andean siku hocketing.
4. Balkan aksak / additive meter.
5. Ainu upopo.
6. Finnic runosong.
7. Appalachian lined-out hymnody.
8. Gnaoua trance cycles.
9. A second, distinct explanation of Shona mbira's emergent rhythmic relationships.
10. North Indian raga development (alap → jor → jhala).
11. Persian radif / gusheh navigation.
12. Javanese pathet.
13. Sardinian cantu a tenòre.
14. Inuit katajjaq.
15. Cantonese muk'yu.

The initial survey duplicated Shona mbira as two separate entries (items 1 and 9). This is a distinction of analytical angle, not a second tradition.

### Narrowed retained set

The assistant then retained ten candidates with repeatable structural rules, identifiable roles, constrained rhythm, or prescribed procedures:

- Shona mbira
- Balinese kotekan
- Andean siku
- Ainu upopo
- Balkan aksak
- Finnic runosong
- Appalachian lined-out hymnody
- Sardinian cantu a tenòre
- Javanese pathet
- Cantonese muk'yu

It explicitly deprioritized or removed raga alap, Persian radif performance, taksim, more improvisational aspects of Gnaoua, katajjaq, and some forms of muk'yu. The rationale was not that these traditions lack structure, but that they were less aligned with the user's preference for repeatable, bounded structural mechanisms rather than structured freeform.

## 3. Five provisional structural pairings

These are the assistant's proposed compositional contrasts, not verified rankings of cultural incompatibility.

| Pair | Traditions | Proposed opposition |
|---|---|---|
| A | Balinese kotekan × Appalachian lined-out hymnody | Precisely coordinated, rapid complementary attacks versus elastic, collectively expanded vocal phrases |
| B | Andean siku × Shona mbira | Sequential melodic handoff versus simultaneous interlocking cycles |
| C | Balkan aksak × Ainu upopo | Unequal rhythmic grouping versus overlapping repeated vocal cycles |
| D | Finnic runosong × Sardinian cantu a tenòre | Formulaic narrative / poetic progression versus specialized simultaneous vocal roles |
| E | Javanese pathet × Cantonese muk'yu | Modal / melodic constraints versus narrative-language organization |

The original assistant ranked A as the largest contrast, followed by B, E, C, and D. That ranking is a creative hypothesis, not an ethnomusicological result. It needs to be tested through operational descriptions of each tradition and by separating the musical parameters being compared.

## 4. Important refinements already present in the source

The later lexicon explicitly corrects some earlier schematic descriptions:

- **Ainu upopo:** the source says documented examples can have relatively fixed melodies and little improvisation. The description should not be reduced to an unrestricted, generic overlapping vocal canon. The specific term `ukouk` is listed for an overlapping-round structure.
- **Cantonese muk'yu:** the source describes the original form as free-tempo singing without instrumental accompaniment, with prescribed melodic modes and specific ending pitches in a four-line poetic structure. It cautions against the simplistic claim that speech tones directly generate every note.
- **Javanese pathet:** the source states that pathet is not merely a set of six scales; its behavior involves melodic tendencies, characteristic cadences, and relationships between sections and performance context.
- **Andean siku:** `hocket` is identified as an analytical musicological term for the alternating distribution of notes, not as a native Quechua term for the practice.
- **Balinese kotekan:** `kotekan` is a culturally specific practice with repertoire and technique distinctions; it should not be treated as interchangeable with the broader analytical concept of hocket.
- **Appalachian lined-out hymnody:** the source distinguishes Old Regular Baptist practice from related but non-identical Primitive Baptist and shape-note traditions.

These refinements should take precedence over the earlier simplified pair descriptions.

## 5. Terminology corpus recovered and checked

The assistant's original response contains a complete 304-entry, three-column terminology corpus. I reconstructed its CSV data block from the conversation export and ran basic structural QA:

| Check | Result |
|---|---:|
| Data entries (excluding header) | 304 |
| Total rows including header | 305 |
| Expected columns | 3 |
| Rows with exactly 3 columns | 305 |
| Empty cells | 0 |
| Exact duplicate rows | 0 |
| Repeated term strings across contexts | 2 |

The two repeated term strings are intentional cross-context entries:

- `free rhythm`: Appalachian lined-out hymnody; Cantonese muk jyu.
- `oral transmission`: Finnic oral poetry; Cantonese narrative singing.

No rows were silently deduplicated. Repeated terminology across traditions may represent useful overlap, but the context column must remain attached.

### Corpus limitations

1. The CSV is a working lexicon, not a verified dictionary.
2. The `source` column identifies tradition / context, not the bibliographic source.
3. Some source labels have different levels of granularity (for example, `Andean`, `Andean siku`, and `Andean huayno`).
4. Some entries are native or milieu-specific terms; others are analytical musicology terms or adjacent cultural vocabulary. The companion lexicon distinguishes these classes, but the compact CSV does not include a separate evidence-class field.
5. Some spellings, transliterations, and semantic glosses remain candidates for specialist checking.
6. The original bibliography used turn-local web citations. Its source names are preserved in the original conversation, but those old references should be re-resolved before the corpus is described as independently verified.

## 6. Cross-tradition operations and the prompt translation

The original assistant extracted a cross-corpus vocabulary of operations such as:

- divide a musical line between performers;
- interweave independent patterns;
- repeat phrases at staggered entry points;
- combine unequal rhythmic units;
- expand a phrase collectively;
- build music from repeated verbal material;
- separate lead and supporting vocal functions;
- elaborate a skeletal melody;
- establish phrase destinations;
- let language influence melodic delivery.

The Suno prompt then attempted to combine kotekan, siku, mbira, lined-out hymnody, aksak, and runosong into a single structural collision. Its central idea was that no instrument owns the complete melody; each contributes a fragment, and the composite line emerges through interaction. It also specified familiar tuning and placed the novelty in rhythm, orchestration, and interdependence rather than microtonality.

This is a useful conceptual translation, but it should not be mistaken for an authentic representation of any of the named traditions. The prompt is a creative hybrid and needs audio testing.

## 7. Research-source and provenance status

The original lexicon names useful source families and references, including:

- Edward Herbst's Balinese terminology glossary;
- Peterman's work on kotekan in Shona mbira music;
- MBIRA material on mbira singing;
- Ohio State's Andean music teacher guide;
- Ainu National Museum language material and Endō's Ainu music terminology work;
- Smithsonian Folkways material on Old Regular Baptist hymnody;
- scholarship on long-form non-isochronous meters;
- Saarinen on Finnic poetic parallelism;
- Sardinian cantu a tenore documentation and UNESCO material;
- a Liverpool repository dissertation on Cantonese narrative singing;
- Javanese gamelan terminology glossaries.

These are source leads preserved from the earlier research. Their exact URLs, editions, claims, and term-level support must be checked again before external publication or strong factual claims. No fresh web verification is claimed in this pass.

## 8. Next work queue

1. Preserve the reconstructed 304-entry CSV as a research artifact without moving it into the user's creative hoppers.
2. Create a companion source/evidence ledger that maps each term to a bibliographic source, native / analytical / adjacent classification, confidence, and verification status.
3. Verify the five pairings at the level of specific performance practice, not broad national or genre labels.
4. Revisit the proposed incompatibility ranking after the structural variables have been operationalized.
5. Translate the five pairings into promptable operations without falsely presenting the resulting hybrid as an authentic tradition.
6. Retrieve the original Suno prompt and outputs from U600 and map them to an experiment record. The source export's current user-message summary ends at the prompt request; this pass does not claim to have inspected a generated result.

## 9. Evidence labels

- **User research specification:** what the user explicitly asked for in U596–U600.
- **Source-derived assistant output:** the prior candidate list, pairings, terminology lexicon, CSV, and prompt.
- **Structural QA:** direct counts and checks performed on the recovered CSV text.
- **Research lead:** bibliography named in the original response but not re-verified here.
- **Creative hypothesis:** the proposed incompatibility ranking and structural collision prompt.
- **Unresolved:** term provenance, source-level support, tradition-specific variation, and actual Suno output behavior.
