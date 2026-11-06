#MUM MARKOV E Minor

use_bpm 60
use_debug false
use_sched_ahead_time 1

# Define instrumentation and melody information
instruments = {
  pad_synth: :hollow,
  lead_synth: :pluck,
  markov_synth: :organ_tonewheel,
  slide_synth: :saw,
  ambient_synth: :prophet,
  guitar_synth: :piano,
  voice_synth: :dark_ambience,
  beat_samples: [:elec_plip, :elec_twang],
  background_sample: :elec_twang,
  glitch_sample: :elec_plip
}

melody_notes = [:e4, :g4, :a4, :b4, :a4, :g4, :e4, :b3]

# Define a Markov chain for note transitions
markov_chain = {
  :c4 => { :e3 => 0.3, :g4 => 0.7 },
  :e3 => { :g5 => 0.2, :c4 => 0.8 },
  :g4 => { :c4 => 0.7, :a5 => 0.3 },
  :a5 => { :g4 => 0.9, :e5 => 0.1 },
  :g5 => { :e3 => 0.8, :c5 => 0.2 },
  :c5 => { :c4 => 0.5, :a5 => 0.5 },
  :e5 => { :g4 => 0.8, :c5 => 0.2 }
}

# Function to get the next note based on the Markov chain
def next_note_chain(current_note, chain)
  next_notes = chain[current_note]
  total_weight = next_notes.values.sum
  rand_val = rand * total_weight
  cumulative_weight = 0
  next_notes.each do |note, weight|
    cumulative_weight += weight
    return note if rand_val < cumulative_weight
  end
end

# Generate a sequence based on the Markov chain
current_note = :c4
sequence = [current_note]
50.times do
  current_note = next_note_chain(current_note, markov_chain)
  sequence << current_note
end

# Convert note symbols to MIDI numbers
note_to_midi = { :c4 => 60, :e3 => 52, :g4 => 67, :a5 => 81, :g5 => 79, :c5 => 72, :e5 => 76 }

# Define a function for the beat samples
define :play_beat do |sample_name, rate=1, amp=0.5|
  sample sample_name, rate: rate, amp: amp
end

# Define a function for glitchy effects
define :glitch_effect do |synth_name, note|
  with_fx :bitcrusher, bits: 8, sample_rate: 8000 do
    with_synth synth_name do
      play note, release: 2, cutoff: rrand(60, 120), res: 0.9, amp: 0.6
    end
  end
end

# Define a function for background texture
define :background_texture do |sample_name, amp=0.5|
  sample sample_name, rate: rrand(0.5, 1.5), amp: amp
end

# Define a function for a Pink Floyd-like melody
define :pink_floyd_melody do |notes, synth_name, amp=0.8|
  with_fx :reverb, room: 1 do
    with_fx :echo, phase: 0.75, decay: 8 do
      with_synth synth_name do
        notes.each do |n|
          play n, release: 4, amp: amp
          sleep 2
        end
      end
    end
  end
end

# Define a function for voice-like effects
define :voice_effect do |synth_name, note, amp=0.5|
  with_fx :pitch_shift, pitch: 12 do
    with_synth synth_name do
      play note, release: 4, amp: amp
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
  sleep rrand(1, 12)
end

# Pink Floyd-like melody loop
live_loop :pink_floyd_melody do
  sync :ambient_pads
  pink_floyd_melody melody_notes, instruments[:lead_synth]
  sleep 8
  pink_floyd_melody melody_notes.shuffle, instruments[:lead_synth]
  sleep 8
end

# Ambient guitar-like melody loop
live_loop :guitar_melody do
  with_fx :reverb, room: 1.5 do
    sync :ambient_pads
    use_synth instruments[:guitar_synth]
    play_pattern_timed scale(:e4, :minor_pentatonic), (ring 0.5, 0.5, 1), amp: 0.8
    play_pattern_timed scale(:e5, :minor_pentatonic), [0.5, 0.25].shuffle, amp: 0.8
  end
end

# Additional background texture
live_loop :background do
  sync :ambient_pads
  background_texture instruments[:background_sample]
  sleep 1
end

# Subtle rhythmic glitches
live_loop :rhythmic_glitches do
  sync :ambient_pads
  sample instruments[:glitch_sample], rate: rrand(-1, 1), amp: 0.5, pan: rrand(-1, 1) if one_in(3)
  sleep [1, 2, 4, 8].choose
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
  play :e4, release: 16, cutoff: 80, amp: 0.5
  sleep 4
  play :a4, release: 16, cutoff: 80, amp: 0.5
  sleep 4
end

# Play the sequence in Sonic Pi
live_loop :markov_chain do
  sync :ambient_pads
  use_synth instruments[:markov_synth]
  sequence.each do |note|
    puts 'MARKOV CHAIN'
    puts note
    play note_to_midi[note], release: 3, cutoff: 80, amp: 0.6
    sleep [2, 4].choose
  end
end

live_loop :slidery do
  sync :ambient_pads
  with_fx :tremolo, phase: [4, 7].choose, phase_slide: [4, 7].choose do |e|
    with_fx :ping_pong, phase: [4, 7].choose, phase_slide: [4, 7].choose do |s|
      use_synth instruments[:slide_synth]
      play [67, 71].choose, release: [1, 2].choose
      s = play [64, 71].choose, release: [2, 8].choose, note_slide: [4, 7].choose, amp_slide: [0.4, 0.6].choose
      control e, phase: [4, 7].choose
      control s, note: [64, 67].choose
      sleep 8
    end
  end
end

