# Voynich Audio Analysis Protocol

**Version:** 0.1  
**Status:** Initial protocol for reproducible exploration  
**Scope:** Twelve Voynich-derived recordings in the current conversation corpus

## 1. Objectives

1. Describe each recording as a time-varying acoustic and musical object.
2. Separate timing, pitch, melody, harmony, timbre, dynamics, spatial behavior, and form.
3. Identify repeated passages without confusing sustained beds, repeated instrumentation, or periodic noise with melodic motifs.
4. Compare tracks without assuming a shared key, meter, genre, or formal grammar.
5. Connect musical observations to glyph sequences only after the source mapping is recovered.

## 2. Provenance and integrity

For every input, record:
- exact original filename and source context;
- file size, codec, sample rate, channels, duration;
- cryptographic hash of original file;
- decoder/library and version;
- any resampling, mono conversion, normalization, filtering, or derivative creation.

Originals are immutable. All analysis uses documented working derivatives.

## 3. Layered analysis

### 3.1 Technical signal checks
- decode validity;
- duration and channel count;
- sample peak and clipping count;
- RMS and loudness over time;
- DC offset;
- silence and near-silence regions;
- stereo correlation and side/mid energy.

### 3.2 Event activity
Use at least two complementary methods:
- spectral-flux or energy-based onset detection;
- transient/attack detection with a second parameterization.

Report sensitivity to hop size, threshold, and minimum event separation. Onset count is not synonymous with percussion count.

### 3.3 Pulse and meter candidates
- estimate periodicity from onset strength and amplitude envelope separately;
- retain multiple plausible pulse candidates;
- report period in seconds and converted BPM;
- test integer and simple rational relationships;
- inspect local tempo drift;
- do not infer meter from BPM alone.

A pulse estimate is a candidate until listening or source arrangement provides independent confirmation.

### 3.4 Pitch and melodic material
Use multiple approaches:
- STFT chroma for broad pitch-class occupancy;
- CQT or equivalent pitch-aligned representation;
- predominant-F0 extraction where polyphony permits;
- multi-pitch candidates for dense arrangements;
- melodic contour based on ordered note events only when note extraction confidence is adequate.

Global chroma describes pitch vocabulary. It does not establish key, melody, or chord progression.

### 3.5 Timbre and latent components
- spectral centroid, bandwidth, flatness, rolloff, and MFCCs;
- harmonic/percussive decomposition as a heuristic, not source truth;
- recurring spectral peaks and stable component trajectories;
- low/mid/high band envelopes;
- stereo positioning and correlated component movement.

Do not call an NMF or spectral cluster a physical instrument or source without validation.

### 3.6 Form and recurrence
- create feature sequences at documented temporal resolution;
- compute self-similarity matrices;
- test local subsequence recurrence;
- compare ordered features, not only pooled profiles;
- detect repeated sections and transition boundaries;
- exclude constant or nearly constant beds from melodic recurrence claims.

## 4. Recurrence controls

A candidate match must be compared against:
1. a time-shuffled within-track null;
2. a feature-permuted null that preserves approximate distribution;
3. nearby alternative windows;
4. a baseline of constant-tone or sustained-bed similarity.

Record:
- window length and hop;
- minimum separation;
- similarity metric;
- best and runner-up matches;
- null distribution and empirical p-value or percentile;
- number of comparisons;
- effect size;
- proportion of frames with meaningful pitch/event activity.

Avoid reporting the maximum similarity alone. Multiple-comparison correction or a preregistered small set of comparisons is required for strong claims.

## 5. Cross-track comparisons

Compare feature families separately:
- pitch-class distribution;
- rhythmic/event interval distribution;
- pulse candidate families;
- melodic interval/contour vocabulary;
- timbral fingerprints;
- recurrence structures;
- section-transition profiles.

A high similarity in one family must not be generalized to musical identity. Normalize for duration and recording differences where appropriate, and report uncertainty.

## 6. Long-track handling

For Cheaiin Cthaichar:
- analyze in chunks with overlap;
- retain global timestamps;
- compare chunk boundaries to ensure no artificial discontinuity;
- report within-chunk and cross-chunk recurrence separately;
- make whole-track summaries using duration-weighted aggregation.

## 7. Source-mapping test (later phase)

The glyph-to-music test requires:
- exact glyph transcription or glyph IDs;
- folio/page/line locations;
- exact glyph-to-note map and exceptions;
- segmentation rules;
- treatment of spaces, ligatures, repeated forms, and uncertain glyphs;
- note duration and velocity rules;
- instrument assignment;
- overlapping folios or lines;
- percussion-generation method;
- post-mapping arrangement and editing.

Then test:
- whether repeated glyph sequences align with recurring ordered musical events;
- whether glyph transition statistics predict interval or event-transition statistics;
- whether models trained on one region predict another;
- whether these relations outperform shuffled glyph sequences and alternative mappings.

## 8. Reporting template

Each finding should be labeled:
- **OBSERVATION:** direct listening or measurement result.
- **MEASUREMENT:** named method, parameters, result, and caveats.
- **INTERPRETATION:** musical explanation consistent with the evidence.
- **HYPOTHESIS:** testable explanation not yet established.
- **UNKNOWN:** evidence not presently available.

Never conflate a generated-model description with an independent measurement.
