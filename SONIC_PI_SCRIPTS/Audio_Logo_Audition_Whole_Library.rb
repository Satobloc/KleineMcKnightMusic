# WHOLE-LIBRARY AUDIO LOGO AUDITION
# Sonic Pi 4.5 / Sonic Pi 4.x
#
# 30 short audio-logo experiments.
# Every logo draws random fragments from the entire D:/HYPERFLIRT library,
# then combines them with synths and effects. Four high TICKS, then one low
# TOCK, mark each group of five.
#
# The sample list is obtained from Sonic Pi itself with sample_paths.
# This avoids a guessed file count or hard-coded index range.
# Sonic Pi's recursive sample-path cache makes later runs faster.
#
# Run the whole buffer. Note favourites as 01 yes / 02 maybe / etc.

BPM = 120
use_bpm BPM
# ---------- SETTINGS ----------
LIBRARY_ROOT = "D:/HYPERFLIRT"
LIBRARY_GLOB = "D:/HYPERFLIRT/**"
LOGO_COUNT = 30
GROUP_SIZE = 5
LOGO_GAP = 1.5
MARKER_GAP = 0.5

# Ask Sonic Pi for the actual recursive file list. This is the authoritative
# candidate pool for this installation, not an atlas-derived estimate.
puts "Indexing the Hyperflirt sample library..."
LIBRARY_PATHS = sample_paths(LIBRARY_GLOB)
puts "Indexed #{LIBRARY_PATHS.length} supported audio files."

# Sample fragments are time-limited with Sonic Pi's sample envelope rather
# than by guessing a source-file duration. This also works across the mixed
# WAV / MP3 / FLAC pool without relying on a file-duration probe.
# ---------- RANDOM WHOLE-LIBRARY SAMPLE ENGINE ----------
define :library_fragment do |amp=0.22, rate_lo=1.8, rate_hi=5.5|
  picked_path = LIBRARY_PATHS.choose
  speed = rrand(rate_lo, rate_hi)
  target_seconds = rrand(0.075, 0.19)
  release_beats = target_seconds * BPM / 60.0
  head = rrand(0.0, 0.88)
  short_name = picked_path.split("/").last
  puts "    library pull: #{short_name} | ~#{target_seconds.round(2)}s | rate #{speed.round(2)}"
  sample picked_path,
    start: head, rate: speed, amp: amp,
    attack: 0.003, sustain: 0, release: release_beats,
    pan: rrand(-0.65, 0.65)
end

define :logo_tone do |notes, synth_name=:pretty_bell, amp=0.25, release_time=0.32|
  use_synth synth_name
  play notes, amp: amp, attack: 0.004, sustain: 0.015,
    release: release_time, cutoff: rrand(85, 125)
end

define :logo_fx do |kind, room_amt=0.55, echo_amt=0.18|
  # Each logo uses its own effect stack at the call site.
end

