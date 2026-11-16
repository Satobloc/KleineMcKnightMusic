# Active Tray

<!-- machine-state:start -->
operation_id: WF-LANG-002
status: ACTIVE
priority: P1
started_utc: 2026-11-14T05:58:30Z
<!-- machine-state:end -->

## Operation

**Title:** Specify and calibrate a usage-driven language-change model from contemporary informal English.

**Question:** Can a modest population of speakers develop competing, spreading, stabilizing, local, and disappearing form–function variants through use and social transmission?

**Baseline**
- Latest build: Cities Laboratory 2.12, `builds/Well_Fuck_Cities_Lab_2_12.html`.
- Preserved baseline: Cities Laboratory 2.11, unchanged.
- Implementation audit: `LANGUAGE_KERNEL_AUDIT.md`.
- Research synthesis: `ENGLISH_LANGUAGE_CHANGE_RESEARCH.md`, version 0.1.
- Existing working design: `LANGUAGE_MODEL_DESIGN.md`, version 0.3; proposal only.
- Recovered player-facing intent: `LANGUAGE_GAMEPLAY_INTENT.md`; design direction, not implementation.
- Confirmed starting point: contemporary informal, idiomatic English.
- New source-design branch: dynamic multi-source sentence/expression reservoir with bounded sampling, provenance, licensing, and probabilistic grammatical annotation.
- Source evaluation: MASC 3.0.0 remains a useful annotated baseline but is not current conversational English by itself; MaiChat 1.0 is a candidate recent informal-dialogue supplement. See LANGUAGE_CORPUS_SOURCE_EVALUATION.md.

**Scope**
- Establish contemporary informal, idiomatic English as the initial population.
- Acquire a bounded, stratified sample from an openly reusable contemporary-English corpus; preserve exact attestations in backend provenance only.
- Evaluate source quality, licensing, provenance, refresh cadence, deduplication, and reproducibility.
- Represent grammatical annotation as contextual candidates with confidence, not infallible labels.
- Establish historical English change as an evidence-based case study.
- Separate documented patterns from debated causal explanations.
- Define variation, innovation, exposure, adoption, diffusion, reanalysis, retention, and loss.
- Determine an economical population/cohort representation.
- Specify how phonology, morphology, syntax, lexicon, semantics, pragmatics, and contact interact.
- Specify and implement the standalone Language Change Laboratory; run ingestion, transmission baseline, innovation/diffusion, ablation, and multi-seed tests before any integration.
- Keep the starting lexicon open-ended; existing phrases are examples, not a boundary or protected layer.

**Stop condition**
A research-backed mechanism map and reviewable computational design exist. The design identifies the state needed to represent variant competition and transmission, the minimum calibration experiments, the uncertainties that remain, and the conditions for a first implementation. No large language-engine rewrite is authorized by this operation.

**Out of scope**
- Implementing the complete productive language engine.
- Reconstructing Old English unless that starting condition is explicitly selected.
- Treating English's particular historical trajectory as a universal language-change path.
- Geology feature development.
- Changes to existing ChatGPT scheduled tasks.

**Next cursor:** obtain the annotated MASC 3.0.0 archive and inspect its package-level terms; also obtain and inspect MaiChat 1.0 as a recent informal-conversation supplement. Evaluate the multi-source reservoir in LANGUAGE_CORPUS_SOURCE_EVALUATION.md, then freeze a stratified sample manifest only after the actual archives and licenses are verified. Run E0 ingestion checks followed by E1 no-innovation baseline. Do not modify Cities Laboratory 2.12 during calibration.

**Acquisition update (2026-11-16):** official ANC pages confirm the annotated MASC 3.0.0 download and the separate data-only package. The current GitHub migration release metadata and migration manifest now identify both archives and publish their sizes and SHA-256 digests. The official MASC landing page states CC BY 3.0 US, while the About page says no license or restrictions; until the exact package README and text-level notices are inspected, use the conservative CC BY attribution handling rule. See `MASC_SOURCE_ACQUISITION.md`. The archive download still fails in this execution environment: no archive bytes have been obtained, no local hash or extraction has been performed, and E0/E1 remain unrun. The earlier 2026-11-14 attempts are superseded by this more specific source-identity and integrity-metadata check, but the acquisition blocker remains.

