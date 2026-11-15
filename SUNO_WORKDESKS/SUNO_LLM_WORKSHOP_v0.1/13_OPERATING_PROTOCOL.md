# 13 — Operating Protocol

**Status:** Working protocol; adaptable and subject to revision.
**Purpose:** Establish how the music workshop thinks, explores, tests, records, builds, and maintains continuity.

This protocol borrows operational lessons from HsH without importing HsH's project-specific control architecture. KleineMcKnightMusic has its own purpose, evidence model, creative culture, and tools. Procedures exist to support musical inquiry, not to turn it into administration.

## 1. Governing principles

1. **Exploration before formalization.** Do not force an interesting musical idea into a research question prematurely.
2. **Evidence before authority.** A prompt, a generated result, a listening observation, a repeated result, a measurement, and an explanation are distinct evidence objects.
3. **Branch without losing the trunk.** Follow productive discoveries while retaining the original objective and a route back.
4. **Preserve productive disorder.** Malformed, contradictory, phonetic, absurd, boundaryless, and apparently nonsensical material is legitimate research material. Do not silently normalize it.
5. **Build capabilities, not bureaucracy.** A procedure is worthwhile when it improves continuity, reliability, expressive control, discovery, or reuse.
6. **Surprise is a result, not an error term.** Do not optimize every process toward literal compliance, conventional coherence, or predictability.
7. **Keep the human ear in the loop.** Quantitative analysis can measure features and compare cases; it does not replace listening or aesthetic judgment.

## 2. Work routing

Every incoming item may be routed provisionally. Routing is lightweight and reversible.

- **Spark / idea mine:** an evocative phrase, sound-world, contradiction, possibility, or question not yet committed to investigation.
- **Observation:** something heard, noticed, measured, or reported from direct use.
- **Source lead:** an external source, tool, dataset, discussion, or reference needing inspection.
- **Question:** a bounded uncertainty that may be answered by research, analysis, or experiment.
- **Experiment proposal:** a question with a proposed comparison or test.
- **Active experiment:** a test currently being run or analyzed.
- **Build task:** a reusable script, instrument, parser, corpus operation, prompt utility, or other capability.
- **Decision:** a project-level choice with rationale and scope.
- **Parked / blocked / superseded / complete:** lifecycle states, not judgments of quality.

Do not create a separate branch for every thought. Branch when a line of inquiry has a distinct question, method, or deliverable. Keep related work together when separation would create needless overhead.

## 3. The working loop

Use this adaptable loop; not every task needs every stage.

**Notice → Frame → Route → Explore → Test or Build → Inspect → Record → Reassess**

- Notice what is interesting, anomalous, useful, or unresolved.
- Frame the immediate question without pretending it is more settled than it is.
- Route it to the lightest suitable work mode.
- Explore existing material before duplicating work.
- Take a bounded action when the inputs, authority, and tools are sufficient.
- Inspect the result, including failures and unintended effects.
- Record a durable result when it will matter beyond the current exchange.
- Reassess whether to continue, branch, promote, park, or stop.

A useful work quantum normally produces one inspectable result and one clear next step. Larger tasks may be split into linked quanta.

## 4. Evidence and interpretation

Keep these categories distinguishable:

- **Source artifact:** exact prompt, lyric, settings, generated file, source URL, code, or other original object.
- **User observation:** what Nathan reports hearing, seeing, or experiencing.
- **Assistant observation or analysis:** an interpretation made during examination.
- **Measurement:** output of a named procedure, with method and limitations.
- **Repeated observation:** a pattern seen across identifiable cases.
- **Hypothesis:** an explanation or proposed relationship not yet established.
- **Decision:** a chosen working convention or action, not a claim of universal truth.

For Suno and other generative systems, record model/version, mode, settings, relevant input fields, reference assets, output identity, and date whenever available. Keep version-bound observations version-bound. Never turn a fluent explanation, model self-report, or one striking generation into evidence of hidden internal mechanisms.

Use the existing experiment ledger and model behavior registry. Check for overlap before assigning new experiment IDs. Preserve contradictory evidence and counterexamples.

## 5. Experiment design

Use controlled comparisons when the question is causal or when competing explanations matter.

