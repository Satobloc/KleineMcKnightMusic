
#MUMLIKE -- GOOD SAVED

use_bpm 60
use_debug false
use_sched_ahead_time 1

# Define a function for the beat samples
define :play_beat do |sample_name, rate=1|
  sample sample_name, rate: rate, amp: 0.7
end

# Define a function for glitchy effects
define :glitch_effect do |synth_name, note|
  with_fx :bitcrusher, bits: 8, sample_rate: 8000 do
    with_synth synth_name do
      play note, release: 0.5, cutoff: rrand(60, 120), res: 0.9
    end
  end
end

# Define a function for background texture
define :background_texture do |sample_name|
  sample sample_name, rate: rrand(0.5, 1.5), amp: 0.5
end

# Ambient pad loop
live_loop :ambient_pads do
  use_synth :hollow
  play chord(:e3, :minor), release: 16, amp: 1
  sleep 8
  play chord(:a2, :minor), release: 16, amp: 1
  sleep 8
end

# Beat loop
live_loop :beats do
  sync :ambient_pads
  play_beat :arovane_beat_a, rrand(0.8, 1.2)
  sleep 8
end

# Glitchy melody loop
live_loop :glitch_melody do
  sync :ambient_pads
  use_random_seed 300
  
  8.times do
    n = (scale :e3, :minor_pentatonic).choose
    glitch_effect(:sc808_maracas, n)
    sleep [0.25, 0.5, 0.75].choose
  end
end

# Additional background texture
live_loop :background do
  sync :ambient_pads
  background_texture :loop_compus
  sleep 8
end

# Subtle rhythmic glitches
live_loop :rhythmic_glitches do
  sync :ambient_pads
  sample :elec_bell, rate: rrand(-1, 1), amp: 0.3, pan: rrand(-1, 1) if one_in(3)
  sleep [0.25, 0.5, 0.75, 1].choose
end

# Soft pad progression
live_loop :soft_pads do
  sync :ambient_pads
  use_synth :prophet
  play :e4, release: 8, cutoff: 80, amp: 0.5
  sleep 4
  play :g4, release: 8, cutoff: 80, amp: 0.5
  sleep 4
end
