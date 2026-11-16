# Language Corpus Source Evaluation

**Operation:** WF-LANG-002  
**Checked:** 2026-11-16  
**Status:** RESEARCH NOTE / SOURCE SELECTION NOT YET FROZEN

## 1. Why reopen source selection

MASC 3.0.0 remains a useful annotated, multi-genre baseline, but the official browse catalogue shows that its material is heterogeneous and includes older documents. A directly inspected blog item, for example, contains posts and comments dated May 2010. A 2026 release date for the archive does not make its texts current 2026 usage.

The intended starting condition remains broad contemporary informal, idiomatic English. Corpus dates and provenance should be retained for source assessment and reproducibility, but they must not be turned into separate late-twentieth-century / early-twenty-first-century speaker cohorts. A source reservoir can combine complementary sources without flattening their differences.

## 2. Candidate comparison

### MASC 3.0.0 / OANC

- Approximately 500K words, balanced across 19 genres, with written and spoken data.
- Useful annotation layers include sentence boundaries, tokens, lemma/POS, chunks, named entities, syntax, coreference, and discourse-related layers.
- Candidate informal material includes blogs, email, jokes, fiction/ficlets, movie scripts, Twitter, and several spoken subgenres.
- Strength: compact, annotated, genre-diverse, reproducible baseline.
- Limitation: not a representative sample of current informal conversation; individual items can be old (the official browse page includes a blog text dated 2010). Some genres are highly edited or specialized.
- Terms: official MASC pages conflict in wording. Until the package README and source notices are inspected, use conservative CC BY 3.0 US attribution handling. See MASC_SOURCE_ACQUISITION.md.
- Source pages:
  - https://anc.org/data/masc/
  - https://anc.org/data/masc/downloads/data-download/
  - https://anc.org/data/masc/corpus/annotations/
  - https://anc.org/data/masc/corpus/browse-masc-data/

### MaiChat 1.0

- 50 dyadic conversations, 100 participants, 4,975 messages, approximately 33,100 words.
- Collected December 2023 through May 2025; released June 2026.
- Real-time typed conversation between people who know one another, with turn sequence, sender, timestamps, expressive spelling, laughter, emojis, filled pauses, capitalization, and self-repair.
- The archive also contains typing-state logs. The first language experiment should use only final submitted message text and conversation/speaker structure; typing logs are not needed for language change v0.1.
- Strength: recent, informal, interactional material with conversation structure. It is a particularly good supplement for colloquial forms and usage in context.
- Limitations: small, only 50 dyads, typed rather than spoken, topic-unannotated, and not a broad sample of all regions/registers. The README says no demographic metadata is included in this release.
- License: CC BY-SA 4.0. Attribution is required and derivative datasets must be distributed under the same license. Keep the corpus and any text-derived dataset out of the public game repository unless the share-alike obligations are deliberately met. Do not assume that an exported or transformed variant inventory is license-free.
- Sources:
  - https://datashare.ed.ac.uk/items/7daabcd9-bb5f-4106-adc3-45e831c5577c
  - https://datashare.ed.ac.uk/server/api/core/bitstreams/1fa2c7f0-d3e1-45da-a264-446b49206e8f/content
  - https://doi.org/10.7488/ds/8083

### Georgetown University Multilayer (GUM) corpus

- Approximately 273K tokens across 275 documents and 24 text types in the current overview.
- Rich annotations include POS/morphology, rough speech act, speaker/addressee where relevant, syntax, constructions, coreference, and discourse relations.
- Text types include conversations, vlogs, podcasts, interviews, forum, letters, fiction, and other genres.
- Strength: broad genre coverage and useful speech-act/discourse annotations.
- Limitations: not all source text is distributed with the corpus; Reddit text must be reconstructed under Reddit's terms. Some text types (including wikiHow, essays, and fiction) are identified as CC BY-NC-SA. Per-document source rights must be checked; do not treat the entire corpus as one uniform permissive license.
- Sources:
  - https://gucorpling.org/gum/
  - https://gucorpling.org/gum/download.html
  - https://gucorpling.org/gum/citations.html

### LANA-CASE

