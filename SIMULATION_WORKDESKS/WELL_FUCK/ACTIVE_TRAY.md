# Active Tray

<!-- machine-state:start -->
operation_id: WF-LANG-002
status: ACTIVE
priority: P1
started_utc: 2026-11-14T05:26:01Z
<!-- machine-state:end -->

## Operation

**Title:** Design the productive language model.

**Question:** What is the smallest coherent semantic, lexical, and grammatical system that lets a speech community generate new, compositional utterances from simulation events and speaker intentions?

**Baseline**
- Latest build: Cities Laboratory 2.12, `builds/Well_Fuck_Cities_Lab_2_12.html`.
- Preserved baseline: Cities Laboratory 2.11, unchanged.
- Source audit: `LANGUAGE_KERNEL_AUDIT.md`.
- Current proposal: `LANGUAGE_MODEL_DESIGN.md`, version 0.1, reviewable and not yet an implementation contract.

**Scope**
- Define a compact, simulation-grounded concept inventory.
- Define a message-frame representation independent of surface wording.
- Define the minimal lexeme schema and community-specific mapping from concepts to forms.
- Choose a first, deliberately small set of grammatical distinctions and clause patterns.
- Preserve IPA token arrays, community inheritance, and the existing phrase/idiom system.
- Specify the generation pipeline and the tests required before implementation.
- Identify open decisions without prematurely fixing them.

**Stop condition**
A reviewable design identifies the first concept domains, message-frame schema, lexeme structure, minimal grammar profile, utterance-generation pipeline, implementation sequence, and test gates. Major choices are either supported by a worked example or explicitly left open for Nathan's decision.

**Out of scope**
- Implementing the productive grammar before the design gate.
- Replacing the existing phrase kernel.
- Social contact, borrowing, dialect continua, or mutual intelligibility implementation.
- Geology feature development.
- Changes to existing ChatGPT scheduled tasks.

**Next cursor:** work through LANGUAGE_MODEL_DESIGN.md, build one or two worked message-frame-to-utterance examples, and resolve the minimum schema.
