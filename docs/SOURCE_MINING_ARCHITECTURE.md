# Source Mining Architecture

## Purpose
Build a research intake and analysis system around existing corpus hoppers, without confusing that system with the future Nathan-facing Suno Prompt Workbench.

## Existing foundations (do not replace)
- `corpus/Prompt_Hopper`: existing prompt artifacts and historical workshop material.
- `corpus/Genre_Hopper`: genre/tradition inventories and terminology.
- `corpus/Lyrics_Hopper`: lyric, phrase, vocal and text material.
- `corpus/Structure_Hopper`: song structure, melody, rhythm and analysis.
- `corpus/Sample_Hopper`: audio examples and source material.
- `corpus/Grab_Bag`: deliberately unsorted mixed intake.
- `corpus/Writing_Voice`: writing-voice research assets.
- `SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1`: experiment ledger, model behavior registry, taste model, prompt grammar, song architecture and open questions.
- `corpus/suno-experiment.schema.json`: existing structured Suno generation record.
- `tools/analyze_suno_corpus.py`: private export analyzer. Keep its privacy-preserving design.

## New source-mining hoppers
- Community_Hopper: public creator reports, comparisons, disagreements, tutorials.
- Source_Hopper: shared source registry and immutable metadata snapshots.
- Research_Hopper: papers, preprints, model cards, datasets and technical claims.
- Product_Hopper: Suno official docs, releases, interface and model behavior.
- Prompt_Examples_Hopper: externally authored prompts and prompt evolution.
- Audio_Case_Hopper: source-linked prompt/audio pairs. Do not mirror audio by default.
- Tooling_Hopper: scraper/API/research utilities and third-party repositories.

## Data flow
1. Discover a candidate URL using search, API, repository indexing, or manual submission.
2. Capture minimal public metadata and a short excerpt; retain canonical URL and retrieval timestamp.
3. Deduplicate by canonical URL and normalized-content fingerprint.
4. Classify evidence type: official claim, direct artifact, creator report, creator interpretation, third-party analysis, our hypothesis, replicated observation, unknown.
5. Route metadata to the appropriate hopper.
6. Review source terms, privacy, license, access method and attribution before extracting or reusing content.
7. Extract atomic claims into a claim register with supporting sources, counterexamples and confidence.
8. Promote only verified/relevant material into curated prompt grammar, vocabulary, behavior registry or experiments.
9. Preserve original records; never overwrite productive failures or contradictory evidence.

## Hoppers are source-intake streams, not prompt-builder modules
The future Suno Prompt Workbench will be built separately. It should draw from curated, tagged material only after the source-mining and evaluation layers have prepared it.

## Scraper constraints
- Use official APIs/feed endpoints when available.
- Respect robots.txt, terms, rate limits, OAuth scopes and platform restrictions.
- Do not circumvent login walls, paywalls, anti-bot controls or deleted/private content.
- No bulk audio download. Store public source links and metadata; obtain permission before mirroring.
- Minimize personal data and never collect credentials.
- Record scraper version, query, retrieval timestamp, crawl scope, errors and coverage limitations.
- Every automated capture remains unverified until reviewed.
- The current source_hopper.py is a conservative public URL/RSS/Atom metadata collector. It is not a search engine, browser renderer, Reddit API client, or audio scraper.
- The current script checks robots.txt and blocks direct Suno/Udio metadata crawling by default. Use official documentation, community discussions, published analyses, compatible third-party datasets, user-authorized exports, or explicitly permissioned data.
- Do not reproduce the acquisition method from Casini et al. by scraping Suno/Udio public playlists. Their article says their collection conflicted with platform terms and explains their own legal rationale. That is not permission for this project.
- The Casini et al. companion repository shares URL lists and analysis code but does not distribute collected song metadata. Its metadata-fetching code is reference material only pending independent authorization and terms review.
- The co-existing-styles data in dawgshart/suno-prompt-engineering-guide is explicitly described in its LICENSE as Suno-owned and excluded from that repository's MIT license. Do not copy it into this repository.
- CC0 or open-source claims on third-party repositories must be checked against the exact files, data provenance, and third-party components before adoption.
- The source hopper has unit tests and a CI workflow, but test execution must be verified from an actual Actions run before labeling the utility production-ready.

## Future modules
A. Query planner / search-run logger.
B. Public-feed and URL-list collector.
C. Reddit API connector with explicit OAuth and rate-limit handling, if authorized.
D. GitHub repository/README/code/data collector using GitHub API and licenses.
E. Prompt/audio case linker and evidence classifier.
F. Claim extractor and contradiction finder.
G. Feature vocabulary and cross-domain concept miner.
H. Source quality / rights / provenance auditor.
I. Scheduled incremental re-crawl with deduplication and change detection.
