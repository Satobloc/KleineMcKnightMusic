# Toolbox Evidence and Adoption Method

## Purpose

The toolbox is a decision aid. It should help us choose the smallest reliable set of tools that supports the workshop, while preserving useful experiments and references without turning every interesting repository into a dependency.

## Evidence labels

Use these labels in catalog entries and experiment notes:

- **Upstream claim:** What the project's own documentation says it does.
- **Code-observed:** What inspected implementation code visibly does.
- **Locally tested:** What we have run successfully in our actual environment.
- **User-observed:** What the user reports from direct use or experimentation.
- **Inferred:** A plausible use or architectural implication that has not been demonstrated.
- **Unknown:** Not checked or not supported by available evidence.

Do not silently upgrade an upstream claim or inference into a locally tested capability.

## Project status labels

- **Core:** A clear, established role in the intended workflow.
- **Candidate:** Worth testing; adoption is not yet justified.
- **Reference:** Useful as an idea source or example, not a dependency.
- **Experimental:** Prototype or unvalidated concept.
- **Hold:** A specific limitation currently blocks adoption.

## Minimum record for every tool

Each record should include:

1. Name and canonical source.
2. Functional category and proposed role.
3. Status in this project.
4. Evidence and inspection scope.
5. Version, platform, and dependencies when known.
6. License for code.
7. Separate terms for model weights, datasets, samples, and generated outputs.
8. Privacy, safety, and rights considerations.
9. Concrete next action.
10. Date last reviewed.

## Adoption gates

A tool should not become a required dependency merely because it is interesting or appears in another project.

Before adoption, establish:

- **Functional fit:** It solves a named problem in our workflow.
- **Reproducibility:** We can specify versions, settings, inputs, and expected outputs.
- **Environment fit:** It works on the target machine and operating system.
- **Interoperability:** It exchanges data through a documented, testable boundary.
- **Maintenance:** Its upstream status and dependency health are acceptable.
- **Rights:** Code, model weights, datasets, samples, and output use are separately understood.
- **Fallback:** We know what happens if the tool is unavailable or discontinued.

## License discipline

Never infer model-weight or dataset licensing from a repository's code license. A project may contain MIT-licensed code but noncommercial model weights, separately licensed sample data, or externally hosted checkpoints with different terms.

GPL-licensed tools may still be usable, but integration and distribution need deliberate review. Optional process boundaries can be preferable to embedding a GPL library in a differently licensed application.

## Experimental discipline

For generative audio, preserve:

- Original prompt text, including unusual syntax and punctuation.
- Model and version.
- Generation mode and all relevant settings.
- Input references and their rights/provenance.
- Output file identifier and checksum where possible.
- Human evaluation, including what worked and what failed.
- The hypothesis being tested and the variables changed.

A successful output does not prove that the prompt alone caused the success. Avoid changing several variables at once when testing a specific hypothesis.

## Review cadence

Revisit entries when:
- upstream maintenance or licensing changes;
- a model or tool version changes;
- local tests reveal a limitation;
- the project gains a new requirement;
- a candidate is either adopted or rejected.

The inventory should remain small enough to guide decisions. Move obsolete entries to an archive rather than allowing the active toolbox to become an unfiltered link collection.
