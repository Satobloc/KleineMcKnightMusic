# Community Hopper

Purpose: intake for externally reported Suno behavior, creator workflows, anecdotes, comparisons, and audio-linked examples.

This is a raw intake area, not a vetted reference or prompt library.

## Intake rules
- Preserve the source URL, platform, author/handle where public and relevant, post date, retrieval date, and exact quoted excerpt only as permitted.
- Prefer records containing the original prompt and an actual output/audio link.
- Separate creator-reported observations from the creator's interpretation and our own hypothesis.
- Record model/version/settings when supplied; otherwise mark unknown.
- Record contradictory reports rather than resolving them by popularity.
- Avoid collecting personal data, private communities, deleted/private posts, or content whose reuse rights are unclear.
- Deduplicate by canonical URL and content fingerprint.

## Streams
- Reddit discussions and controlled comparisons
- Public forum/community discussions
- Prompt/output case studies
- Creator tutorials and field reports
- Community disagreements and failed attempts

See `../Source_Hopper/record.schema.json` for the shared intake record.


## Evidence triage
Assign every source one evidence class:
- official_claim
- direct_artifact
- creator_report
- creator_interpretation
- third_party_analysis
- our_hypothesis
- replicated_observation
- unknown

Do not rank a claim by popularity alone. Record sample count, model/version, input field, settings, output/audio evidence, dates, counterexamples and source independence where available.

## Community-mining priorities
1. Prompt + audio linked cases, with exact input and generation metadata.
2. Controlled A/B or multi-user replications.
3. Unusual-language, invented-language, phonetic and onomatopoeic experiments.
4. Reports about prompt order, punctuation, tags, Style/Lyrics field separation, exclusions and settings.
5. Failures, contradictory outcomes and model-version transitions.

## Collection boundaries
Prefer public APIs, public feeds and manually curated URLs. Respect platform terms, robots directives, rate limits, privacy and access controls. Do not scrape private/login-walled posts or bulk-download user audio.
