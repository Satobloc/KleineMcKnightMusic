# Language Change Laboratory — Minimal Population Model

**Design ID:** WF-LANG-LAB-001  
**Version:** 0.1  
**Status:** WORKING MODEL / READY FOR PROTOTYPE IMPLEMENTATION  
**Date:** 2026-11-14  
**Parent operation:** WF-LANG-002  
**Baseline:** Cities Laboratory 2.12 (preserved; this laboratory is separate from the browser simulation)

## 1. Purpose and scope

Build a small, reproducible laboratory to test whether contemporary informal English expressions can undergo recognizable, usage-driven change through speaker variation and social transmission.

This is a calibration experiment, not yet a complete language engine and not a claim to model all of English. It must be small enough to inspect, but rich enough to produce competing variants, local conventions, diffusion, and loss.

**Starting condition:** broad contemporary informal, idiomatic English. Do not split the initial population into late-twentieth-century and early-twenty-first-century cohorts. Treat exact source attestations, source identifiers, retrieval details, and annotation histories as backend provenance/logging data, not as a temporal taxonomy or visible language-memory burden.

## 2. Model in one sentence

A population of speakers repeatedly expresses communicative functions using variants they have encountered; variants compete through usage, social exposure, and speaker preferences, while occasional constrained innovations create alternatives that may spread, stabilize, remain local, or disappear.

The unit of change is not an arbitrary mutated sentence. It is a **form–function variant**: a surface expression linked to a provisional interpretation, constructional pattern, and usage context.

## 3. Separation of layers

Keep five layers distinct:

1. **Attestation:** the exact source utterance, stored with its source provenance in backend records.
2. **Analysis:** tokenization, candidate lemmas/POS/senses, multiword spans, construction hypotheses, confidence, and annotation provenance. Multiple analyses may coexist.
3. **Variant:** a form linked to a communicative function or construction, with a usage history and competing alternatives.
4. **Speaker repertoire:** the variants an individual speaker knows, their exposure history, preferences, and usage counts.
5. **Community convention:** aggregate variant frequencies and social distribution, not a centrally assigned canonical grammar.

Attestations are immutable. Analyses may be revised. Variants may change through use. A community convention is an observed population-level outcome, never an annotation field.

## 4. Minimal population

Initial calibration settings (provisional; vary in sensitivity tests):

| Parameter | Initial value | Purpose |
|---|---:|---|
| Speakers | 48 | Enough agents for local variation without expensive simulation |
| Communities | 3 | Permit comparison of local convention and between-group diffusion |
| Speakers per community | 16 | Equal initial population for controlled comparison |
| Initial source items | 600 | Bounded working sample, not the whole corpus |
| Initial repertoire | 30 items per speaker | Heterogeneous exposure |
| Interaction events | 12,000 | Several hundred events per speaker on average |
| Innovation probability | 0.004 per eligible use | Rare starting hypothesis, not a natural-language estimate |
| Cross-community contact | 0.08 per interaction | Allows limited diffusion; sensitivity-test 0–0.25 |
| Memory capacity | 80 variants per speaker | Controls repertoire size and forgetting pressure |
| Replicate seeds | 5 minimum | Separate structural effects from one lucky trajectory |

The active corpus sample is frozen for each run. Replenishment creates a new sample manifest and a new experiment; it never mutates a run already underway.

## 5. Speaker and variant state

### Speaker
- stable speaker ID and community ID;
- repertoire: variant IDs and locally estimated usage weights;
- exposure counts by source speaker/community;
- optional social-preference parameters (in-group affinity, novelty tolerance), initialized from explicit experimental distributions rather than inferred demographic identities;
- recent interaction history, bounded by a short memory window.

### Variant
- stable variant ID and parent/lineage IDs;
- surface form and token sequence;
- linked function/construction hypothesis;
- candidate lexical and grammatical analyses, each with confidence and provenance;
- usage counts by speaker and community;
- first-observed and most-recent event IDs;
- transformation type and parameters, if innovated;
- status: active, rare, or lost in a particular population (never globally deleted from the experiment log).

