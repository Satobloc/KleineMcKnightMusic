# HYPERFLIRT AUDIO LOGO BLENDING LAB
# Sonic Pi 4.5 / Sonic Pi 4.x
#
# The previous lab staggered sources and added a separate synth motif.
# This version tests actual composite blending: all three source samples
# begin together, overlap for several seconds, and occupy different
# spectral / textural roles. No melody is added over the top.
#
# Uses the three paths from the previous run log. These are NOT yet the
# user's remembered survey favourites 3, 4, and 10.
#
# Each take uses the same source positions for fair comparison.
# Preload before playback. Tocker marks every take.

BPM = 20
use_bpm BPM

SOURCE_PATHS = [
  "D:/HYPERFLIRT/SAMPLES/MELODIC SAMPLES/WORLD/chinese-traditional-3.wav",
  "D:/HYPERFLIRT/my TRACS (old)/TABLA_PERFORMANCE_1.wav",
  "D:/HYPERFLIRT/2pop_song_skeleton_glithcy_v2.wav"
]

SOURCE_STARTS = [0.18, 0.32, 0.12]
SOURCE_FINISHES = [0.58, 0.72, 0.52]

SAMPLE_SUSTAIN = 0.80
SAMPLE_RELEASE = 0.10
BLEND_WAIT = 1.10
TAKE_GAP = 0.50

puts "Preloading three source files..."
SOURCE_PATHS.each_with_index do |path, i|
  puts "SOURCE #{i + 1}: #{path.split("/").last}"
  puts "PATH #{i + 1}: #{path}"
end
load_samples SOURCE_PATHS
sleep 2
puts "Preload complete."

define :play_source do |index, amp=0.60, rate=1, attack_time=0.03|
  sample SOURCE_PATHS[index],
    start: SOURCE_STARTS[index],
    finish: SOURCE_FINISHES[index],
    rate: rate,
    amp: amp,
    attack: attack_time,
    sustain: SAMPLE_SUSTAIN,
    release: SAMPLE_RELEASE
end

# The tocker: cumulative count, with the tenth and completed decades
# accented. Kept outside the sample/effect stack.
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
  sleep 0.30
end

# ------------------------------------------------------------
# TAKE 1: TRUE SIMULTANEOUS STACK
# All three samples are triggered at the same moment, not in sequence.
# A shared reverb bus gives them one acoustic space.
# ------------------------------------------------------------
puts ""
puts "TAKE 1 | SIMULTANEOUS STACK"
with_fx :reverb, room: 0.58, mix: 0.22 do
  play_source 0, 0.48, 1.0, 0.06
  play_source 1, 0.48, 1.0, 0.06
  play_source 2, 0.42, 1.0, 0.06
  sleep BLEND_WAIT
end
sleep TAKE_GAP
play_tocker 1

# ------------------------------------------------------------
# TAKE 2: FREQUENCY-CARVED BLEND
# Same onset, but each source gets a different spectral job:
# source 1 supplies body, source 2 supplies upper percussion,
# source 3 supplies a bright, grainy edge. Shared room glues them.
# ------------------------------------------------------------
puts ""
puts "TAKE 2 | FREQUENCY-CARVED BLEND"
with_fx :reverb, room: 0.52, mix: 0.25 do
  with_fx :lpf, cutoff: 78, mix: 1.0 do
    play_source 0, 0.66, 0.82, 0.08
  end
  with_fx :hpf, cutoff: 76, mix: 1.0 do
    play_source 1, 0.58, 1.0, 0.08
  end
  with_fx :bitcrusher, bits: 10, sample_rate: 16000, mix: 0.34 do
    play_source 2, 0.48, 1.08, 0.08
  end
  sleep BLEND_WAIT
end
sleep TAKE_GAP
play_tocker 2

# ------------------------------------------------------------
# TAKE 3: MELT / GLUE
# All three start together and pass through a common saturation,
# echo and reverb chain. Slightly different rates blur their edges.
# This is the most transformed treatment.
# ------------------------------------------------------------
puts ""
puts "TAKE 3 | MELT / GLUE"
with_fx :reverb, room: 0.76, mix: 0.36 do
  with_fx :echo, phase: 0.12, decay: 0.48, mix: 0.30 do
    with_fx :distortion, distort: 0.20, mix: 0.30 do
      play_source 0, 0.52, 0.90, 0.10
      play_source 1, 0.48, 1.08, 0.10
      play_source 2, 0.42, 0.96, 0.10
      sleep BLEND_WAIT
    end
  end
end
sleep TAKE_GAP
play_tocker 3

puts ""
puts "BLENDING LAB COMPLETE."
puts "Three simultaneous composites, with no added melodic synth line."
