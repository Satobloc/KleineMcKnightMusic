# HYPERFLIRT SELF-BLEND TREATMENT REEL
# Sonic Pi 4.5 / Sonic Pi 4.x
#
# One source, twelve treatments. Each treatment layers the source against
# itself to create a composite rather than simply playing it once.
#
# Reel order for every take:
# BEEP -> TOCKER -> short pause -> LOGO -> short pause
#
# The tocker is deliberately BEFORE the sample so each take is announced.
# Source selected from the user's survey log.

BPM = 20
use_bpm BPM

SOURCE_PATH = "D:/HYPERFLIRT/SAMPLES/INSTRUMENTS (SINGLE SAMPLES)/Guitars/guitar-note-goes-crazy.wav"

SAMPLE_START = 0.0
SAMPLE_FINISH = 1.0
SAMPLE_SUSTAIN = 0.80
SAMPLE_RELEASE = 0.10
CUE_GAP = 0.18
LOGO_GAP = 1.00
TAKE_GAP = 0.25

puts "HYPERFLIRT SELF-BLEND TREATMENT REEL"
puts "SOURCE: #{SOURCE_PATH}"
puts "Preloading one source..."
load_samples [SOURCE_PATH]
sleep 2
puts "Preload complete."

define :play_layer do |rate=1.0, amp=0.5, start_pos=SAMPLE_START, finish_pos=SAMPLE_FINISH, attack_time=0.02|
  sample SOURCE_PATH,
    start: start_pos,
    finish: finish_pos,
    rate: rate,
    amp: amp,
    attack: attack_time,
    sustain: SAMPLE_SUSTAIN,
    release: SAMPLE_RELEASE
end

define :play_beep do
  use_synth :beep
  play 88, amp: 0.42, attack: 0.001, sustain: 0, release: 0.07
end

define :play_tocker do |count|
  use_synth :pluck
  count.times do |i|
    if i == 9
      play 40, amp: 0.42, attack: 0.001, decay: 0.035,
        sustain: 0, release: 0.045, coef: 0.82
    else
      play 47, amp: 0.25, attack: 0.001, decay: 0.025,
        sustain: 0, release: 0.035, coef: 0.76
    end
    if i < count - 1
      if (i + 1) % 5 == 0
        sleep 0.28
      else
        sleep 0.08
      end
    end
  end
end

define :reel_cue do |take_number, title|
  puts ""
  puts "TAKE #{take_number} | #{title}"
  play_beep
  play_tocker take_number
  sleep CUE_GAP
end

define :reel_tail do
  sleep LOGO_GAP
  sleep TAKE_GAP
end

# 1. RAW DOUBLE: tiny detuning by playback-rate offset, shared dry attack.
reel_cue 1, "RAW DOUBLE"
play_layer 1.000, 0.48
play_layer 1.018, 0.42
reel_tail

# 2. OCTAVE BODY: low, middle and bright copies form a compact chordal object.
reel_cue 2, "OCTAVE BODY"
play_layer 0.50, 0.48
play_layer 1.00, 0.38
play_layer 2.00, 0.20
reel_tail

# 3. MICRO-PHASE: close rates and staggered attacks create beating / movement.
reel_cue 3, "MICRO-PHASE"
play_layer 0.985, 0.46, 0.00, 0.82, 0.01
play_layer 1.000, 0.46, 0.08, 0.90, 0.07
play_layer 1.016, 0.38, 0.16, 1.00, 0.13
reel_tail

# 4. ECHO CLOUD: repeated reflections fuse the source into a short motif.
reel_cue 4, "ECHO CLOUD"
with_fx :echo, phase: 0.18, decay: 1.2, mix: 0.48 do
  with_fx :reverb, room: 0.62, mix: 0.30 do
    play_layer 1.0, 0.58
    play_layer 1.5, 0.20, 0.20, 0.78
    sleep 1.15
  end
end
reel_tail

# 5. SOFT GLASS: high-pass and low-pass copies occupy complementary bands.
reel_cue 5, "SOFT GLASS"
with_fx :reverb, room: 0.48, mix: 0.22 do
  with_fx :lpf, cutoff: 76 do
    play_layer 0.72, 0.55
  end
  with_fx :hpf, cutoff: 78 do
    play_layer 1.32, 0.34, 0.12, 0.88
  end
  sleep 0.95
end
reel_tail

# 6. GRANULAR EDGE: crunchy fast fragments over a slower body.
reel_cue 6, "GRANULAR EDGE"
with_fx :bitcrusher, bits: 7, sample_rate: 11000, mix: 0.72 do
  play_layer 1.85, 0.30, 0.00, 0.34
  play_layer 2.45, 0.25, 0.28, 0.62
end
play_layer 0.72, 0.42, 0.05, 0.92
reel_tail

# 7. RING TONE: metallic sidebands from two overlapping copies.
reel_cue 7, "RING TONE"
with_fx :ring_mod, freq: 37, mix: 0.62 do
  play_layer 1.0, 0.42
  play_layer 1.51, 0.30, 0.18, 0.82
end
reel_tail

# 8. FLUTTER: moving amplitude gate over a doubled source.
reel_cue 8, "FLUTTER"
with_fx :slicer, phase: 0.16, pulse_width: 0.68, smooth: 0.04, mix: 0.72 do
  play_layer 1.0, 0.52
  play_layer 0.5, 0.25
end
reel_tail

# 9. FLANGED METAL: short moving comb-filter colour, kept in a shared room.
reel_cue 9, "FLANGED METAL"
with_fx :flanger, phase: 0.32, depth: 4, feedback: 0.55, mix: 0.62 do
  with_fx :reverb, room: 0.58, mix: 0.24 do
    play_layer 1.0, 0.52
    play_layer 1.012, 0.40
    sleep 0.95
  end
end
reel_tail

# 10. CRUSHED CHIME: high, fast fragment over a low, softened copy.
reel_cue 10, "CRUSHED CHIME"
with_fx :bitcrusher, bits: 9, sample_rate: 15000, mix: 0.58 do
  play_layer 2.0, 0.28, 0.18, 0.70
end
with_fx :lpf, cutoff: 68 do
  play_layer 0.5, 0.50, 0.00, 0.90
end
reel_tail

# 11. SATURATED KNOT: three near-unison layers through shared distortion.
reel_cue 11, "SATURATED KNOT"
with_fx :distortion, distort: 0.32, mix: 0.52 do
  with_fx :reverb, room: 0.42, mix: 0.18 do
    play_layer 0.96, 0.40
    play_layer 1.00, 0.40
    play_layer 1.04, 0.34
    sleep 0.95
  end
end
reel_tail

# 12. FULL FUSION: low body, normal centre, bright fragment, echo and room.
reel_cue 12, "FULL FUSION"
with_fx :reverb, room: 0.78, mix: 0.34 do
  with_fx :echo, phase: 0.14, decay: 0.82, mix: 0.34 do
    with_fx :distortion, distort: 0.18, mix: 0.28 do
      play_layer 0.50, 0.42, 0.00, 0.88
      play_layer 1.00, 0.42, 0.06, 0.96
      play_layer 1.75, 0.22, 0.22, 0.68
      sleep 1.25
    end
  end
end
reel_tail

puts ""
puts "REEL COMPLETE: 12 self-blended treatments."
