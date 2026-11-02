# Toolbox Inventory

**Inventory revision:** 2026-11-01  
**Scope:** Initial catalog from the supplied research conversations, local materials, and selected GitHub repositories.  
**Maturity:** A first-pass inventory, not a complete audit or an installation plan.

## How to read this inventory

- **Core** means it already has a clear place in the intended workflow.
- **Candidate** means it looks useful but needs local testing or deeper review.
- **Reference** means its ideas, examples, or architecture may inform our own work, but we are not proposing to depend on it.
- **Experimental** means it is a user-created prototype or an unvalidated research direction.
- **Hold** means a material limitation, maintenance issue, rights question, or integration cost currently argues against adoption.

The status applies to our project, not to the general quality of the external tool.

## 1. Composition and exact musical structure

### Sonic Pi
- **Role:** Executable composition environment and structural laboratory.
- **Project:** [sonic-pi-net/sonic-pi](https://github.com/sonic-pi-net/sonic-pi)
- **Project fit:** Core.
- **Known user baseline:** Sonic Pi 4.5.1 ("8oh8") on Windows 10 22H2, from the supplied environment notes. This is a recorded baseline, not confirmation of the currently installed version.
- **Why it matters:** It lets us specify and test exact timing, independent cycles, event relationships, synthesis, effects, and live behavior. It is a natural execution backend for a formal MusicBlueprint.
- **Cautions:** The user's cheatsheets and environment notes are version-specific working references. Validate method names, chord names, timing behavior, and platform assumptions against the installed version before turning them into shared abstractions.
- **License note:** The upstream license describes the main source code as MIT, while also noting GPLv3-linked components and separate terms for the web application. This is not a blanket license statement for every bundled dependency.

### sonicpi-metre
- **Role:** Research reference for nested metrical trees, rational durations, and probabilistic microtiming.
- **Project:** [MaxTheComputerer/sonicpi-metre](https://github.com/MaxTheComputerer/sonicpi-metre)
- **Project fit:** Candidate for ideas; not a production dependency.
- **Why it matters:** Its metrical-tree approach is close to the independent time-domain and nested-cycle model we want.
- **Cautions:** The reviewed implementation uses Sonic Pi internals, including `__thread_locals` and `SonicPi::Core::SPRand`. Those interfaces should be treated as unstable. The prior review recorded an MIT license; recheck the exact revision before reuse.

### sonic-pi-tool
- **Role:** Command-line runner and OSC control reference for Sonic Pi.
- **Project:** [emlyn/sonic-pi-tool](https://github.com/emlyn/sonic-pi-tool)
- **Project fit:** Candidate.
- **Why it matters:** It may help automate script evaluation, execution, recording, and stopping.
- **Cautions:** Its README documents a Windows limitation around starting the Sonic Pi server. Our Windows workflow needs a direct test before adoption. The prior review recorded MPL-2.0; recheck the exact revision before reuse.

### User-authored composition prototypes
- **Drum-tab converter:** In `BIGMOOSIK.txt`. Text notation uses named instrument lines and pipe-delimited patterns; blank lines delimit bars and lines in a bar are simultaneous. A flam feature was listed as unfinished.
- **CODEWALKER chord path prototype:** Also in `BIGMOOSIK.txt`. Accepts chord symbols or note collections, normalizes chord sizes, and seeks a short stepwise path between chords.
- **Project fit:** Experimental, high priority for audit.
- **Next action:** Extract the original code unchanged, document its behavior, add tests, and only then refactor. These prototypes could become early rhythm-notation and voice-leading modules.

## 2. Generative systems

### Suno
- **Role:** Primary black-box generative music system and prompt-experiment target.
- **Project fit:** Core.
- **Use:** Generate full musical interpretations from perceptual, stylistic, structural, and lyrical descriptions; compare prompt variants and audio references.
- **Current observations:** The user's experiments suggest that culturally recognizable rhythmic language and performance descriptions can communicate certain complex rhythmic behaviors more effectively than raw arithmetic. This is an empirical hypothesis, not a universal rule.
- **Important product distinction:** Suno Studio's time-signature selector adjusts the editing grid and metronome; it is not sent to the generation model. Meter and structural behavior must be requested in the prompt and checked in the resulting audio.
- **Versioning:** Record model/version, mode, sliders, reference inputs, lyrics field, style field, exclusions, and date for every run. Historical prompt limits and token conventions must not be assumed to remain current.
- **Integration note:** An official Suno MCP beta was announced on 2026-10-28. It requires a separate user-authorized connection. No Suno integration is configured in this project yet.

### MusicGen / AudioCraft
- **Role:** Alternate generative backend for instrumental and controlled comparisons.
- **Project:** [facebookresearch/audiocraft](https://github.com/facebookresearch/audiocraft)
- **Project fit:** Candidate for comparative experiments.
- **Upstream README describes:** MusicGen text-to-music; AudioGen text-to-sound; EnCodec; MAGNeT; MusicGen Style; and JASCO, which is described as conditioning on chords, melodies, and drum tracks.
- **Why it matters:** It provides a different generative system against which we can test whether a prompt concept is robust or Suno-specific. JASCO's stated conditioning makes it particularly relevant to future structured-input experiments.
- **License:** AudioCraft code is MIT. The repository README states that its model weights are CC-BY-NC 4.0. Code and weights must be tracked separately; do not assume commercial-use permission for those weights.
- **Cautions:** Installation, hardware needs, model-specific constraints, and checkpoint terms need a separate feasibility test.

## 3. Vocal generation and transformation

### Bark
- **Role:** Speech and general text-to-audio generation; possible guide-vocal or phonetic stimulus source.
- **Project:** [suno-ai/bark](https://github.com/suno-ai/bark)
- **Project fit:** Candidate for targeted vocal experiments, not a default singing engine.
- **Upstream README describes:** Transformer-based text-to-audio generation, including multilingual speech, music, background noise, sound effects, and nonverbal vocalizations. It explicitly warns that generation can deviate from prompts.
- **License:** MIT. The upstream README states that pretrained checkpoints are available for commercial use; verify the exact checkpoint and current terms before use.
- **Cautions:** Speech generation is not equivalent to controllable singing. Do not infer precise meter, note values, or lyric alignment without measuring the output.

### RVC
- **Role:** Voice conversion and voice-model training.
- **Project:** [RVC-Project/Retrieval-based-Voice-Conversion-WebUI](https://github.com/RVC-Project/Retrieval-based-Voice-Conversion-WebUI)
- **Project fit:** Candidate for controlled timbre experiments.
- **Upstream README describes:** Training and inference for voice conversion, retrieval-assisted feature replacement, pitch extraction, and a WebUI. The currently inspected README gives a Python 3.12 setup and Windows instructions.
- **License:** MIT for the repository code. Training recordings, pretrained models, datasets, and individual voice-model rights are separate questions.
- **Cautions:** Voice conversion changes timbral identity characteristics; it does not automatically create a convincing sung performance from arbitrary speech. Use only voices and recordings for which we have appropriate authorization.

### Vocalis.ai / Big Pickle
- **Role:** Example architecture for a decoupled song-generation pipeline.
- **Project:** [denizcihatgunsel-star/vocalis.ai](https://github.com/denizcihatgunsel-star/vocalis.ai)
- **Project fit:** Reference only; do not adopt as a dependency yet.
- **Described pipeline:** MusicGen instrumentals, Bark/XTTS guide vocals, RVC conversion, Demucs source separation, Pedalboard/FFmpeg post-processing, with a Next.js frontend and FastAPI/Celery backend.
- **Inspection notes:** The repository had one recorded commit dated 2026-09-10. The inspected code showed a simpler implementation than some README claims, including basic line-slot vocal timing. Several frontend/backend integration concerns were identified in the prior first-pass review. No repository LICENSE file was found in the inspected default branch.
- **Why retain it:** It is a useful integration map and a source of testable design ideas. It is not evidence that the complete end-to-end pipeline works as advertised.

## 4. Audio analysis, separation, and processing

### Demucs
- **Role:** Music source separation, particularly vocals, drums, bass, and accompaniment.
- **Project:** [facebookresearch/demucs](https://github.com/facebookresearch/demucs)
- **Project fit:** Candidate for stem-analysis experiments; hold as a new long-term dependency.
- **Upstream README describes:** Hybrid Transformer Demucs (HTDemucs) and related models for music source separation.
- **License:** MIT for the repository code.
- **Maintenance:** The repository is archived. Its README says the original project is no longer maintained and points to a fork, while also warning that the fork is not actively maintained. Pin versions and test carefully; compare with currently maintained alternatives before choosing a production dependency.
- **Use in our work:** Separate generated songs into stems so we can inspect vocal phrasing, bass behavior, percussion, and arrangement independently.

### Pedalboard
- **Role:** Python audio I/O, effects, and rendering.
- **Project:** [spotify/pedalboard](https://github.com/spotify/pedalboard)
- **Project fit:** Candidate for an audio-processing backend.
- **Upstream README describes:** Audio file reading/writing, resampling, live audio effects, built-in EQ/filter, dynamics, spatial, pitch, distortion, and bitcrush effects, plus VST3 and Audio Unit plugin support on supported platforms.
- **License:** GPL-3.0. This is a significant integration and distribution constraint. Keep the library behind a clean optional adapter until license compatibility is reviewed.
- **Cautions:** Test Windows support and plugin behavior in the actual target environment.

## 5. Sonic Pi ecosystem references

These repositories are references, not dependencies:

| Repository | Potential use | Current assessment |
|---|---|---|
| [dcts/sonicPi-compositions](https://github.com/dcts/sonicPi-compositions) | Live-loop, effects, and OSC composition examples | Reference; selected README/source review only |
| [rbnpi/SonicPi-Tutorials](https://github.com/rbnpi/SonicPi-Tutorials) | Tutorials and teaching examples | Reference; materials target older Sonic Pi generations |
| [josephwilk/shader-pi](https://github.com/josephwilk/shader-pi) | Sonic Pi plus OpenGL/shader visualization | Future visualization reference |
| [JonLevin25/SonicPi-Unity-OSC-Experiment](https://github.com/JonLevin25/SonicPi-Unity-OSC-Experiment) | OSC-driven Unity visualization | Future visualization reference |
| [luiscript/SonicPi-Music](https://github.com/luiscript/SonicPi-Music) | Composition and sample inspiration | Reference corpus; inspect licensing before copying material |
| [mbutz/sonicpi-leuphana-ws1718](https://github.com/mbutz/sonicpi-leuphana-ws1718) | Algorithmic composition and analysis exercises | Archived educational reference |
| [MarcScott/7-CS-SonicPi](https://github.com/MarcScott/7-CS-SonicPi) | Potential educational material | Repository resolves, but content review was not completed |

The initial repository review was selective, not a complete code or license audit.

## 6. User-supplied musical knowledge and experimental corpus

These are project assets, not third-party software:

- **GENECLECT terminology corpus:** 304 working entries in a three-column CSV. Treat as a draft lexicon; normalize spelling and duplicates, and distinguish established terms from user-coined terms.
- **Genre and tradition material:** `GENRELAB.txt`, `GENROLOGY.txt`, and the Genrebuild conversation. Preserve native terminology and source attribution; separate verified descriptions from extrapolation.
- **Suno prompt experiments:** `SONGPLAY.txt`, `GOODSONG EXPERIMENTS.txt`, and prompt material in the Genrebuild conversations. Preserve original strings exactly. Treat apparent syntax as experimental prompt grammar, not executable code.
- **Sonic Pi references:** `SONIC_PI_environment_rules.txt`, `SONIC PI CHEATSHEETS.txt`, and `EXPERIMENT_PROGRESSION.txt`. Version-tag and test before reuse.
- **Composition sketches:** `BIGMOOSIK.txt`, `songsketch.txt`, and `melodywork.txt`. Keep source versions intact.
- **Reference tracks:** `TOP SONGS 2017-20.txt`. Enrich with feature annotations and reasons for selection rather than reducing it to a static preference profile.
- **Private lyric and prose materials:** Keep private unless explicitly approved for publication and rights have been checked.

## 7. Immediate work queue

1. Extract and test the drum-tab converter and CODEWALKER prototypes without changing their originals.
2. Create a versioned Sonic Pi 4.5.1 Windows environment profile and validate the supplied cheatsheet against the actual installation.
3. Define the first MusicBlueprint schema for timeline, independent cycles, events, layers, harmony, melody, prosody, and relationships.
4. Build a small reproducible comparison: one formally specified rhythmic design, rendered in Sonic Pi and translated into Suno and MusicGen prompts.
5. Test Demucs stem extraction and Pedalboard processing on a small set of audio files.
6. Decide whether Bark and RVC add enough value to justify their setup and data-management costs.
7. Expand this inventory only when a tool has a concrete role, evidence, provenance, and a recorded next action.
