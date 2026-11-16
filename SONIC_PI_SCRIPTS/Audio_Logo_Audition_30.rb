# AUDIO LOGO AUDITION: 30 short sonic identities
# Sonic Pi 4.x
#
# Six groups of five. Between logos: short silence.
# After logos 1-4 in each group: a bright TICK.
# After logo 5: a lower TOCK, marking the group boundary.
#
# IMPORTANT: Set SAMPLE_ROOT to your local extracted SAMPLES folder.
# The archive map contains relative paths, not usable absolute paths.
# Suggested sample sources are listed in the sample bank below.
#
# Run the whole buffer. Sonic Pi's log prints each logo number/name.
# Keep notes as: 01 yes / 02 maybe / 03 no ...
#
# Sampling is optional. Set USE_LIBRARY_SAMPLES = false for synth-only.
# Missing sample files are skipped, with synthesis still carrying the logo.

use_bpm 120
use_random_seed 161116

# ---------- USER SETTINGS ----------
SAMPLE_ROOT = "D:/HYPERFLIRT/SAMPLES"
USE_LIBRARY_SAMPLES = true
LOGOS_PER_GROUP = 5
GROUPS = 6
LOGO_GAP = 0.48
MARKER_GAP = 0.20

# If your extracted sample collection has a different root, change only
# SAMPLE_ROOT. These are archive-relative paths from Samples_Zip_Audio_Map.csv.
SAMPLE_BANK = {
  :pretty_bell => "INSTRUMENTS (SINGLE SAMPLES)/one-pretty-bell.wav",
  :bell_fx => "INSTRUMENTS (SINGLE SAMPLES)/harmonic-bell-fx.wav",
  :wobble_bell => "INSTRUMENTS (SINGLE SAMPLES)/wobble-bell.wav",
  :high_ring => "120_super-high-melody-ringing.wav",
  :pipe_chimes => "DRUMS (SINGLE HITS)/African and Eastern Percussion/pipechimes.wav",
  :zorro => "DRUMS (SINGLE HITS)/Weird and Interesting Hits/zorrostrike.wav",
  :kalimba => "121_ambient-kalimba1.wav",
  :gamelan => "101_bali-gamelan.wav",
  :sitar_chikari => "INSTRUMENTS (SINGLE SAMPLES)/sitar_chikari.wav",
  :tiny_crash => "DRUMS (SINGLE HITS)/Crashes/hard-tiny-crash.wav"
}

# ---------- SMALL HELPERS ----------
define :logo_sample_path do |key|
  File.join(SAMPLE_ROOT, SAMPLE_BANK[key])
end

define :logo_sample_exists do |key|
  File.exist?(logo_sample_path(key))
end

define :logo_play_sample do |key, amp=0.5, rate=1.0, start=0.0, finish=1.0|
  if USE_LIBRARY_SAMPLES && logo_sample_exists(key)
    sample logo_sample_path(key), amp: amp, rate: rate, start: start, finish: finish
  end
end

define :logo_note do |note_num, synth_name=:pretty_bell, amp=0.5, dur=0.35, cutoff_val=110|
  use_synth synth_name
  play note_num, amp: amp, attack: 0.005, sustain: 0.02, release: dur,
    cutoff: cutoff_val, pan: 0
end

define :logo_chord do |note_list, synth_name=:pretty_bell, amp=0.35, dur=0.5|
  use_synth synth_name
  play_chord note_list, amp: amp, attack: 0.005, sustain: 0.04, release: dur
end

define :logo_echo do |note_num, synth_name=:pretty_bell, amp=0.4|
  use_synth synth_name
  with_fx :echo, phase: 0.085, decay: 0.32, mix: 0.28 do
    play note_num, amp: amp, release: 0.18
  end
end

# ---------- THE 30 LOGO DESIGNS ----------
# Each design is deliberately compact. Most occupy 0.45-1.1 seconds.
# Different families: glassy, digital, warm, organic, metallic, hybrid.

