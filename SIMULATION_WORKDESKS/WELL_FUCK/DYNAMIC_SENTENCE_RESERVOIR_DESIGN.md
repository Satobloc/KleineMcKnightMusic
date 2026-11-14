# Dynamic Sentence and Expression Reservoir — Research Design

**Design ID:** WF-LANG-DATA-001  
**Version:** 0.1  
**Status:** RESEARCH PROPOSAL / NOT AN IMPLEMENTATION CONTRACT  
**Date:** 2026-11-14  
**Parent operation:** WF-LANG-002  
**Starting population:** Contemporary informal, idiomatic English

## 1. Purpose

Supply the language simulation with a changing but bounded sample of attested contemporary English utterances and expressions. The reservoir is an acquisition and provenance layer, not the simulation's active language population and not a permanent phrasebook.

The project should not attempt to store or process every available sentence. It should acquire eligible material, normalize and annotate it, and expose a controlled working sample to the simulation.

## 2. Core design principle: source material is evidence, not grammar

A source sentence is an attestation of somebody's language use in a particular context, not a complete grammatical specification. The system must preserve the original string and its source metadata while allowing multiple imperfect analyses.

Do not force a single part-of-speech label onto every token. Store candidate analyses, contextual evidence, confidence, and annotation provenance. Multiword expressions, discourse markers, contractions, ellipsis, code-switching, nonstandard spelling, and syntactic fragments must remain representable.

A dictionary lookup may enrich a token or phrase, but must not overwrite the contextual observation. Dictionary categories describe recorded senses and usage; contextual tagging estimates what a form is doing in this utterance.

## 3. Proposed data pipeline

1. **Acquire:** retrieve from an approved dataset, API, or permitted source export.
2. **Preserve:** retain raw sentence, source identifier, source URL or dataset release, retrieval date, license, and any available author/community/time metadata.
3. **Normalize:** create a normalized analysis copy while retaining the untouched original. Avoid silently correcting spelling, grammar, punctuation, or dialect features.
4. **Segment:** tokenize while preserving contractions, punctuation, emoji, and multiword spans.
5. **Annotate:** attach candidate lemmas, POS tags, morphological features, phrase spans, and contextual/sense hypotheses with confidence and annotator/model provenance.
6. **Filter and balance:** deduplicate, detect near-duplicates, apply quality and safety filters, and avoid allowing one source or genre to dominate.
7. **Sample:** draw a bounded active set using recorded sampling rules and seed.
8. **Admit:** expose selected items to the language population as observed utterances, not automatically as canonical community norms.
9. **Refresh:** periodically replenish the reservoir between defined sampling epochs. Keep each experimental run's acquired snapshot fixed.
10. **Trace:** preserve links from derived forms and innovations back to the source utterance and its analysis.

## 4. Reservoir versus active sample

Maintain three distinct layers:

- **Source catalogue:** metadata about datasets, APIs, licenses, terms, coverage, and refresh eligibility.
- **Reservoir store:** eligible source records and their annotations, or references to externally hosted records where storage/redistribution is not permitted.
- **Active sample:** the bounded set available to a particular simulation run or sampling epoch.

A refresh may change the next active sample, but must not silently alter an experiment already in progress. Record source versions, retrieval timestamps, content hashes where permitted, filters, sample size, and random seed. This preserves reproducibility while allowing the overall reservoir to evolve.

The active sample should be stratified rather than purely uniform: source, genre, register, region, time, and expression type can be balanced when metadata exists. Unknown metadata should remain unknown, not be guessed.

## 5. Annotation model

For each token or multiword span, permit:

- original surface form and character offsets;
- candidate lemma(s);
- candidate part(s) of speech;
- morphological analysis candidates;
- phrase/expression membership;
- candidate sense(s);
- contextual role or syntactic relation, when available;
- confidence or ranked alternatives;
- annotation source and model/version;
- whether the analysis was automatic, dictionary-enriched, or manually reviewed.

Keep lexical category, contextual function, and later community reanalysis separate. A token may have multiple plausible categories. A phrase may be syntactically opaque or compositional. A word's function in context may conflict with a dictionary's dominant category.

### Controlled misanalysis

The simulation may explore reanalysis and category shift, including pathways seeded by ambiguous or misleading analyses. However, distinguish:
1. uncertainty in the source annotation;
2. an intentionally injected experimental misanalysis;
3. a speaker's innovative use;
4. a variant adopted and transmitted by other speakers.

Only the latter two are linguistic events. An annotation error by itself is not a language change. The experiment may deliberately turn an analysis error into a hypothesis available to a speaker, then test whether usage and transmission stabilize it.

## 6. Candidate source tiers

No single source is sufficient. Build a source portfolio.

### Tier A — Open or explicitly licensed corpora

- **Open American National Corpus (OANC):** approximately 15 million words of American English with automatic sentence/word boundaries, multiple POS tag sets, shallow parsing, and named entities; its manually annotated MASC subset provides higher-quality annotation for selected material. Useful as a structured baseline, but genre/register balance must be inspected before treating it as informal conversation.
- **OpenSubtitles-Slang / OpenSub-Slang:** research dataset described as containing slang and non-slang sentences, word-level paraphrases, community and time-of-emergence information, and public accessibility. Dialogue is useful, but scripted subtitles are not equivalent to spontaneous everyday speech.
- **Openly licensed Wiktionary-derived data / Kaikki-Wiktextract:** useful for lexical senses, grammatical labels, inflections, IPA, etymology, and examples. Check the applicable attribution/share-alike requirements and retain attribution at record level.
- **Open English WordNet / WordNet:** useful for conventional lexical senses and semantic relations, not as the source of informal sentence populations.