A variant may have several candidate analyses. No single POS assignment is required for admission. An annotation disagreement is not itself a linguistic innovation.

## 6. Interaction cycle

For each event:

1. Select a speaker and a communicative function from the experiment's function schedule.
2. Determine the speaker's eligible repertoire for that function.
3. Select a variant using a transparent competition rule combining:
   - the speaker's own recent usage;
   - variants heard from interaction partners;
   - community frequency;
   - a modest preference for familiar forms;
   - optional prestige/in-group bias as a separately switchable factor.
4. Record the utterance event and the listener's exposure.
5. With low probability, create an innovative candidate from the selected variant.
6. Test the candidate against form and function constraints. Reject malformed or functionally unlinked outputs; do not silently repair them.
7. If accepted, add it to the innovator's repertoire as a low-frequency alternative.
8. Future interactions determine whether it spreads, stabilizes, remains local, or disappears.

**Adoption is not instantaneous.** Hearing a form creates exposure; using it creates adoption evidence. A variant becomes a community convention only through accumulated usage across speakers.

## 7. First innovation operators

Start with three operators, each independently switchable and logged:

1. **Reduction / phonetic erosion:** shorten or weaken a frequent sequence while preserving its linked function. In the first prototype this may operate on an abstract pronunciation/token representation; orthographic spelling changes must not be mistaken for sound change.
2. **Analogy / constructional extension:** reuse a productive pattern in a new lexical or contextual slot. The output must retain a valid constructional frame.
3. **Semantic-pragmatic reanalysis:** a form used in a recurring context acquires an additional candidate function or stance. Preserve the old function; create a competing analysis rather than overwriting it.

Defer free synonym replacement, arbitrary word shuffling, and unconstrained phrase mutation. Borrowing can be added after cross-community exposure is measured. Lexical innovation, sound change, morphological reanalysis, and syntax change should remain distinguishable operators in later experiments.

## 8. Acquisition and annotation for the first run

Use a legally clear, manageable corpus sample before expanding to noisier sources.

**Candidate baseline:** MASC 3.0.0 / OANC. MASC is a roughly 500,000-word contemporary American English subset spanning 19 genres, including spoken, email, blog, jokes, fiction, movie script, and Twitter material. It has manually produced or validated sentence, token, lemma/POS, and syntactic annotations for substantial portions. The corpus is available for broad reuse under the stated CC BY 3.0 US terms; retain attribution and verify the precise package/license accompanying the downloaded release.

For the first sample:
- draw from informal-friendly genres where available (spoken, blog, email, jokes, fiction, movie script, Twitter);
- retain genre/source labels for stratification and analysis, not as a historical split;
- use the corpus annotations as candidate analyses, not infallible truth;
- preserve exact source attestations and their IDs in backend logs;
- normalize only into a separate analysis copy;
- keep ambiguous, fragmentary, colloquial, and multiword forms rather than filtering everything toward edited prose.

MASC is not a perfect sample of casual conversation. It is a reproducible open baseline. A later parallel run can add OpenSub-Slang (7,488 slang-use examples extracted from movie subtitles) after verifying the dataset's current license and package terms. Do not scrape Urban Dictionary or social platforms for this experiment.

## 9. Sampling design

Use stratified sampling over available MASC informal-friendly genres, with a cap per source document so a few long texts cannot dominate. If a selected genre is unavailable or too small, record the shortfall and redistribute only according to a declared fallback rule.

Store a compact manifest containing:
- corpus release and package identifier;
- license/attribution record;
- selected genres and document IDs;
- source item count and extraction version;
- deduplication rules and counts;
- sample seed and selected record IDs;
- annotation package/version;
- code commit and experiment parameters.

The raw attestation text remains in the backend corpus/provenance store. The simulation-facing record should use stable IDs and only the extracted features needed by the model.

## 10. Experiment sequence

### E0 — Ingestion and analysis smoke test
- Extract a 600-item stratified sample.
- Measure sentence length, tokenization coverage, candidate POS coverage, multiword-span coverage, duplicates, and source skew.
- Inspect a random 50-item sample manually.
- Confirm that raw attestations remain recoverable by ID but are not copied into speaker state.

