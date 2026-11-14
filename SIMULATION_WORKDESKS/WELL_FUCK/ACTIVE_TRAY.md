# Active Tray

<!-- machine-state:start -->
operation_id: WF-LANG-002
status: ACTIVE
priority: P1
started_utc: 2026-11-14T05:58:30Z
<!-- machine-state:end -->

## Operation

**Title:** Research realistic language evolution and specify the change model, using English as the first empirical case study.

**Question:** What mechanisms produce historically plausible language change, and what is the smallest computational model that can reproduce them without reducing language evolution to random phrase mutation?

**Baseline**
- Latest build: Cities Laboratory 2.12, `builds/Well_Fuck_Cities_Lab_2_12.html`.
- Preserved baseline: Cities Laboratory 2.11, unchanged.
- Implementation audit: `LANGUAGE_KERNEL_AUDIT.md`.
- Research synthesis: `ENGLISH_LANGUAGE_CHANGE_RESEARCH.md`, version 0.1.
- Existing working design: `LANGUAGE_MODEL_DESIGN.md`, version 0.3; proposal only.

**Scope**
- Establish historical English change as an evidence-based case study.
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

**Next cursor:** decide whether the simulation begins as a future descendant of contemporary English or deliberately reconstructs a historical English stage; then choose the smallest population-variation model for the change laboratory.