- Approximately 9 million tokens / 1,031 hours across 1,477 texts and 1,116 speakers; conversations collected 2022–2024; released September 2026.
- Highly relevant everyday private American conversation with situational and speaker metadata.
- **Not suitable for the current project workflow without separate written permission:** the user license limits use to non-commercial research or teaching, prohibits AI training, prohibits uploading transcripts to AI software/websites that collect or save data, prohibits redistribution, and requires storage on equipment under the signatory's direct control rather than external cloud services.
- This project may become a public or commercial game, and the current workflow uses cloud services. Do not acquire, upload, inspect through ChatGPT, or use LANA-CASE in this project under the posted standard license.
- Source: https://cass.lancs.ac.uk/lana-case/

### English Everyday-Conversation ASR dataset

- 34,777 clips / approximately 40 hours, CC BY-SA 4.0, with text, raw text, speaker, conversation, source, style, accent and other metadata.
- Combines EdAcc (11,485 clips; spontaneous dyadic conversation) and DailyTalk (23,292 clips; scripted everyday-life dialogue with two voices).
- Strength: useful short-utterance material, includes both spontaneous and scripted styles, and preserves source and speaker/conversation labels.
- Limitations: the EdAcc portion is described as an evaluation benchmark (validation/test); DailyTalk is scripted and should not be treated as spontaneous interaction. Text is normalized in one field and a raw-text field is also supplied. Audio makes the full package comparatively large.
- License is stated as CC BY-SA 4.0 by the dataset publisher, which also asserts that both upstream sources are available under that license. Verify upstream terms and attribution before use; retain the distinction between spontaneous and scripted source strata.
- Sources:
  - https://huggingface.co/datasets/bbdontcry/en-everyday-conversation-asr
  - https://huggingface.co/datasets/edinburghcstr/edacc
  - https://huggingface.co/datasets/eustlb/dailytalk

## 3. Provisional recommendation

Do not make MASC the sole definition of contemporary informal English.

For the first multi-source reservoir, the strongest practical candidate is:

1. **MASC 3.0.0** for annotated, genre-diverse written/spoken material and a reproducible baseline, once its package is acquired and notices inspected.
2. **MaiChat 1.0** as a recent, interactional supplement for typed informal conversation, once its archive and CC BY-SA 4.0 obligations are inspected and an internal handling plan is set.
3. Consider the English Everyday-Conversation ASR dataset later as a separate spoken-style stratum, not a replacement for genuine interaction; keep spontaneous and scripted subsets distinct.

GUM remains a useful annotation and design reference, but mixed source rights and missing Reddit text make it a less straightforward first ingestion source. LANA-CASE is excluded under its current license for this cloud-assisted and potentially commercial project unless written permission changes those terms.

This is a candidate source architecture, not a locked decision or a frozen sampling plan.

## 4. Reservoir design implications

- Store source identity, release, source/document ID, date where available, genre, modality, speaker/conversation ID where permitted, license, attribution, and processing version as provenance metadata.
- Retain original date metadata for source-quality assessment and reproducibility, but do not create historical speaker cohorts from it.
- Keep source strata visible through sampling and analysis. Do not pool all items into a single undifferentiated frequency count.
- Preserve turn adjacency and speaker alternation where a source provides conversation structure.
- Do not infer social demographics from text. Only use demographic fields when a license permits and when the simulation has a justified need.
- Keep raw attestations and source-derived records outside the public game code. Publish manifests with stable IDs, source references, counts, checksums, and license notes; do not publish restricted text.
- Make the first 600-item sample a declared, reproducible draw across the sources actually acquired. Do not set source quotas until package contents, available strata, and license constraints have been inspected.

## 5. Immediate next actions

1. Obtain the annotated MASC 3.0.0 archive and inspect its README, resource header, source notices, and annotation coverage.
2. Obtain MaiChat 1.0 and inspect its archive structure and file-level content; retain only final message text and necessary interaction metadata for the first pass.
3. Decide whether to include the English Everyday-Conversation ASR dataset after checking upstream licenses and extracting a text-only sample.
4. Freeze a multi-source manifest only after the actual source archives are available and their hashes have been verified.
5. Run E0 on the acquired data. Until then, E0 and E1 remain unrun.

**Important:** the present execution environment cannot retrieve the candidate archive binaries from the external hosts. The source descriptions and license statements above were inspected from their official or publisher pages; no corpus text was downloaded or processed in this operation.