### E1 — No-innovation transmission baseline
- 48 speakers, 3 communities, 12,000 interactions.
- Innovation disabled.
- Establish how much variant frequency changes through sampling and transmission alone.
- Confirm that no new form is created.

### E2 — Innovation and diffusion
- Enable the three operators at the provisional rate.
- Track innovations, adoption, spread, local persistence, and loss.
- Compare no cross-community contact with the baseline contact rate.

### E3 — Mechanism ablation
Compare:
- frequency-only transmission;
- frequency + in-group preference;
- frequency + novelty preference;
- frequency + cross-community contact;
- each innovation operator alone and in combination.

### E4 — Replication and sensitivity
Run at least five seeds. Sweep innovation probability, contact rate, memory capacity, and population size one dimension at a time before testing interactions.

## 11. Measurements

Report raw counts and distributions; do not collapse everything into one “language evolution score.”

- **Variant diversity:** active variants per function and per community.
- **Concentration:** frequency distribution / entropy of competing variants.
- **Innovation survival:** proportion of innovations still used after fixed intervals.
- **Adoption breadth:** number and proportion of speakers using each variant.
- **Diffusion:** time and path by which a variant crosses speaker/community boundaries.
- **Locality:** degree to which variants remain community-specific.
- **Loss:** variants that fall below the defined activity threshold.
- **Turnover:** rate of variant creation and disappearance.
- **Functional integrity:** proportion of generated uses retaining a linked communicative function.
- **Analysis uncertainty:** proportion of tokens/spans with multiple viable analyses; disagreement between source annotation and contextual hypothesis.
- **Source skew:** contribution by genre, document, and source.

Inspect trajectories, not only final snapshots.

## 12. Controls and falsification checks

- Same seed + same manifest + same parameters must reproduce the same result.
- Different seeds should be capable of producing different trajectories.
- Reordering UI inspection or notebook queries must not alter the experiment.
- With innovation disabled, the number of distinct surface variants must not increase.
- With cross-community contact set to zero, no new variant may diffuse between communities except through an explicitly documented shared founder state.
- A variant cannot count as adopted merely because it was observed once.
- Annotation errors alone cannot create variants or community change.
- Every innovation must have a parent, operator, parameter record, and function link.
- Every claimed loss must be based on the declared observation window and threshold.
- The 2.12 browser simulation remains untouched during laboratory calibration.

## 13. Decision gates after the first run

The first run is exploratory. It should answer:
1. Does the model generate competing variants without uncontrolled explosion?
2. Do rare innovations sometimes spread and sometimes disappear?
3. Does contact produce measurable diffusion without erasing local variation immediately?
4. Are the outputs interpretable from event histories?
5. Are results robust across seeds?
6. Does the source sample supply enough informal and constructionally diverse material?

If the answer to any is no, revise the mechanism before increasing population size or connecting it to the cave simulation.

## 14. Explicit non-goals for v0.1

- Reproducing the full history of English.
- Assigning every word one correct POS tag.
- Inferring speaker demographics or social identity from utterance text.
- Treating dictionary labels as authoritative context labels.
- Automatically converting source sentences into canonical community phrases.
- Integrating the model into Cities Laboratory 2.12.
- Scraping restricted or platform-hosted material.
- Adding the entire historical English chronology as a model dimension.

## 15. Source notes

- Open American National Corpus, OANC and MASC overview: https://anc.org/data/oanc/ and https://anc.org/data/masc/
- MASC data and annotation downloads: https://anc.org/data/masc/downloads/data-download/
- MASC availability and license information: https://anc.org/data/masc/about/
- OpenSub-Slang dataset description: https://www.cs.utoronto.ca/~yangxu/data.html
- Sun et al. (2024), *Toward Informal Language Processing: Knowledge of Slang in Large Language Models*, NAACL 2024.

---
**Current disposition:** The model and experiment sequence are specified at a level suitable for a small standalone prototype. Corpus acquisition, executable implementation, and empirical results remain pending.