A useful experiment specifies:
- the question;
- the source prompt or artifact, preserved verbatim;
- the principal variable being changed;
- the control or comparison condition;
- model/version/mode/settings;
- output and listening/measurement criteria;
- limitations and next decision.

Change one principal variable at a time when practical. If several variables change, label the work exploratory rather than controlled. Replicate when the result matters. Do not let experimental neatness erase the creative value of an unexpected result.

Score separately where useful:
- control value;
- surprise value;
- conventionality cost;
- sterilization cost;
- identity or invariant preservation;
- musical quality and distinctiveness.

## 6. Creative exploration and prompt work

Keep raw language first-class. Preserve exact wording, punctuation, spacing, lineation, malformed constructions, and variants when these may affect interpretation.

Distinguish:
- semantic content from phonetic form;
- lyric-eligible text from musical or production direction;
- global song-world from local event;
- intended instruction from observed model response;
- deliberate ambiguity from accidental ambiguity.

Do not automatically repair contradictions, explain away strange phrasing, or replace concrete sonic situations with generic genre/mood language. Offer alternate readings without destroying the original.

The current Prompt Grammar and future Prompt Workbench remain separate layers: research can inform construction tools, but research notes are not automatically interface requirements.

## 7. Source and tool practice

- Search existing project material before starting a duplicate investigation.
- Treat indexes, summaries, and search excerpts as wayfinding; inspect the underlying source before relying on it.
- Record canonical source, retrieval date, inspection scope, provenance, license/terms, and confidence where relevant.
- Distinguish software-code rights from model-weight, dataset, sample, voice, lyric, and output rights.
- Treat toolbox entries as candidates until their function is inspected and tested in the intended environment.
- Prefer small, replaceable tools and documented data boundaries over unnecessary platform dependencies.
- Use scripts for repeatable calculations, parsing, comparison, corpus maintenance, and validation. Keep methods inspectable and test them against known cases.
- Protect private user material. Public repository presence does not authorize publication of private lyrics, conversation exports, listening histories, or third-party content.

## 8. Branching and continuity

Maintain a short active-work index with:
- current objective;
- active branch and why it exists;
- relevant source paths and exact artifacts;
- last durable result;
- unresolved question;
- next action and exit condition;
- parked branches worth revisiting.

Resume existing work where possible. Do not create parallel efforts merely because a new conversation begins. When a branch is paused, leave a useful continuation cursor. When it is complete, record what was learned and where the result now lives.

## 9. Repository operations

- Prefer append-only records for experiments, observations, and case histories.
- Do not overwrite source artifacts or productive failures.
- Make focused commits with descriptive messages.
- Before modifying an existing file, inspect its current contents and preserve unrelated material.
- After a write, independently fetch the changed file and verify the intended content.
- Separate public, private, and rights-restricted material.
- Do not make repository changes merely to demonstrate activity. A durable note is useful only when it improves future work.

## 10. Periodic reassessment

At natural project boundaries, after a meaningful run of experiments, or when the workflow starts to feel repetitive, ask:

1. What have we actually learned?
2. Which claims remain hypotheses?
3. What changed in the model, tools, or environment?
4. Which procedures are helping, and which have become ritual?
5. Are we preserving the project's distinctive creative aims?
6. What should be simplified, automated, branched, parked, or retired?

No fixed cadence is mandatory. Reassessment should respond to meaningful change, not become a calendar-driven performance.

## 11. Session handoff

A useful handoff is concise and operational:
- **Aim:** what this line of work is trying to do.
- **State:** what is known and what has actually been done.
- **Evidence:** exact artifacts and repository paths.
- **Uncertainty:** what remains unresolved.
- **Next move:** the smallest useful next action.
- **Guardrail:** what must not be lost, assumed, or changed.

This is a continuity aid, not a substitute for inspecting sources when the next task depends on them.

## 12. Onboarding and continuity

Use `14_ONBOARDING_AND_CONTINUITY.md` as the workdesk cold-start and reentry route. It translates source-first reading, provenance, bounded execution, branch management, tool reconnaissance, and continuity from HsH into the music domain. It does not supersede this protocol or import HsH's project-specific control architecture.

## 13. Revision rule

This protocol is a living aid. Change it when experience shows a better way to work. Keep revisions proportionate, explain meaningful changes, and do not import another project's machinery simply because it is available.