### Tier B — Licensed or API-mediated dictionaries

- **Oxford Dictionaries Lexical Data API:** structured lexical metadata including inflections, etymologies, grammatical features, register, regional, and domain labels. Potentially useful for enrichment, subject to account, API, caching, and licensing terms. Do not assume API access grants unrestricted bulk redistribution.
- Other dictionary APIs may be evaluated for multiword expressions, usage labels, pronunciations, and example sentences. Record exact terms and storage rights before integration.

### Tier C — Community slang and informal-expression sources

- **Urban Dictionary:** potentially valuable for emergent, humorous, community-defined senses and deliberately unstable categorization. Entries are user-submitted and quality varies. Treat as a noisy discovery source, not a reliable grammatical authority. Do not scrape or redistribute without confirming current terms and permissions. Prefer a permitted dataset or API/export with clear rights.
- **Online Slang Dictionary:** may provide slang entries, POS labels, and example sentences; confirm current access and reuse terms.
- **Green's Dictionary of Slang:** historically rich and valuable for diachronic slang, but access and reuse are constrained; do not assume bulk data is available for project ingestion.
- **Public community glossaries and forum corpora:** potentially valuable for local terminology and identity-linked variation, but require source-specific privacy, consent, platform-policy, and licensing review.

### Tier D — Additional contemporary text and dialogue

Explore permissively licensed conversational, subtitle, forum, and social-text datasets. Each source needs a profile describing date range, region, genre, moderation, author population, scriptedness, annotation, and license. Avoid treating platform visibility as permission to scrape or republish.

## 7. Initial source strategy

Start with a small, legally uncomplicated proof of concept:

1. OANC/MASC for sentence segmentation and annotated baseline examples.
2. OpenSub-Slang for slang-bearing dialogue examples and community/time metadata.
3. Wiktionary-derived data for lexical enrichment and candidate grammatical categories.
4. Urban Dictionary only through a source whose access and reuse rights are explicitly established; initially use it as a research/discovery reference, not an assumed scrape target.

This portfolio intentionally mixes more reliable annotation with noisy informal language. The contrast is useful, provided source provenance remains visible.

## 8. Sampling and simulation admission

Do not treat every retrieved sentence as a phrase that must be preserved or mutated. A source utterance can contribute:
- a lexical item or sense;
- a multiword expression;
- a syntactic construction;
- a discourse/pragmatic pattern;
- a pronunciation or spelling variant;
- a contextual usage example;
- a candidate innovation.

Admission should depend on what the language engine can extract and what a speaker plausibly encounters. Keep sentence-level context for later interpretation, but allow the simulation to extract smaller units and recombine them.

A useful first experiment compares:
- uniform random sentence sampling;
- stratified sampling by source/register;
- weighted sampling by frequency or recency where reliable metadata exists;
- phrase-first sampling for idioms and multiword expressions.

Measure diversity, duplicate rate, annotation coverage, source skew, and the proportion of sampled items that can be meaningfully analyzed. Do not optimize solely for grammatical cleanliness.

## 9. Reproducibility and refresh

The reservoir may refresh over calendar time, but an individual simulation experiment must use a frozen acquisition manifest. The manifest identifies exact source releases or API retrieval records, filters, annotation versions, sample seed, and active sample. A new refresh creates a new manifest and does not rewrite previous experiments.

Keep reservoir sampling RNG separate from world, language-evolution, and presentation RNG streams. A UI action that previews or resamples source material must not perturb a running simulation.

## 10. Risks and cautions

- Publicly accessible does not mean freely reusable.
- User-generated slang entries can be offensive, inaccurate, ironic, or intentionally fabricated; this is useful linguistic material but requires labeling and safety controls.
- POS taggers trained on edited prose often struggle with slang, contractions, ellipsis, and novel uses.
- Dictionary categories are sense-specific and may lag emerging usage.
- Scripted dialogue can overrepresent punchlines, dramatic turns, and stylized speech.
- Social metadata may be absent or unreliable; do not infer speaker identity or demographics from text alone.
- Corpus refreshes can create hidden nondeterminism unless each experiment freezes its source manifest.
- A source annotation error must not automatically become a simulated speaker innovation.

## 11. First prototype questions

1. What active-sample size gives sufficient variety without overwhelming the current phrase notebook?
2. Which sentence genres should be represented, and in what proportions?
3. Should admission begin with complete sentences, extracted expressions, or both?
4. Which annotation stack gives acceptable contextual POS candidates for informal English?
5. What source-specific licenses permit local storage, derivative annotation, and redistribution?
6. How should the simulator distinguish a source form from a community-adopted variant?

## 12. Research references

- Open American National Corpus, data and annotation description: https://anc.org/data/
- Sun et al., *OpenSub-Slang* / NAACL 2024 resource and discussion of limitations in existing slang datasets: https://aclanthology.org/2024.naacl-long.94/
- Oxford Dictionaries Lexical Data API, structured grammatical/register metadata: https://developer.oxforddictionaries.com/lexical-data-api
- Oxford Dictionaries API FAQ, pronunciation and multiword expression coverage: https://developer.oxforddictionaries.com/faq
- Wikimedia Enterprise, Wiktionary API and snapshot/on-demand access: https://enterprise.wikimedia.com/project-data/wiktionary-api/
- *A Computational Framework for Slang Generation*, discussion of OSD, Green's Dictionary of Slang, Urban Dictionary subset, and Oxford lexical data: https://doi.org/10.1162/tacl_a_00378

## 13. Status

This is a source and architecture research proposal. It does not authorize scraping, bulk acquisition, or redistribution of any source. The next operation is a small source-rights and data-shape audit, followed by a bounded ingestion prototype using sources whose reuse terms are clear.
