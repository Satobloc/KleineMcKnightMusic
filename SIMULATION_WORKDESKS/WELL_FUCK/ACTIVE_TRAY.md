# Active Tray

<!-- machine-state:start -->
operation_id: WF-LANG-002
status: ACTIVE
priority: P1
started_utc: 2026-11-14T05:58:30Z
<!-- machine-state:end -->

## Operation

**Title:** Research realistic language evolution and specify the change model, using English as the first empirical case study.

**Question:** How can a contemporary informal-English population draw on a bounded, replenishable reservoir of real utterances and evolve them through socially transmitted variation without reducing language change to random phrase mutation?

**Baseline**
- Latest build: Cities Laboratory 2.12, `builds/Well_Fuck_Cities_Lab_2_12.html`.
- Preserved baseline: Cities Laboratory 2.11, unchanged.
- Implementation audit: `LANGUAGE_KERNEL_AUDIT.md`.
- Research synthesis: `ENGLISH_LANGUAGE_CHANGE_RESEARCH.md`, version 0.1.
- Existing working design: `LANGUAGE_MODEL_DESIGN.md`, version 0.3; proposal only.\n- Confirmed starting point: contemporary informal, idiomatic English.\n- New source-design branch: dynamic sentence/expression reservoir with bounded sampling, provenance, licensing, and probabilistic grammatical annotation.

**Scope**
- Establish contemporary informal, idiomatic English as the initial population.\n- Design a replenishable external sentence/expression reservoir and bounded active sample.\n- Evaluate source quality, licensing, provenance, refresh cadence, deduplication, and reproducibility.\n- Represent grammatical annotation as contextual candidates with confidence, not infallible labels.\n- Establish historical English change as an evidence-based case study.
- Separate documented patterns from debated causal explanations.
- Define variation, innovation, exposure, adoption, diffusion, reanalysis, retention, and loss.
- Determine an economical population/cohort representation.
- Specify how phonology, morphology, syntax, lexicon, semantics, pragmatics, and contact interact.
- Design a small English-based calibration laboratory before integration into the full simulation.
- Keep the starting lexicon open-ended; existing phrases are examples, not a boundary or protected layer.

**Stop condition**
A research-backed mechanism map and reviewable computational design exist. The design identifies the state needed to represent variant competition and transmission, the minimum calibration experiments, the uncertainties that remain, and the conditions for a first implementation. No large language-engine rewrite is authorized by this operation.

**Out of scope**
- Implementing the complete productive language engine.
- Reconstructing Old English unless that starting condition is explicitly selected.
- Treating English's particular historical trajectory as a universal language-change path.
- Geology feature development.
- Changes to existing ChatGPT scheduled tasks.

**Next cursor:** specify the reservoir data contract and source tiers; then choose the smallest population-variation model for the change laboratory. Keep corpus refreshes outside a fixed seeded experiment, and preserve source snapshot identity for reproducibility.