define :audio_logo do |index|
  case index

  # GROUP 1: GLASS / SPARKLE
  when 1
    puts "LOGO 01 | Glass Comet"
    with_fx :reverb, room: 0.72, mix: 0.32 do
      with_fx :echo, phase: 0.11, decay: 0.38, mix: 0.18 do
        logo_sample :pretty_bell, amp: 0.28, start: 0.05, finish: 0.42
        logo_chord [76, 83, 88], :pretty_bell, 0.34, 0.52
        sleep 0.12
        logo_note 95, :pretty_bell, 0.26, 0.48, 120
      end
    end

  when 2
    puts "LOGO 02 | Three Drops"
    with_fx :reverb, room: 0.62, mix: 0.25 do
      logo_note 84, :dull_bell, 0.32, 0.25
      sleep 0.10
      logo_note 91, :dull_bell, 0.34, 0.25
      sleep 0.10
      logo_note 98, :pretty_bell, 0.28, 0.42
    end

  when 3
    puts "LOGO 03 | Prism Lift"
    with_fx :reverb, room: 0.8, mix: 0.34 do
      logo_sample :high_ring, amp: 0.20, rate: 1.1, start: 0.02, finish: 0.28
      logo_note 72, :sine, 0.28, 0.23
      sleep 0.08
      logo_note 79, :sine, 0.26, 0.23
      sleep 0.08
      logo_note 88, :pretty_bell, 0.32, 0.55
    end

  when 4
    puts "LOGO 04 | Crystal Bloom"
    with_fx :reverb, room: 0.9, mix: 0.38 do
      logo_sample :bell_fx, amp: 0.23, start: 0.02, finish: 0.34
      logo_chord [72, 79, 84, 91], :pretty_bell, 0.23, 0.62
    end

  when 5
    puts "LOGO 05 | Falling Star"
    with_fx :reverb, room: 0.84, mix: 0.32 do
      logo_note 100, :pretty_bell, 0.32, 0.18
      sleep 0.10
      logo_note 93, :pretty_bell, 0.27, 0.2
      sleep 0.10
      logo_note 84, :pretty_bell, 0.23, 0.58
    end

  # GROUP 2: DIGITAL / FUTURIST
  when 6
    puts "LOGO 06 | Boot Sequence"
    with_fx :reverb, room: 0.35, mix: 0.14 do
      with_fx :bitcrusher, bits: 8, sample_rate: 12000, mix: 0.25 do
        logo_note 48, :fm, 0.30, 0.20
        sleep 0.10
        logo_note 72, :fm, 0.25, 0.18
        sleep 0.08
        logo_note 84, :fm, 0.30, 0.38
      end
    end

  when 7
    puts "LOGO 07 | Pixel Halo"
    with_fx :echo, phase: 0.07, decay: 0.25, mix: 0.2 do
      logo_note 90, :pulse, 0.23, 0.12
      sleep 0.07
      logo_note 97, :pulse, 0.22, 0.12
      sleep 0.07
      logo_note 102, :tri, 0.28, 0.42
    end

  when 8
    puts "LOGO 08 | Soft Circuit"
    with_fx :reverb, room: 0.55, mix: 0.2 do
      logo_note 60, :sine, 0.28, 0.16
      sleep 0.09
      logo_note 72, :sine, 0.27, 0.16
      sleep 0.09
      logo_note 84, :saw, 0.16, 0.34, 100
    end

  when 9
    puts "LOGO 09 | Orbital Ping"
    with_fx :echo, phase: 0.13, decay: 0.42, mix: 0.32 do
      logo_note 89, :beep, 0.32, 0.14
      sleep 0.10
      logo_note 96, :beep, 0.28, 0.24
    end

  when 10
    puts "LOGO 10 | Neon Door"
    with_fx :reverb, room: 0.68, mix: 0.24 do
      with_fx :distortion, distort: 0.12, mix: 0.16 do
        logo_note 52, :dsaw, 0.25, 0.23, 90
        sleep 0.12
        logo_chord [76, 83, 91], :pretty_bell, 0.25, 0.45
      end
    end

  # GROUP 3: WARM / HUMAN
  when 11
    puts "LOGO 11 | Wooden Spark"
    with_fx :reverb, room: 0.5, mix: 0.18 do
      logo_sample :kalimba, amp: 0.23, rate: 1.25, start: 0.02, finish: 0.18
      logo_note 79, :pluck, 0.30, 0.32
      sleep 0.12
      logo_note 86, :pretty_bell, 0.22, 0.42
    end

  when 12
    puts "LOGO 12 | Thumbprint"
    with_fx :reverb, room: 0.5, mix: 0.2 do
      logo_note 67, :pluck, 0.35, 0.22
      sleep 0.11
      logo_note 74, :pluck, 0.29, 0.22
      sleep 0.11
      logo_note 79, :pluck, 0.27, 0.38
    end

  when 13
    puts "LOGO 13 | Tiny Gamelan"
    with_fx :reverb, room: 0.72, mix: 0.28 do
      logo_sample :gamelan, amp: 0.2, rate: 1.35, start: 0.02, finish: 0.22
      logo_chord [72, 76, 83], :pretty_bell, 0.24, 0.52
    end

  when 14
    puts "LOGO 14 | Sitar Glint"
    with_fx :reverb, room: 0.48, mix: 0.2 do
      logo_sample :sitar_chikari, amp: 0.28, rate: 1.3, start: 0.02, finish: 0.2
      sleep 0.10
      logo_note 91, :pretty_bell, 0.24, 0.42
    end

  when 15
    puts "LOGO 15 | Autoharp Aurora"
    with_fx :reverb, room: 0.78, mix: 0.33 do
      logo_chord [67, 74, 79, 86], :pretty_bell, 0.22, 0.62
      sleep 0.09
      logo_note 98, :pretty_bell, 0.22, 0.55
    end

  # GROUP 4: STRANGE / CHARACTER
  when 16
    puts "LOGO 16 | Zorro Zap"
    with_fx :reverb, room: 0.3, mix: 0.12 do
      logo_sample :zorro, amp: 0.26, rate: 0.8, start: 0.02, finish: 0.42
      sleep 0.10
      logo_note 88, :fm, 0.24, 0.3
    end

  when 17
    puts "LOGO 17 | Rubber Comet"
    with_fx :echo, phase: 0.09, decay: 0.28, mix: 0.22 do
      logo_note 55, :tb303, 0.2, 0.15, 110
      sleep 0.08
      logo_note 79, :tb303, 0.19, 0.15, 115
      sleep 0.08
      logo_note 91, :pretty_bell, 0.25, 0.38
    end

  when 18
    puts "LOGO 18 | Clockwork Mote"
    with_fx :reverb, room: 0.45, mix: 0.16 do
      logo_sample :pipe_chimes, amp: 0.20, rate: 1.4, start: 0.02, finish: 0.28
      logo_note 83, :pretty_bell, 0.25, 0.42
    end

  when 19
    puts "LOGO 19 | Liquid Metal"
    with_fx :reverb, room: 0.62, mix: 0.25 do
      with_fx :echo, phase: 0.10, decay: 0.36, mix: 0.24 do
        logo_note 64, :fm, 0.23, 0.12
        sleep 0.07
        logo_note 83, :fm, 0.22, 0.12
        sleep 0.07
        logo_note 95, :pretty_bell, 0.24, 0.46
      end
    end

  when 20
    puts "LOGO 20 | Tiny Impact"
    with_fx :reverb, room: 0.55, mix: 0.18 do
      logo_sample :tiny_crash, amp: 0.22, rate: 1.8, start: 0.02, finish: 0.36
      logo_note 86, :pretty_bell, 0.24, 0.44
    end

  # GROUP 5: MINIATURE ORCHESTRAL
  when 21
    puts "LOGO 21 | Brass & Glass"
    with_fx :reverb, room: 0.75, mix: 0.3 do
      logo_note 60, :braids, 0.2, 0.17
      sleep 0.12
      logo_chord [72, 79, 84], :pretty_bell, 0.25, 0.52
    end

  when 22
    puts "LOGO 22 | Velvet Chord"
    with_fx :reverb, room: 0.86, mix: 0.34 do
      logo_chord [69, 76, 81, 88], :piano, 0.25, 0.48
      sleep 0.12
      logo_note 93, :pretty_bell, 0.2, 0.48
    end

  when 23
    puts "LOGO 23 | Celestial Stamp"
    with_fx :reverb, room: 0.92, mix: 0.37 do
      logo_note 72, :hollow, 0.18, 0.24
      sleep 0.12
      logo_note 84, :pretty_bell, 0.28, 0.5
      sleep 0.06
      logo_note 91, :pretty_bell, 0.2, 0.48
    end

  when 24
    puts "LOGO 24 | Golden Interval"
    with_fx :reverb, room: 0.75, mix: 0.28 do
      logo_chord [67, 74, 81], :pretty_bell, 0.25, 0.48
      sleep 0.12
      logo_note 90, :pretty_bell, 0.24, 0.5
    end

  when 25
    puts "LOGO 25 | Ribbon Finish"
    with_fx :echo, phase: 0.105, decay: 0.4, mix: 0.22 do
      with_fx :reverb, room: 0.82, mix: 0.3 do
        logo_note 76, :tri, 0.22, 0.14
        sleep 0.08
        logo_note 83, :tri, 0.22, 0.14
        sleep 0.08
        logo_note 91, :pretty_bell, 0.25, 0.55
      end
    end

  # GROUP 6: HYBRID / ODD COUPLINGS
  when 26
    puts "LOGO 26 | Gamelan Boot"
    with_fx :reverb, room: 0.64, mix: 0.24 do
      logo_sample :gamelan, amp: 0.18, rate: 1.6, start: 0.03, finish: 0.18
      logo_note 48, :fm, 0.18, 0.14
      sleep 0.10
      logo_chord [76, 83, 88], :pretty_bell, 0.23, 0.48
    end

  when 27
    puts "LOGO 27 | Chime & Circuit"
    with_fx :echo, phase: 0.08, decay: 0.32, mix: 0.23 do
      logo_sample :pipe_chimes, amp: 0.15, rate: 1.2, start: 0.05, finish: 0.22
      logo_note 96, :pulse, 0.18, 0.1
      sleep 0.1
      logo_note 88, :pretty_bell, 0.25, 0.46
    end

  when 28
    puts "LOGO 28 | Bent Glass"
    with_fx :reverb, room: 0.78, mix: 0.29 do
      with_fx :echo, phase: 0.12, decay: 0.38, mix: 0.2 do
        logo_sample :wobble_bell, amp: 0.18, rate: 1.25, start: 0.03, finish: 0.25
        logo_note 78, :sine, 0.2, 0.2
        sleep 0.10
        logo_note 91, :pretty_bell, 0.22, 0.48
      end
    end

  when 29
    puts "LOGO 29 | Chordal Spark"
    with_fx :reverb, room: 0.92, mix: 0.38 do
      logo_chord [72, 79, 84, 91], :pretty_bell, 0.19, 0.62
      sleep 0.08
      logo_note 100, :pretty_bell, 0.2, 0.55
    end

  when 30
    puts "LOGO 30 | The Signature"
    with_fx :reverb, room: 0.82, mix: 0.31 do
      with_fx :echo, phase: 0.09, decay: 0.36, mix: 0.2 do
        logo_sample :pretty_bell, amp: 0.19, start: 0.04, finish: 0.2
        logo_note 72, :fm, 0.18, 0.13
        sleep 0.09
        logo_note 79, :fm, 0.18, 0.13
        sleep 0.09
        logo_chord [84, 91, 96], :pretty_bell, 0.23, 0.58
      end
    end
  end
