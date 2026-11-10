# Mining snapshot: prompt structures, control, and model behavior

Retrieved 2026-11-10. This is a compact research snapshot, not a transcript or bulk scrape. Summaries below are attributed and separated from interpretation.

## Research and technical sources

### Mustango: Toward Controllable Text-to-Music Generation
- Source: https://aclanthology.org/2024.naacl-long.459/
- Authors: Jan Melechovsky et al.
- Evidence type: peer-reviewed research paper.
- Finding: proposes text-to-music diffusion conditioned not only on general captions but on musical attributes such as chords, beats, tempo, and key. A music-informed guidance module is used to steer generation.
- Why it matters as an idea source: natural language can be treated as a carrier for several different kinds of musical constraint, not just genre/mood description.

### Music ControlNet: Multiple Time-Varying Controls for Music Generation
- Source: https://gclef-cmu.org/static/pdfs/2024musiccontrolnet.pdf
- Authors: Shih-Lun Wu et al.
- Evidence type: peer-reviewed technical paper.
- Finding: addresses a limitation of global text controls by introducing time-varying controls for melody, dynamics, and rhythm.
- Idea source: temporal instructions can be represented as a sequence or trajectory rather than a single global description.

### MuseControlLite
- Source: https://proceedings.mlr.press/v267/tsai25a.html
- Authors: Fang-Duo Tsai et al.; ICML 2025.
- Evidence type: peer-reviewed research paper.
- Finding: lightweight conditioning with positional information improves control over time-varying musical attributes; discusses melody control, inpainting, and outpainting.
- Idea source: positional encoding and localized conditioning suggest ways to think about prompts as spatial/temporal placement, not merely word lists.

### SegTune: Structured and Fine-Grained Control for Song Generation
- Source: https://aclanthology.org/2026.acl-long.586/
- Authors: Yuejiao Wang et al.; ACL 2026.
- Evidence type: peer-reviewed research paper.
- Finding: global prompts provide stylistic coherence while segment prompts are aligned to song time windows; an LLM-based duration predictor supports lyric-to-music alignment.
- Idea source: global/segment duality, temporal broadcast, and sentence-level timestamps are alternative structural metaphors for arranging instructions.

### Recent advances in music generation: methods, evaluation, and challenges
- Source: https://link.springer.com/article/10.1007/s10462-026-11582-x
- Authors: Wei Duan, Yi Yu, Jean-Pierre Briot; published 2026-06-02.
- Evidence type: open-access survey.
- Finding: surveys symbolic, audio, and multimodal generation; identifies continuing challenges in long-range structure, cross-modal consistency, controllability, representation, and evaluation.
- Idea source: multiple representations (event sequences, piano rolls, scores, embeddings, audio) can be treated as different ways to describe or manipulate the same musical object.

## Official Suno documentation

### Creative Sliders
- Source: https://help.suno.com/en/articles/6141377
- Edited: 2025-06-03.
- Evidence type: official product documentation.
- Public description: Weirdness ranges from Safe to Chaos, with 50% described as the normal expected result; Style Influence controls closeness to style input; Audio Influence appears with audio uploads.
- Caution: this documents the user-facing control description, not the underlying mathematical mechanism.

### Exclude
- Source: https://help.suno.com/en/articles/3161921
- Edited: 2025-12-19.
- Evidence type: official product documentation.
- Public description: Exclude is entered under Advanced Options in Custom Mode and is intended for elements the creator does not want in the track.
- Idea source: positive and negative descriptions may occupy distinct interface channels. Do not assume that writing a negation in a positive style field is equivalent to using Exclude.

### Custom Mode
- Source: https://help.suno.com/en/articles/3726721
- Edited: 2025-12-19.
- Evidence type: official product documentation (Android workflow).
- Public description: Custom Mode supports user lyrics or generated lyrics, an instrumental toggle, Styles, Advanced options, and title.

### Voices FAQ
- Source: https://help.suno.com/en/articles/11362433
- Edited: 2026-03-26.
- Evidence type: official product documentation.
- Public description: Voices replaced the Create-menu Personas entry; Style Personas remain accessible within Voices. The article describes voice creation and Audio Influence.
- Caution: feature availability and UI may vary by account/model/region.

## Community observations and theories

### V6 prompt field notes
- Source: https://www.reddit.com/r/SunoAI/comments/1wcyryw/unofficial_suno_v6_prompting_guide_what_has_been/
- Date shown: 2026-09-10.
- Evidence type: individual creator report, explicitly unofficial.
- Reports both problems (distant vocals, disappearing layers, stutters, volume changes, premature endings) and productive outcomes (genre hybrids and rhythms).
- Useful as a failure-and-surprise source, not a reliable model-wide benchmark.

### V5.5 prompt structure
- Source: https://www.reddit.com/r/SunoAI/comments/1s73tgz/v55_prompt_structure/
- Date shown: 2026-03-29.
- Evidence type: creator observation.
- Author reports better results from fewer descriptors, explicit performance direction, and separating sound from delivery.
- This conflicts with other community advice favoring dense, highly detailed prompts. Preserve the disagreement rather than collapsing it into one rule.

### Combined bracket tags
- Source: https://www.reddit.com/r/SunoAI/comments/1tau0gh/suno_prompting_guideopen_agent_skill/
- Date shown: 2026-05-12.
- Evidence type: creator-developed workflow.
- Suggests combining section label, cue, and performance direction in one bracketed line rather than stacking adjacent tags.
- Example pattern reported: `[Bridge - Quiet Contrast, whispered]`.
- Not an official syntax specification.

### Channel-like bracket syntax
- Source: https://www.reddit.com/r/SunoAI/comments/1u0oil5/lyrics_prompt_is_all_you_need/
- Date shown: 2026-06-08.
- Evidence type: community theory and personal examples.
- Proposes using bracketed named channels for drum, sub, pad, and vocal properties, with descriptors separated by pipes.
- This is an interesting user-invented representation. The post's claims about how the model reads it are unverified.

### Conflicting syntax reports
- Source: https://www.reddit.com/r/SunoAI/comments/1oj9bkp
- Date shown: 2025-10-29.
- Evidence type: short community discussion.
- Users disagree about whether brackets, parentheses, or other punctuation reliably distinguish directions from lyrics; some report prompt text being sung.
- Useful as evidence that formatting conventions are probabilistic and context/version-sensitive.

### Prompt guide claiming analysis of 12,754 songs
- Source: https://hookgenius.app/learn/suno-prompt-guide-2026/
- Updated: 2026-10-29.
- Evidence type: commercial third-party analysis claim.
- Describes four Custom-mode fields (Style, Lyrics, Exclude Styles, Title) and claims observations from 12,754 songs made using its own service.
- Treat its sample, selection effects, and methodology as unverified until audited. It is not an independent representative sample of all Suno use.

## Caution

Community claims about hidden prompt channels, token weights, syntax parsing, or special strings are not evidence of Suno's internal architecture. They are candidate observations or hypotheses. Preserve both successful and failed reports, including contradictory ones.
