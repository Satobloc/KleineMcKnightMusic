#MUMBLISH

use_bpm 60
use_debug false
use_sched_ahead_time 1

# Define instrumentation and melody information
instruments = {
  pad_synth: :hollow,
  lead_synth: :pluck,
  ambient_synth: :prophet,
  guitar_synth: :pluck,
  voice_synth: :dark_ambience,
  beat_samples: [:bd_zome, :drum_bass_hard],
  background_sample: :loop_compus,
  glitch_sample: :elec_plip
}

melody_notes = [:e4, :g4, :a4, :b4, :a4, :g4, :e4, :b3]

# Define a function for the beat samples
define :play_beat do |sample_name, rate=1|
  sample sample_name, rate: rate, amp: 0.5
end

# Define a function for glitchy effects
define :glitch_effect do |synth_name, note|
  with_fx :bitcrusher, bits: 8, sample_rate: 8000 do
    with_synth synth_name do
      play note, release: 2, cutoff: rrand(60, 120), res: 0.9
    end
  end
end

# Define a function for background texture
define :background_texture do |sample_name|
  sample sample_name, rate: rrand(0.5, 1.5), amp: 0.5
end

# Define a function for a Pink Floyd-like melody
define :pink_floyd_melody do |notes, synth_name|
  with_fx :reverb, room: 1 do
    with_fx :echo, phase: 0.75, decay: 8 do
      with_synth synth_name do
        notes.each do |n|
          play n, release: 4, amp: 0.8
          sleep 2
        end
      end
    end
  end
end

# Define a function for voice-like effects
define :voice_effect do |synth_name, note|
  with_fx :pitch_shift, pitch: 12 do
    with_synth synth_name do
      play note, release: 4, amp: 0.7
    end
  end
end

# Ambient pad loop
live_loop :ambient_pads do
  use_synth instruments[:pad_synth]
  play chord(:e3, :minor), release: 16, amp: 1
  sleep 8
  play chord(:a3, :minor), release: 16, amp: 1
  sleep 8
end

# Beat loop
live_loop :beats do
  sync :ambient_pads
  play_beat instruments[:beat_samples].choose, rrand(0.8, 1.2)
  sleep 8
end

# Pink Floyd-like melody loop
live_loop :pink_floyd_melody do
  sync :ambient_pads
  pink_floyd_melody melody_notes, instruments[:lead_synth]
end

# Ambient guitar-like melody loop
live_loop :guitar_melody do
  sync :ambient_pads
  use_synth instruments[:guitar_synth]
  play_pattern_timed scale(:e3, :minor_pentatonic), [0.25, 0.5, 0.75].choose, release: 1, amp: 0.6, pan: rrand(-1, 1)
end

# Additional background texture
live_loop :background do
  sync :ambient_pads
  background_texture instruments[:background_sample]
  sleep 16
end

# Subtle rhythmic glitches
live_loop :rhythmic_glitches do
  sync :ambient_pads
  sample instruments[:glitch_sample], rate: rrand(-1, 1), amp: 0.3, pan: rrand(-1, 1) if one_in(3)
  sleep [0.5, 1, 2].choose
end

# Voice-like effects loop
live_loop :voice_effects do
  sync :ambient_pads
  voice_effect instruments[:voice_synth], (scale :e3, :minor_pentatonic).choose
  sleep [4, 8].choose
end

# Soft pad progression
live_loop :soft_pads do
  sync :ambient_pads
  use_synth instruments[:ambient_synth]
  play :e4, release: 16, cutoff: 80, amp: 0.4
  sleep 8
  play :a4, release: 16, cutoff: 80, amp: 0.4
  sleep 8
end