end

# ---------- NAVIGATION SOUNDS ----------
define :count_tick do
  use_synth :beep
  with_fx :reverb, room: 0.2, mix: 0.08 do
    play 96, amp: 0.22, attack: 0.001, sustain: 0.005, release: 0.055
  end
end

define :count_tock do
  use_synth :beep
  with_fx :lpf, cutoff: 75 do
    with_fx :reverb, room: 0.45, mix: 0.18 do
      play 48, amp: 0.34, attack: 0.002, sustain: 0.02, release: 0.20
    end
  end
end

# ---------- RUN THE AUDITION ----------
puts "============================================"
puts "AUDIO LOGO AUDITION: 30 DESIGNS"
puts "Six groups. Four TICKS, then one TOCK."
puts "Sample root: #{SAMPLE_ROOT}"
puts "Library samples enabled: #{USE_LIBRARY_SAMPLES}"
puts "============================================"

30.times do |offset|
  logo_id = offset + 1
  puts ""
  puts "---- AUDITION POSITION #{logo_id}/30 ----"
  audio_logo logo_id
  sleep LOGO_GAP

  slot_in_group = (logo_id - 1) % LOGOS_PER_GROUP

  if slot_in_group < 4
    count_tick
    puts "tick #{slot_in_group + 1}/4"
  else
    count_tock
    puts "TOCK: end of group #{(logo_id - 1) / LOGOS_PER_GROUP + 1}"
  end

  sleep MARKER_GAP
end

puts "AUDITION COMPLETE. Re-run and compare your shortlist."
