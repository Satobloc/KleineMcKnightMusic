# E-0001 Run Protocol

## Question
Does the explicit procedural search policy increase useful novelty/hook quality relative to the same overloaded prompt without it?

## Fixed settings — first pass
- Model: v5.5
- Weirdness: 60
- Style Influence: 85
- No source audio, Persona, Voice or Custom Model
- Title for both arms: `Correlation Descent Packet`
- Instrumental mode only if the UI setting is available; otherwise leave unchanged across both arms

These are starting coordinates, not presumed optimal values: enough room for unusual reconciliation while still giving the dense Styles engine substantial influence.

## Arm A — Policy
Run the exact `PROMPT.md` once; retain both generated outputs.

## Arm B — Control
Run the exact `PROMPT_CONTROL_NO_DEFMODE.md` once; retain both generated outputs.

## Do not change
Title strategy, prompt punctuation, source pool, model, sliders or exclusions between arms.

## Fast first-pass audit
For each of four songs, note:
- immediately identifiable hook?
- hook distinctiveness and recurrence;
- composite/imaginary instrument impression;
- degree of genre averaging;
- conventional chassis;
- one best surprise;
- one dead/ordinary feature.

Then choose the best song from each arm for deeper audit.
