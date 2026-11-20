# Voynich Audio Lab: Initial Findings and Open Questions

**Date:** 2026-11-20  
**Status:** Exploratory; prior calculations require independent rerun  
**Evidence basis:** Conversation-provided audio recordings, user descriptions, Suno descriptions, and existing KMcKM Voynich sketches.

## Scope

Twelve recordings were supplied:
Cheaiin Cthaichar; Daiin Yteedy; Eeeodaiin; Fachys Ykal; Gdam S08 Hzoarg; Kchdpy Shey; Ohcoe Odal; Pochaiin Cthor; Qokaiin; Sal Okeedy; Sory Ckhar O!; Ykeeos.

No original glyph-to-note table or complete mapping recipe has yet been recovered in the accessible conversation material.

## Direct user observations

- The tracks are experimental and can be somewhat chaotic, but are not unlistenable or unstructured.
- The original project mapped Voynich characters to notes, selected pages that sounded best, selected instruments, overlapped some folios, and included percussion whose generation method is not presently recalled.
- The 14-minute track was initially unsatisfying until it was slowed down substantially.
- Suno generated a detailed description for Daiin Yteedy that characterized it as minimalist IDM with complex glitch percussion, sparse repeating two-note synth motif, sine bass, pads, 120 BPM, C minor. This is a model-generated interpretation, not a verified transcription.
- A mashup of Kchdpy Shey and Greasy Fjord Hands contributed little recognizable Kchdpy character, according to the user.
- Separate mashups involving Eeeodaiin and A Bath For Two produced a chiptune-oriented recombination. These are useful creative observations but do not establish properties of the Voynich source.

## Prior exploratory measurements (not yet independently verified)

Previous analysis passes reported:
- approximate total collection duration of 2:01:59;
- a strong pulse candidate near 99.4 BPM for Daiin Yteedy, with competing half/double-time interpretations possible;
- candidate ordered pitch-class sequence recurrence in Daiin near 10:28 and 11:12;
- candidate recurrence in Gdam S08 Hzoarg and Ohcoe Odal;
- greater pitch-environment stability in some tracks and greater variation in others;
- a possible shared global pitch-class vocabulary among Daiin, Kchdpy, and Cheaiin.

These are leads only. Earlier methods had issues including uncorrected multiple comparisons, harmonic-bed false positives, short sample counts, and pitch-class features that cannot prove melody. Recompute all metrics from source audio before treating any numerical result as a finding.

## Important methodological cautions

1. A constant pitch bed can generate very high sequence similarity without a recurring melody.
2. A global chroma profile cannot establish key, mode, or chord progression.
3. An onset periodicity is not automatically the performed beat or meter.
4. Similar pitch vocabularies do not demonstrate common source glyphs or shared melodic structure.
5. The music-to-Suno description process is another interpretation layer and can introduce genre, tempo, key, instrument, and formal assumptions.
6. Any musical organization may come from the mapping, the selection of folios, the overlap/orchestration, the instrument choices, or later editing rather than the Voynich manuscript itself.

## Most promising next questions

- Does Daiin contain a genuinely repeated ordered motif, or only recurring pitch environments?
- Does the long Cheaiin recording contain large-scale formal cycles, and are these independent of repeated spectral beds?
- Are tracks with similar global pitch-class profiles also similar in ordered interval sequence?
- Do pulse candidates correspond to event recurrence at simple rational ratios?
- Are there recurring multi-component / latent-source behaviors analogous to those previously identified in the KMcKM analyses of Undeciphered Language and First On A New World?
- Can any musical recurrence be tied to repeated glyph sequences once the mapping and source folios are recovered?

## Current next action

Recover and formalize the original mapping recipe and page/folio provenance. Independently rerun the audio analysis under ANALYSIS_PROTOCOL.md, beginning with Daiin Yteedy as a manageable test case and then Cheaiin Cthaichar using chunked processing.