# ---------- 30 LOGOS ----------
define :audio_logo do |n|
  puts ""
  case n

  # GLASS / SPARKLE
  when 1
    puts "01 | GLASS COMET"
    with_fx :reverb, room: 0.78, mix: 0.32 do
      with_fx :echo, phase: 0.10, decay: 0.38, mix: 0.20 do
        library_fragment 0.18
        sleep 0.75
        logo_tone [76, 83, 88], :pretty_bell, 0.30, 0.48
        sleep 0.36
        logo_tone 96, :pretty_bell, 0.23, 0.45
      end
    end

  when 2
    puts "02 | THREE DROPS"
    with_fx :reverb, room: 0.62, mix: 0.24 do
      library_fragment 0.16
      sleep 0.75
      logo_tone 84, :dull_bell, 0.25, 0.22
      sleep 0.30
      logo_tone 91, :dull_bell, 0.27, 0.22
      sleep 0.30
      logo_tone 98, :pretty_bell, 0.24, 0.38
    end

  when 3
    puts "03 | PRISM LIFT"
    with_fx :reverb, room: 0.82, mix: 0.34 do
      library_fragment 0.15, 2.8, 6.0
      sleep 0.75
      logo_tone 72, :sine, 0.24, 0.20
      sleep 0.24
      logo_tone 79, :sine, 0.23, 0.20
      sleep 0.24
      logo_tone 88, :pretty_bell, 0.29, 0.48
    end

  when 4
    puts "04 | CRYSTAL BLOOM"
    with_fx :reverb, room: 0.9, mix: 0.36 do
      with_fx :echo, phase: 0.12, decay: 0.35, mix: 0.2 do
        library_fragment 0.18
        sleep 0.75
        logo_tone [72, 79, 84, 91], :pretty_bell, 0.22, 0.58
      end
    end

  when 5
    puts "05 | FALLING STAR"
    with_fx :reverb, room: 0.8, mix: 0.3 do
      library_fragment 0.2
      sleep 0.75
      logo_tone 100, :pretty_bell, 0.28, 0.16
      sleep 0.30
      logo_tone 93, :pretty_bell, 0.23, 0.18
      sleep 0.30
      logo_tone 84, :pretty_bell, 0.21, 0.48
    end

  # DIGITAL / FUTURIST
  when 6
    puts "06 | BOOT SEQUENCE"
    with_fx :bitcrusher, bits: 8, sample_rate: 12000, mix: 0.22 do
      with_fx :reverb, room: 0.35, mix: 0.12 do
        library_fragment 0.18, 3.0, 6.0
        sleep 0.75
        logo_tone 48, :fm, 0.25, 0.18
        sleep 0.30
        logo_tone 72, :fm, 0.23, 0.16
        sleep 0.24
        logo_tone 84, :fm, 0.26, 0.34
      end
    end

  when 7
    puts "07 | PIXEL HALO"
    with_fx :echo, phase: 0.07, decay: 0.25, mix: 0.2 do
      library_fragment 0.14
      sleep 0.75
      logo_tone 90, :pulse, 0.22, 0.12
      sleep 0.21
      logo_tone 97, :pulse, 0.21, 0.12
      sleep 0.21
      logo_tone 102, :tri, 0.25, 0.38
    end

  when 8
    puts "08 | SOFT CIRCUIT"
    with_fx :reverb, room: 0.55, mix: 0.2 do
      library_fragment 0.16
      sleep 0.75
      logo_tone 60, :sine, 0.24, 0.15
      sleep 0.27
      logo_tone 72, :sine, 0.23, 0.15
      sleep 0.27
      logo_tone 84, :saw, 0.15, 0.32
    end

  when 9
    puts "09 | ORBITAL PING"
    with_fx :echo, phase: 0.13, decay: 0.42, mix: 0.3 do
      library_fragment 0.17
      sleep 0.75
      logo_tone 89, :beep, 0.28, 0.12
      sleep 0.30
      logo_tone 96, :beep, 0.25, 0.22
    end

  when 10
    puts "10 | NEON DOOR"
    with_fx :reverb, room: 0.65, mix: 0.22 do
      with_fx :distortion, distort: 0.12, mix: 0.15 do
        library_fragment 0.20, 2.2, 4.5
        sleep 0.75
        logo_tone 52, :dsaw, 0.22, 0.20
        sleep 0.36
        logo_tone [76, 83, 91], :pretty_bell, 0.23, 0.42
      end
    end

  # WARM / ORGANIC
  when 11
    puts "11 | WOODEN SPARK"
    with_fx :reverb, room: 0.48, mix: 0.18 do
      library_fragment 0.24
      sleep 0.75
      logo_tone 79, :pluck, 0.28, 0.30
      sleep 0.36
      logo_tone 86, :pretty_bell, 0.20, 0.38
    end

  when 12
    puts "12 | THUMBPRINT"
    with_fx :reverb, room: 0.5, mix: 0.2 do
      library_fragment 0.17
      sleep 0.75
      logo_tone 67, :pluck, 0.30, 0.20
      sleep 0.33
      logo_tone 74, :pluck, 0.26, 0.20
      sleep 0.33
      logo_tone 79, :pluck, 0.24, 0.36
    end

  when 13
    puts "13 | TINY GAMELAN"
    with_fx :reverb, room: 0.7, mix: 0.26 do
      library_fragment 0.21, 2.4, 5.0
      sleep 0.75
      logo_tone [72, 76, 83], :pretty_bell, 0.23, 0.48
    end

  when 14
    puts "14 | SITAR GLINT"
    with_fx :reverb, room: 0.48, mix: 0.18 do
      library_fragment 0.23
      sleep 0.75
      sleep 0.30
      logo_tone 91, :pretty_bell, 0.22, 0.38
    end

  when 15
    puts "15 | AUT HARP AURORA"
    with_fx :reverb, room: 0.78, mix: 0.32 do
      library_fragment 0.17
      sleep 0.75
      logo_tone [67, 74, 79, 86], :pretty_bell, 0.21, 0.58
      sleep 0.27
      logo_tone 98, :pretty_bell, 0.20, 0.48
    end

  # STRANGE / CHARACTER
  when 16
    puts "16 | ZORRO ZAP"
    with_fx :reverb, room: 0.28, mix: 0.1 do
      library_fragment 0.26, 2.5, 6.0
      sleep 0.75
      sleep 0.30
      logo_tone 88, :fm, 0.22, 0.28
    end

  when 17
    puts "17 | RUBBER COMET"
    with_fx :echo, phase: 0.09, decay: 0.28, mix: 0.2 do
      library_fragment 0.15
      sleep 0.75
      logo_tone 55, :tb303, 0.18, 0.13
      sleep 0.24
      logo_tone 79, :tb303, 0.17, 0.13
      sleep 0.24
      logo_tone 91, :pretty_bell, 0.23, 0.34
    end

  when 18
    puts "18 | CLOCKWORK MOTE"
    with_fx :reverb, room: 0.44, mix: 0.15 do
      library_fragment 0.22
      sleep 0.75
      logo_tone 83, :pretty_bell, 0.24, 0.38
    end

  when 19
    puts "19 | LIQUID METAL"
    with_fx :reverb, room: 0.6, mix: 0.22 do
      with_fx :echo, phase: 0.10, decay: 0.34, mix: 0.2 do
        library_fragment 0.16, 2.8, 6.0
        sleep 0.75
        logo_tone 64, :fm, 0.21, 0.11
        sleep 0.21
        logo_tone 83, :fm, 0.20, 0.11
        sleep 0.21
        logo_tone 95, :pretty_bell, 0.23, 0.42
      end
    end

  when 20
    puts "20 | TINY IMPACT"
    with_fx :reverb, room: 0.52, mix: 0.16 do
      library_fragment 0.24, 3.0, 6.0
      sleep 0.75
      logo_tone 86, :pretty_bell, 0.23, 0.40
    end

  # MINIATURE ORCHESTRAL
  when 21
    puts "21 | BRASS AND GLASS"
    with_fx :reverb, room: 0.72, mix: 0.28 do
      library_fragment 0.16
      sleep 0.75
      logo_tone 60, :prophet, 0.18, 0.15
      sleep 0.36
      logo_tone [72, 79, 84], :pretty_bell, 0.24, 0.48
    end

  when 22
    puts "22 | VELVET CHORD"
    with_fx :reverb, room: 0.84, mix: 0.32 do
      library_fragment 0.18
      sleep 0.75
      logo_tone [69, 76, 81, 88], :piano, 0.23, 0.44
      sleep 0.36
      logo_tone 93, :pretty_bell, 0.19, 0.42
    end

  when 23
    puts "23 | CELESTIAL STAMP"
    with_fx :reverb, room: 0.9, mix: 0.34 do
      library_fragment 0.16
      sleep 0.75
      logo_tone 72, :sine, 0.17, 0.22
      sleep 0.36
      logo_tone 84, :pretty_bell, 0.26, 0.46
      sleep 0.18
      logo_tone 91, :pretty_bell, 0.19, 0.42
    end

  when 24
    puts "24 | GOLDEN INTERVAL"
    with_fx :reverb, room: 0.72, mix: 0.26 do
      library_fragment 0.18
      sleep 0.75
      logo_tone [67, 74, 81], :pretty_bell, 0.23, 0.44
      sleep 0.36
      logo_tone 90, :pretty_bell, 0.22, 0.46
    end

  when 25
    puts "25 | RIBBON FINISH"
    with_fx :echo, phase: 0.105, decay: 0.38, mix: 0.2 do
      with_fx :reverb, room: 0.8, mix: 0.28 do
        library_fragment 0.16
        sleep 0.75
        logo_tone 76, :tri, 0.20, 0.13
        sleep 0.24
        logo_tone 83, :tri, 0.20, 0.13
        sleep 0.24
        logo_tone 91, :pretty_bell, 0.23, 0.50
      end
    end

  # HYBRID / UNEXPECTED COUPLINGS
  when 26
    puts "26 | GAMELAN BOOT"
    with_fx :reverb, room: 0.62, mix: 0.22 do
      library_fragment 0.18, 2.8, 5.8
      sleep 0.75
      logo_tone 48, :fm, 0.17, 0.13
      sleep 0.30
      logo_tone [76, 83, 88], :pretty_bell, 0.22, 0.44
    end

  when 27
    puts "27 | CHIME AND CIRCUIT"
    with_fx :echo, phase: 0.08, decay: 0.3, mix: 0.2 do
      library_fragment 0.16
      sleep 0.75
      logo_tone 96, :pulse, 0.17, 0.09
      sleep 0.30
      logo_tone 88, :pretty_bell, 0.24, 0.42
    end

  when 28
    puts "28 | BENT GLASS"
    with_fx :reverb, room: 0.76, mix: 0.27 do
      with_fx :echo, phase: 0.12, decay: 0.34, mix: 0.18 do
        library_fragment 0.18
        sleep 0.75
        logo_tone 78, :sine, 0.18, 0.18
        sleep 0.30
        logo_tone 91, :pretty_bell, 0.21, 0.44
      end
    end

  when 29
    puts "29 | CHORDAL SPARK"
    with_fx :reverb, room: 0.9, mix: 0.36 do
      library_fragment 0.15
      sleep 0.75
      logo_tone [72, 79, 84, 91], :pretty_bell, 0.18, 0.58
      sleep 0.24
      logo_tone 100, :pretty_bell, 0.19, 0.48
    end

  when 30
    puts "30 | THE SIGNATURE"
    with_fx :reverb, room: 0.8, mix: 0.28 do
      with_fx :echo, phase: 0.09, decay: 0.34, mix: 0.18 do
        library_fragment 0.18, 2.5, 5.5
        sleep 0.75
        logo_tone 72, :fm, 0.17, 0.12
        sleep 0.27
        logo_tone 79, :fm, 0.17, 0.12
        sleep 0.27
        logo_tone [84, 91, 96], :pretty_bell, 0.22, 0.54
      end
    end
  end
