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
- New source-design branch: dynamic sentence/expression reservoir with bounded sampling, provenance, licensing, and probabilistic grammatical annotation.

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

**Next cursor:** resolve the MASC package-level terms, acquire the annotated MASC 3.0.0 release, and freeze a stratified sample manifest. Then implement the standalone laboratory and run E0 ingestion checks followed by E1 no-innovation baseline. Do not modify Cities Laboratory 2.12 during calibration.

**Acquisition note (2026-11-14):** the official MASC download page lists both the annotated 3.0.0 package and a data-only package. The official MASC About page says the corpus is distributed without license or other restrictions, while the MASC landing page describes CC BY 3.0 US terms. Resolve this discrepancy against the exact downloaded package metadata before freezing the manifest. Initial download attempts from this environment failed; no corpus has been acquired and no E0/E1 run has occurred.
