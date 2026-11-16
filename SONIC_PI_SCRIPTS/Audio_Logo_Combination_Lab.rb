# HYPERFLIRT AUDIO LOGO COMBINATION LAB
# Sonic Pi 4.5 / Sonic Pi 4.x
#
# Three source recordings are layered and treated as one short audio mark.
# This first prototype chooses a fresh trio from the library and prints
# the exact paths. Replace SOURCE_PATHS with three quoted paths from a
# favourite survey run when you want to pin those exact recordings.
#
# Three treatments use the SAME trio:
# 1. BRIGHT LIFT  - blended texture + rising major-colour motif
# 2. POP START    - punchier, more percussive, slightly dirtier
# 3. THE WINK     - echo articulation + a quick high-note flourish
#
# Preloads only the three selected files. No whole-library random pulls.

BPM = 20
use_bpm BPM

LIBRARY_GLOB = "D:/HYPERFLIRT/**"

# To pin exact favourites, replace nil with three full file paths:
# SOURCE_PATHS = [
#   "D:/HYPERFLIRT/favourite_one.wav",
#   "D:/HYPERFLIRT/favourite_two.wav",
#   "D:/HYPERFLIRT/favourite_three.wav"
# ]
SOURCE_PATHS = nil

SAMPLE_AMP = 0.82
SAMPLE_SUSTAIN = 0.48
SAMPLE_RELEASE = 0.04
SAMPLE_WAIT = 0.62

definable = nil

puts "Indexing Hyperflirt library..."
LIBRARY_PATHS = sample_paths(LIBRARY_GLOB)
puts "Indexed #{LIBRARY_PATHS.length} supported files."

if SOURCE_PATHS.nil?
  if LIBRARY_PATHS.length < 3
    puts "ERROR: Need at least three supported files."
  else
    SOURCE_PATHS = LIBRARY_PATHS.shuffle.take(3)
  end
end

if SOURCE_PATHS.length != 3
  puts "ERROR: SOURCE_PATHS must contain exactly three file paths."
else
  puts ""
  puts "COMBINATION SOURCES:"
  SOURCE_PATHS.each_with_index do |path, i|
    puts "SOURCE #{i + 1}: #{path}"
  end

  puts "Preloading the three sources..."
  load_samples SOURCE_PATHS
  sleep 2
  puts "Ready."

  # Select a different excerpt point for each source, but reuse those
  # positions in all three treatments for a fair A/B/C comparison.
  STARTS = [rrand(0.05, 0.45), rrand(0.05, 0.45), rrand(0.05, 0.45)]

  define :play_source do |index, amp=0.82, rate=1|
    sample SOURCE_PATHS[index],
      start: STARTS[index],
      finish: STARTS[index] + 0.30,
      rate: rate,
      amp: amp,
      attack: 0.01,
      sustain: SAMPLE_SUSTAIN,
      release: SAMPLE_RELEASE
  end

  define :bright_motif do
    use_synth :pretty_bell
    play 72, amp: 0.19, attack: 0.005, sustain: 0.02, release: 0.22
    sleep 0.07
    play 76, amp: 0.19, attack: 0.005, sustain: 0.02, release: 0.22
    sleep 0.07
    play 79, amp: 0.21, attack: 0.005, sustain: 0.02, release: 0.24
    sleep 0.07
    play 84, amp: 0.23, attack: 0.005, sustain: 0.02, release: 0.30
    sleep 0.10
    play 91, amp: 0.18, attack: 0.003, sustain: 0.01, release: 0.34
  end

  define :wink_motif do
    use_synth :pretty_bell
    play 91, amp: 0.20, attack: 0.002, sustain: 0.01, release: 0.10
    sleep 0.06
    play 96, amp: 0.24, attack: 0.002, sustain: 0.01, release: 0.12
    sleep 0.08
    play 100, amp: 0.17, attack: 0.002, sustain: 0.01, release: 0.32
  end

  # ------------------------------------------------------------
  # TAKE 1: BRIGHT LIFT
  # The three recordings overlap. One stays relatively natural,
  # one is filtered and echoed, one gets a little digital sparkle.
  # ------------------------------------------------------------
  puts ""
  puts "TAKE 1 | BRIGHT LIFT"
  with_fx :reverb, room: 0.62, mix: 0.24 do
    play_source 0, 0.78
    sleep 0.06
    with_fx :echo, phase: 0.12, decay: 0.42, mix: 0.20 do
      with_fx :lpf, cutoff: 112 do
        play_source 1, 0.70
      end
    end
    sleep 0.06
    with_fx :bitcrusher, bits: 10, sample_rate: 18000, mix: 0.18 do
      play_source 2, 0.64
    end
    sleep 0.18
    bright_motif
  end
  sleep SAMPLE_WAIT

  # ------------------------------------------------------------
  # TAKE 2: POP START
  # More attack and grit, with a compact rising signal.
  # ------------------------------------------------------------
  puts ""
  puts "TAKE 2 | POP START"
  with_fx :reverb, room: 0.38, mix: 0.14 do
    with_fx :distortion, distort: 0.16, mix: 0.18 do
      play_source 0, 0.82
    end
    sleep 0.05
    with_fx :hpf, cutoff: 72 do
      with_fx :echo, phase: 0.09, decay: 0.28, mix: 0.14 do
        play_source 1, 0.72
      end
    end
    sleep 0.05
    play_source 2, 0.62, 1.15
    sleep 0.18
    use_synth :pluck
    play 60, amp: 0.22, attack: 0.001, decay: 0.04, sustain: 0, release: 0.05
    sleep 0.08
    bright_motif
  end
  sleep SAMPLE_WAIT

  # ------------------------------------------------------------
  # TAKE 3: THE WINK
  # The source blend is softened, then the high transient is
  # repeated by echo. The final notes act like a little signature.
  # ------------------------------------------------------------
  puts ""
  puts "TAKE 3 | THE WINK"
  with_fx :reverb, room: 0.72, mix: 0.25 do
    with_fx :echo, phase: 0.16, decay: 0.55, mix: 0.24 do
      play_source 0, 0.66
      sleep 0.07
      with_fx :lpf, cutoff: 96 do
        play_source 1, 0.70
      end
      sleep 0.07
      with_fx :bitcrusher, bits: 12, sample_rate: 22000, mix: 0.12 do
        play_source 2, 0.58
      end
      sleep 0.22
      wink_motif
    end
  end

  puts ""
  puts "COMBINATION LAB COMPLETE."
  puts "Same three recordings, three different treatments."
end