end

# ---------- COUNTING MARKERS ----------
define :count_tick do
  use_synth :beep
  play 96, amp: 0.20, attack: 0.001, sustain: 0.004, release: 0.05
end

define :count_tock do
  use_synth :beep
  with_fx :lpf, cutoff: 72 do
    with_fx :reverb, room: 0.42, mix: 0.14 do
      play 48, amp: 0.30, attack: 0.002, sustain: 0.02, release: 0.18
    end
  end
end

# ---------- RUN ----------
puts "=============================================="
puts "WHOLE-LIBRARY AUDIO LOGO AUDITION"
puts "30 designs | six groups | four TICKS then TOCK"
puts "Library: #{LIBRARY_GLOB}"
puts "Indexed sample count: #{LIBRARY_PATHS.length}"
puts "First run may take time while Sonic Pi indexes files."
puts "=============================================="

LOGO_COUNT.times do |offset|
  logo_number = offset + 1
  puts "AUDITION #{logo_number}/#{LOGO_COUNT}"
  audio_logo logo_number
  sleep LOGO_GAP

  group_position = offset % GROUP_SIZE
  if group_position < 4
    count_tick
    puts "TICK #{group_position + 1}/4"
  else
    count_tock
    puts "TOCK | GROUP #{(offset / GROUP_SIZE) + 1} COMPLETE"
  end

  sleep MARKER_GAP
end

puts "WHOLE-LIBRARY AUDITION COMPLETE."
