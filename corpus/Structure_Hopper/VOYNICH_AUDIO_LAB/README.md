# Voynich Audio Lab

**Status:** Active exploratory case study  
**Parent project:** KleineMcKnightMusic  
**Branch:** `research/voynich-audio-lab`  
**Purpose:** Investigate musical organization in Nathan's twelve Voynich-derived audio tracks, then connect measured musical structures to the source glyph sequences and composition mappings when those records are available.

This workdesk is a focused addition to the existing Structure Hopper. It does not replace the three earlier Sonic Pi Voynich sketches or the broader music workdesk.

## Research question

What repeatable musical structures occur in the twelve recordings, how do they differ across tracks, and which properties can be traced to the underlying glyph sequences rather than to note mapping, orchestration, production, or later arrangement?

## Evidence discipline

Keep separate:

1. **Source artifact:** original audio, original glyph/folio source, note mapping, and composition instructions.
2. **User observation:** Nathan's account of how the pieces were constructed and how they sound.
3. **Measurement:** result of a specified signal-analysis procedure, with parameters and limitations.
4. **Interpretation:** musical reading of measured behavior.
5. **Hypothesis:** candidate explanation requiring further testing.

Suno's generated descriptions are model interpretations, not direct measurements and not independent evidence about the Voynich manuscript.

Do not report tempo, meter, key, melody, phrase, or instrument as established solely from generic audio features. Distinguish beat candidates from verified pulse; pitch-class profiles from note transcription; repeated timbral/harmonic beds from melodic recurrence.

## Initial corpus

The twelve audio files were supplied in the conversation on 2026-11-20:

- Cheaiin Cthaichar
- Daiin Yteedy
- Eeeodaiin
- Fachys Ykal
- Gdam S08 Hzoarg
- Kchdpy Shey
- Ohcoe Odal
- Pochaiin Cthor
- Qokaiin
- Sal Okeedy
- Sory Ckhar O!
- Ykeeos

The audio is retained in the conversation source context; no audio binaries are copied into this public repository. Obtain stable source references, hashes, and rights review before any redistribution or repository mirroring.

## Analysis plan

### A. Establish the signal baseline
- Decode each source with recorded codec/sample-rate/channel metadata.
- Preserve original files unchanged.
- Produce checksummed working derivatives only when required.
- Analyze the long Cheaiin track in chunks, with overlap handling and boundary checks.
- Document silence, clipping, channel imbalance, and sample-rate conversion.

### B. Separate musical dimensions
- Event/onset density and event timing.
- Pulse candidates and competing metrical interpretations.
- Pitch-class occupancy and temporal chroma.
- Fundamental-frequency candidates and melodic contour where extraction is reliable.
- Bass and low-frequency movement.
- Spectral/timbral components and their recurrence.
- Self-similarity and section boundaries.
- Stereo/spatial organization and dynamic envelope.

### C. Recurrence tests
- Compare ordered sequences, not just global averages.
- Exclude trivial constant-tone matches and sustained harmonic-bed matches.
- Use null comparisons and within-track shuffled controls.
- Correct for multiple comparisons or use a small preregistered candidate set.
- Report effect sizes, candidate counts, duration coverage, and confidence.

### D. Cross-track comparison
- Compare feature distributions and motif candidates.
- Distinguish shared pitch vocabulary from shared ordered motifs.
- Look for structural families without assuming one common musical grammar.

### E. Source-to-music bridge
When source records are available:
- encode the glyph sequence and segmentation explicitly;
- document the exact glyph-to-note assignment and any exceptions;
- document folio selection, omissions, overlaps, instrumentation, tempo changes, percussion, and post-processing;
- test whether musical recurrence corresponds to glyph recurrence or structural analogues;
- compare against randomized or alternative mappings.

## Existing KMcKM materials to consult

- `corpus/Sonic_Pi/VOYNICH f1r FIRST LINE AS CHORDS.rb`
- `corpus/Sonic_Pi/VOYNICH f95r2.rb`
- `corpus/Sonic_Pi/VOYNICH the three circles f67r1.rb`
- `corpus/Structure_Hopper/Undeciphered___periodic_event_candidates.csv`
- `corpus/Structure_Hopper/Undeciphered___longest_latent-source_spans.csv`
- `corpus/Structure_Hopper/First_On_A_New_World___latent_source_guide.csv`
- `corpus/Structure_Hopper/track_by_track_salvage.csv`
- `corpus/Structure_Hopper/TVNK_first-pass_metrics.csv`
- `corpus/Structure_Hopper/TVNK_melody_and_note_summary.csv`

The previous Undeciphered Language and First On A New World analyses provide useful precedents for latent spectral objects, recurring event components, multi-clock structures, and pitch/timbre separation. Their methods must be inspected and validated before direct reuse.

## First working observations

These are exploratory leads, not established findings:

- Daiin Yteedy appears to contain a candidate recurrence in ordered pitch-class material around 10:28 and 11:12. This must be retested with controls for sustained pitch beds and multiple comparisons.
- Gdam S08 Hzoarg and Ohcoe Odal also produced candidate recurrent sections in a prior sequence scan. Those require the same validation.
- Several recordings appear to differ substantially in pitch-environment stability.
- Similar global pitch-class distributions across tracks do not by themselves demonstrate shared melody or source structure.
- The earlier pulse estimates are algorithmic candidates and may represent half-time, double-time, subdivisions, or non-musical periodicity.

## Deliverables

- `TRACK_INVENTORY.csv`: source identifiers and technical properties.
- `ANALYSIS_PROTOCOL.md`: reproducible analysis methods and thresholds.
- `TRACK_FEATURES.csv`: per-track measurements with method/version fields.
- `RECURRENCE_CANDIDATES.csv`: candidate repeated passages with controls and diagnostics.
- `CROSS_TRACK_COMPARISONS.csv`: pairwise similarities by feature family.
- `SOURCE_MAPPING.md`: glyph-to-music construction history as recovered.
- `FINDINGS.md`: evidence-separated observations, interpretations, hypotheses, and next tests.
- scripts and tests under `tools/`.

## Immediate next action

Recover the original character-to-note mapping and determine which audio tracks correspond to which pages, folios, lines, and compositional transformations. In parallel, rerun the audio measurements from the original audio files with a documented, tested pipeline. Do not use earlier assistant-generated summary numbers as authoritative measurements.
