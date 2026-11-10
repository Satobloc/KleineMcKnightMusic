# External mining: temporal control and multimodal conditioning
Date: 2026-11-10

## Scope
Research pass on how music-generation research represents control over musical attributes, especially the distinction between global descriptions and time-local or time-varying conditions. These papers are not evidence about Suno's internal architecture. They provide conceptual and experimental ingredients for later exploration.

## Research records

### Mustango: Toward Controllable Text-to-Music Generation (2024)
Source: https://aclanthology.org/2024.naacl-long.459/
DOI: https://doi.org/10.18653/v1/2024.naacl-long.459
Evidence type: peer-reviewed research.
The system explores text conditions that include music-theoretic attributes such as chords, beats, tempo, and key, in addition to broad text descriptions. Its MusicBench augmentation process adds descriptions derived from altered harmonic, rhythmic, and dynamic features. The paper reports improved controllability for these conditions relative to evaluated baselines.
Why it matters here: musical description need not stop at genre/mood/instrument labels. Text can encode more constrained musical relations.

### Music ControlNet: Multiple Time-Varying Controls for Music Generation (2024)
Source: https://gclef-cmu.org/static/pdfs/2024musiccontrolnet.pdf
DOI: https://doi.org/10.1109/TASLP.2024.3399026
Evidence type: peer-reviewed research.
The paper addresses controls that vary over time, including melody, dynamics, and rhythm, while retaining global text-based style control. Its controls are designed to be composable, allowing subsets to be used together.
Why it matters here: a track can be treated as a trajectory of changing properties, not merely one static attribute bundle.

### JASCO: Joint Audio and Symbolic Conditioning for Temporally Controlled Text-to-Music Generation (2024)
Source: https://arxiv.org/abs/2406.10970
Evidence type: research preprint.
JASCO combines global text descriptions with local symbolic and audio-based conditions. Examples include chords, melody, separated drum tracks, and full-mix audio. It evaluates both condition adherence and generation quality.
Why it matters here: different information channels can carry different jobs. A text description might establish broad identity while a local symbolic or audio reference anchors a specific event or feature.

### MuseControlLite: Multifunctional Music Generation with Lightweight Conditioners (2025)
Source: https://proceedings.mlr.press/v267/tsai25a.html
Project/demo: https://musecontrollite.github.io/web/
Evidence type: peer-reviewed ICML proceedings.
The work studies time-varying musical attributes, reference audio, and inpainting/outpainting. It reports that positional embeddings are important when the desired condition is a function of time.
Why it matters here: ordering and location are not just formatting. They can be essential parts of a control signal.

### Diffusion based Text-to-Music Generation with Global and Local Text based Conditioning (2025)
Source: https://arxiv.org/abs/2501.14680
Evidence type: research preprint.
The work combines local text representations with global text/audio-language representations, reporting trade-offs between text adherence and audio quality.
Why it matters here: the same description can have multiple scopes. A representation optimized for overall semantic character may not preserve local details in the same way.

### Recent advances in music generation: methods, evaluation, and challenges (2026)
Source: https://doi.org/10.1007/s10462-026-11582-x
Evidence type: survey/review.
Its discussion of controllability identifies the difficulty of combining and revising musically meaningful constraints without entanglement or loss of naturalness. It distinguishes high-level semantic/affective labels, symbolic/structural information, and interactive or latent-space control.
Why it matters here: controllability is not simply prompt obedience. It includes the ability to combine, localize, revise, and preserve different kinds of musical intent.

## Suno/community observation, kept separate from research
A 2026 community guide proposes combining section labels and performance directions inside a single bracketed instruction, rather than stacking separate tags. This is an individual workflow claim, not an official syntax specification and not a controlled test:
https://www.reddit.com/r/SunoAI/comments/1tau0gh/suno_prompting_guideopen_agent_skill/

A current prompt-template article emphasizes separating global Styles-field descriptions from section-level Lyrics-field structure, but notes that templates and unofficial tags were not all re-tested on v6:
https://www.prompt-architects.com/blog/173-suno-music-prompt-templates

## Important boundaries
- These studies describe their own systems, not Suno.
- Research results are tied to particular models, datasets, tasks, and evaluation procedures.
- A control mechanism in a research model does not imply that Suno exposes the same control or interprets a text prompt equivalently.
- Community syntax observations remain provisional until independently replicated.
- Preserve disagreements and failures rather than collapsing them into a universal prompting rule.

## Retrieval date
2026-11-10
