# Two-track atlas study: Falcon Wind Falcon and Squidgy Pocalypse Yodel

**Run date:** 2026-11-20  
**Status:** Exploratory first pass  
**Method:** Multidimensional Musical Atlas v0.1  
**Analysis rate:** 11,025 Hz mono working derivative  
**Feature hop:** 0.5 seconds  
**Originals:** preserved unchanged; SHA-256 hashes below.

## Source inventory

| Track | Duration | Original format | SHA-256 |
|---|---:|---|---|
| 000 Falcon Wind Falcon.wav | 252.36 s | WAV, 48 kHz, stereo | `bbf3ba0654c0a75a0b586278e723fc9f9089b31f77fbce62ff3c57d6ad60a724` |
| 0000 Squidgy Pocalypse Yodel.wav | 198.00 s | WAV, 48 kHz, stereo | `653fc17173cd2157534562ac46ffcb239f338b1bedf9727385926b2c18874614` |

## Feature spaces

- **Rhythm:** onset-strength envelope, low/mid/high band energy, and local onset autocorrelation candidates.
- **Tonal:** framewise STFT chroma.
- **Timbre:** MFCCs, spectral centroid, and spectral flatness.

Each feature frame is compared with every other frame in the same recording using cosine similarity. The 0.5-second hop means the matrix index can be converted to approximate time by multiplying by 0.5.

## Preliminary observations

### 000 Falcon Wind Falcon

- The rhythm self-similarity map contains several broad regions and recurring horizontal/vertical bands, suggesting that some rhythmic/acoustic states recur at separated times.
- The map appears to change character around the middle and later portions of the track. Candidate transitions deserve a closer local analysis.
- The tonal matrix is broadly bright and finely textured. This may reflect recurring pitch-class mixtures or a relatively persistent tonal vocabulary; it does not by itself establish repeated melodies or harmonic progressions.
- The timbral map is more differentiated, with visible changes in local texture and some recurring bands.

### 0000 Squidgy Pocalypse Yodel

- The rhythm map contains conspicuous block-like regions, especially in the early-to-middle portion, plus later returns to some similar states.
- The tonal matrix is also broadly similar across many frame pairs, but has visible vertical/horizontal bands indicating moments that differ from the general tonal texture.
- The timbral matrix shows a dense, changing texture with several local regions of stronger similarity.

### Listening note

Only short opening excerpts were auditioned in this pass. The visual observations above are measurements/visual inspection, not full-track listening descriptions.

## Important limitations and correction

The initial script's cross-track pooled-profile calculation standardizes each track profile across the two-track set. With exactly two tracks this makes the standardized profiles antipodal, producing a meaningless cosine similarity of -1.0 in all three feature families. **Those cross-track profile scores are invalid and must not be interpreted.** The within-track self-similarity matrices are unaffected.

The next cross-track comparison should use a valid distributional representation (for example, feature-wise quantiles or histograms, with an explicitly defined distance) and should separately compare time-varying sequences using subsequence matching or DTW. No cross-track similarity conclusion is made in this report.

Other limitations:
- Mono working derivatives omit stereo position and width.
- Rhythm autocorrelation values are candidate periodicities, not verified beats or meter.
- STFT chroma is a pitch-class descriptor, not note transcription.
- MFCC similarity is not source/instrument identification.
- High self-similarity can arise from sustained beds or stable textures, not only compositional recurrence.
- This is a coarse first pass, not a statistically validated motif search.

## Next analyses

1. Correct cross-track comparison using feature-distribution distances.
2. Time-warp-tolerant comparison of local rhythm, tonal, and timbral sequences.
3. Detect and inspect candidate repeated blocks, with a minimum-duration constraint.
4. Add stereo mid/side and channel-correlation features.
5. Compare each track with controlled synthetic baselines (ostinato, AABA, ABAB, rondo, through-composed, polymetric, tempo-shifting).
6. Listen to selected segments around candidate boundaries and test whether measured transitions correspond to perceptible musical changes.

## Reproducibility

The original audio is not copied into this public repository. Keep local source files unchanged and rerun the analysis script against the originals. Store derivatives separately and retain their source hashes and analysis parameters.
