# HYPERFLIRT AUDIO LOGO COMBINATION LAB
# Sonic Pi 4.5 / Sonic Pi 4.x
#
# Revision 2: source-identifiable, deliberately contrasting treatments.
# Uses the exact three files from the previous run log, in fixed order.
# First hear each source alone, then hear three treatments built from
# the same trio. This makes it possible to identify what is doing what.
#
# The three survey favourites (sample numbers 3, 4, 10) are NOT assumed
# to be these three files. Their paths were not present in the log supplied.
#
# All source fragments are preloaded before playback.

BPM = 20
use_bpm BPM

SOURCE_PATHS = [
  "D:/HYPERFLIRT/SAMPLES/MELODIC SAMPLES/WORLD/chinese-traditional-3.wav",
  "D:/HYPERFLIRT/my TRACS (old)/TABLA_PERFORMANCE_1.wav",
  "D:/HYPERFLIRT/2pop_song_skeleton_glithcy_v2.wav"
]

SAMPLE_AMP = 0.90
SAMPLE_SUSTAIN = 0.80
SAMPLE_RELEASE = 0.05
SOURCE_GAP = 0.75
TAKE_GAP = 1.0

puts "Preloading the three identified source files..."
SOURCE_PATHS.each_with_index do |path, i|
  puts "SOURCE #{i + 1}: #{path}"
end
load_samples SOURCE_PATHS
sleep 2
puts "Preload complete."

# Use fixed, distinct excerpt positions so comparisons are repeatable.
SOURCE_STARTS = [0.18, 0.32, 0.12]
SOURCE_FINISHES = [0.58, 0.72, 0.52]

define :play_source do |index, amp=0.90, rate=1|
  sample SOURCE_PATHS[index],
    start: SOURCE_STARTS[index],
    finish: SOURCE_FINISHES[index],
    rate: rate,
    amp: amp,
    attack: 0.01,
    sustain: SAMPLE_SUSTAIN,
    release: SAMPLE_RELEASE
end

define :play_source_blend do |amp_scale=1.0|
  # Small stagger creates a three-part composite instead of a single
  # transient pile-up. Each source remains independently identifiable.
  play_source 0, 0.72 * amp_scale
  sleep 0.10
  play_source 1, 0.72 * amp_scale
  sleep 0.10
  play_source 2, 0.68 * amp_scale
end

define :start_signature do
  # A clear, upbeat "start" gesture: short low pop, then rising major
  # pentatonic notes. The synth is deliberately brief and secondary.
  use_synth :pluck
  play 60, amp: 0.30, attack: 0.001, decay: 0.045, sustain: 0, release: 0.05
  sleep 0.10
  use_synth :pretty_bell
  play 72, amp: 0.20, attack: 0.003, sustain: 0.01, release: 0.16
  sleep 0.10
  play 76, amp: 0.20, attack: 0.003, sustain: 0.01, release: 0.16
  sleep 0.10
  play 79, amp: 0.22, attack: 0.003, sustain: 0.01, release: 0.18
  sleep 0.10
  play 84, amp: 0.25, attack: 0.003, sustain: 0.01, release: 0.24
end

define :wink_signature do
  use_synth :pretty_bell
  play 91, amp: 0.22, attack: 0.002, sustain: 0.005, release: 0.08
  sleep 0.07
  play 96, amp: 0.25, attack: 0.002, sustain: 0.005, release: 0.10
  sleep 0.09
  play 100, amp: 0.20, attack: 0.002, sustain: 0.005, release: 0.24
end

# ------------------------------------------------------------
# PART A: IDENTIFY THE RAW MATERIAL
# Each file plays alone, with no effects and no synths.
# ------------------------------------------------------------
puts ""
puts "PART A | RAW SOURCES, ONE AT A TIME"

puts "SOURCE 1 SOLO | CHINESE TRADITIONAL"
play_source 0, 0.95
sleep SOURCE_GAP

puts "SOURCE 2 SOLO | TABLA PERFORMANCE"
play_source 1, 0.95
sleep SOURCE_GAP

puts "SOURCE 3 SOLO | POP SONG SKELETON GLITCHY"
play_source 2, 0.95
sleep TAKE_GAP

# ------------------------------------------------------------
# PART B: COMBINE WITHOUT EFFECTS
# Baseline lets the ear hear the blend before processing.
# ------------------------------------------------------------
puts ""
puts "TAKE 1 | DRY THREE-SOURCE BLEND"
play_source_blend 0.85
sleep 0.95
start_signature
sleep TAKE_GAP

# ------------------------------------------------------------
# PART C: THREE CLEARLY DIFFERENT EFFECT TREATMENTS
# ------------------------------------------------------------

# TAKE 2: RADIO / CUT-THROUGH
# Strong high-pass + audible bit reduction. Deliberately narrow,
# bright and slightly crunchy, like a little electronic chirp.
puts ""
puts "TAKE 2 | RADIO SPARK"
with_fx :hpf, cutoff: 78, mix: 1.0 do
  with_fx :bitcrusher, bits: 8, sample_rate: 12000, mix: 0.72 do
    play_source_blend 0.82
  end
end
sleep 0.80
start_signature
sleep TAKE_GAP

# TAKE 3: BIG, ROUND, BOUNCY
# Low-pass softens the edges; distortion adds body; short echo
# creates a bouncing tail rather than a long wash.
puts ""
puts "TAKE 3 | BOUNCE / POP"
with_fx :lpf, cutoff: 105, mix: 0.72 do
  with_fx :distortion, distort: 0.28, mix: 0.55 do
    with_fx :echo, phase: 0.10, decay: 0.30, mix: 0.28 do
      play_source_blend 0.72
    end
  end
end
sleep 0.80
start_signature
sleep TAKE_GAP

# TAKE 4: GLASSY WINK
# Stronger echo and reverb turn the same attacks into a bright,
# spatial, smiling tail. High notes arrive only after the blend.
puts ""
puts "TAKE 4 | GLASS WINK"
with_fx :reverb, room: 0.72, mix: 0.42 do
  with_fx :echo, phase: 0.14, decay: 0.58, mix: 0.42 do
    play_source_blend 0.72
    sleep 0.22
    wink_signature
  end
end

puts ""
puts "COMBINATION LAB COMPLETE."
puts "The log names every source and every treatment."
