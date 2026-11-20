#!/usr/bin/env python3
"""Reproducible first-pass feature extraction for the Voynich Audio Lab.

Reads audio files from a directory and writes:
- track_inventory.csv
- track_features.csv
- run_manifest.json

Optional dependencies: librosa, soundfile, numpy, scipy.
This script intentionally does not claim key, meter, or melodic transcription.
"""
from __future__ import annotations
import argparse, csv, hashlib, json, math, platform, sys
from pathlib import Path
from typing import Any

AUDIO_EXTS = {".wav", ".mp3", ".m4a", ".flac", ".ogg", ".aiff", ".aif"}

def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("input_dir", type=Path)
    ap.add_argument("--out", type=Path, default=Path("voynich_analysis"))
    ap.add_argument("--chunk-seconds", type=float, default=120.0)
    ap.add_argument("--hop-seconds", type=float, default=0.25)
    args = ap.parse_args()
    try:
        import numpy as np
        import soundfile as sf
        import librosa
        import scipy
    except Exception as e:
        print(f"Missing dependency: {e}", file=sys.stderr)
        return 2

    files = sorted(p for p in args.input_dir.rglob("*") if p.is_file() and p.suffix.lower() in AUDIO_EXTS)
    if not files:
        print(f"No supported audio files found in {args.input_dir}", file=sys.stderr)
        return 1
    args.out.mkdir(parents=True, exist_ok=True)
    inv_rows, feat_rows = [], []
    for path in files:
        info: dict[str, Any] = {"filename": path.name, "relative_path": str(path.relative_to(args.input_dir)),
            "size_bytes": path.stat().st_size, "sha256": sha256(path)}
        try:
            meta = sf.info(str(path))
            info.update(sample_rate=meta.samplerate, channels=meta.channels, frames=meta.frames,
                        duration_seconds=meta.duration, format=meta.format, subtype=meta.subtype)
            inv_rows.append(info)
            # Stream file in chunks; preserve absolute frame index for timestamps.
            sr = int(meta.samplerate)
            chunk_frames = max(1, int(args.chunk_seconds * sr))
            y_parts = []
            with sf.SoundFile(str(path)) as f:
                while True:
                    data = f.read(frames=chunk_frames, dtype="float32", always_2d=True)
                    if len(data) == 0: break
                    y_parts.append(data.mean(axis=1))
            # Current first-pass feature extraction retains mono working signal in memory.
            # Long file chunk processing is used for safe decoding; later revisions can
            # make all transforms fully streaming.
            y = np.concatenate(y_parts)
            peak = float(np.max(np.abs(y))) if len(y) else 0.0
            rms = float(np.sqrt(np.mean(y*y))) if len(y) else 0.0
            hop = max(1, int(args.hop_seconds * sr))
            frame = max(1024, 2 ** int(math.ceil(math.log2(hop * 4))))
            rms_env = librosa.feature.rms(y=y, frame_length=frame, hop_length=hop, center=True)[0]
            onset = librosa.onset.onset_strength(y=y, sr=sr, hop_length=hop)
            onset_env_mean = float(np.mean(onset)) if len(onset) else 0.0
            # Pulse candidates are descriptive periodicities, not verified beat/tempo.
            ac = librosa.autocorrelate(onset, max_size=min(len(onset), int(sr / hop * 8)))
            candidates = []
            if len(ac) > 2 and ac[0] > 0:
                lo = max(1, int((sr / hop) * 60 / 220))
                hi = min(len(ac)-1, int((sr / hop) * 60 / 35))
                if hi > lo:
                    peaks = librosa.util.peak_pick(ac, pre_max=2, post_max=2, pre_avg=3, post_avg=3, delta=0.0, wait=2)
                    peaks = [int(k) for k in peaks if lo <= k <= hi]
                    for k in sorted(peaks, key=lambda k: ac[k], reverse=True)[:8]:
                        bpm = 60.0 * sr / hop / k
                        candidates.append({"period_seconds": k * hop / sr, "bpm_candidate": bpm,
                                           "relative_autocorrelation": float(ac[k] / ac[0])})
            # Chroma summaries; chunk processing for very long files follows in next iteration.
            chroma = librosa.feature.chroma_stft(y=y, sr=sr, hop_length=hop)
            pc = chroma.mean(axis=1)
            pc_norm = pc / (pc.sum() + 1e-12)
            feat_rows.append({
                "filename": path.name, "duration_seconds": info["duration_seconds"],
                "sample_rate": sr, "channels": meta.channels, "peak": peak, "rms": rms,
                "onset_strength_mean": onset_env_mean, "onset_strength_std": float(np.std(onset)),
                "onset_frames": int(len(onset)), "chroma_frames": int(chroma.shape[1]),
                "chroma_entropy_bits": float(-np.sum(pc_norm * np.log2(pc_norm + 1e-12))),
                "chroma_profile": json.dumps([round(float(v), 7) for v in pc_norm]),
                "pulse_candidates": json.dumps(candidates),
                "status": "ok"
            })
        except Exception as e:
            inv_rows.append(info)
            feat_rows.append({"filename":path.name,"status":f"error: {type(e).__name__}: {e}"})
    for name, rows in [("track_inventory.csv", inv_rows), ("track_features.csv", feat_rows)]:
        keys = sorted({k for row in rows for k in row})
        with (args.out / name).open("w", newline="", encoding="utf-8") as f:
            w = csv.DictWriter(f, fieldnames=keys); w.writeheader(); w.writerows(rows)
    manifest = {
        "script_version":"0.1.0", "python":sys.version, "platform":platform.platform(),
        "libraries":{"numpy":np.__version__,"librosa":librosa.__version__,"soundfile":sf.__version__,"scipy":scipy.__version__},
        "input_dir":str(args.input_dir.resolve()),"output_dir":str(args.out.resolve()),
        "chunk_seconds":args.chunk_seconds,"hop_seconds":args.hop_seconds,
        "notes":["Pulse estimates are descriptive candidates only.",
                 "Global chroma is not key or melody transcription.",
                 "Long audio is decoded in chunks but concatenated for current transforms.",
                 "No source or glyph interpretation is attempted."]
    }
    (args.out/"run_manifest.json").write_text(json.dumps(manifest,indent=2),encoding="utf-8")
    print(f"Processed {len(feat_rows)} files; results in {args.out}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
