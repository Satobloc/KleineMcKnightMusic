use_bpm 120

define :randomize_melody do
  # Define the pitches and durations arrays
  pitches = [:c4, :e4, :f4, :g4, :f4, :e4, :f4, :g4, :f4, :e4, :f4]
  durations = [0.25, 0.25, 0.25, 1.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25]
  
  # Shuffle the pitches and durations arrays
  shuffled_pitches = pitches.shuffle
  shuffled_durations = durations.shuffle
  
  # Play the melody with the shuffled pitches and durations
  play_pattern_timed shuffled_pitches, shuffled_durations, attack: 0, release: 0.2
end

define :randomized_fx_mods do |melody_function|
  # Define an array of FX effects to choose from
  fx_effects = [:echo, :reverb, :distortion, :flanger, :pitch_shift]
  
  # Choose a random effect from the fx_effects array
  selected_fx = fx_effects.choose
  
  # Apply the selected effect to the melody function
  case selected_fx
  when :echo
    with_fx :echo, phase: [0.25, 0.5, 0.75].choose do
      melody_function.call
    end
  when :reverb
    with_fx :reverb, room: [0.5, 0.7, 0.9].choose, damp: [0.3, 0.5, 0.7].choose do
      melody_function.call
    end
  when :distortion
    with_fx :distortion, distort: [0.5, 0.7, 0.9].choose do
      melody_function.call
    end
  when :flanger
    with_fx :flanger, depth: [0.5, 0.7, 0.9].choose, feedback: [0.3, 0.5, 0.7].choose do
      melody_function.call
    end
  when :pitch_shift
    with_fx :pitch_shift, pitch: [-12, 12].choose do
      melody_function.call
    end
  end
end

define :randomize_melody do
  # Define the pitches and durations arrays
  pitches = [:c4, :e4, :f4, :g4, :f4, :e4, :f4, :g4, :f4, :e4, :f4]
  durations = [0.25, 0.25, 0.25, 1.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25]
  
  # Shuffle the pitches and durations arrays
  shuffled_pitches = pitches
  shuffled_durations = durations.shuffle
  
  # Play the melody with the shuffled pitches and durations
  play_pattern_timed shuffled_pitches, shuffled_durations, attack: 0, release: 0.2
end

define :melody_instrument do
  # List of available synths
  synths = [:piano, :pretty_bell, :pluck, :sine, :tri, :fm, :blade, :prophet, :dpulse, :dsaw, :dtri, :tb303]
  
  # Randomly select a synth from the list
  selected_synth = synths.choose
  
  # Return the selected synth
  return selected_synth
end

define :bass_instrument do
  # List of available synths
  synths = [:dsaw, :dsaw, :prophet, :blade, :saw, :pulse, :subpulse, :tb303, :beep, :tri, :chipbass, :hollow, :zawa, :mod_beep, :mod_tri, :mod_saw, :mod_pulse, :mod_dsaw, :mod_fm, :mod_sine, :mod_dsaw, :mod_dsaw]
  
  # Randomly select a synth from the list
  selected_bass = synths.choose
  
  # Return the selected synth
  return selected_bass
end


define :percussion_instrument do
  # List of available synths
  samples = [:drum_bass_soft, :drum_snare_soft, :drum_cymbal_soft, :drum_tom_mid_soft, :drum_tom_low_soft, :drum_tom_hi_soft, :drum_cymbal_closed_soft, :drum_cymbal_pedal_soft, :drum_cymbal_hard, :drum_splash_soft]
  
  # Randomly select a synth from the list
  selected_sample = samples.choose
  
  # Return the selected synth
  return selected_sample
end


live_loop :drums do
  percussion_instrument
  sleep 1
  percussion_instrument
  sleep 1
  percussion_instrument
  sleep 1
  percussion_instrument
  sleep 1
end

live_loop :hihat do
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_pedal
  sleep 1
end

live_loop :bass do
  use_synth bass_instrument
  play :c2, attack: 0, release: [0.25, 0.5].choose
  sleep 0.25
  play :c2, attack: 0, release: [0.3, 0.15].choose
  sleep 2
  play :e2
  sleep 0.75
  play :f2
  sleep 1
end

live_loop :melody do
  use_synth melody_instrument
  randomized_fx_mods(method(:randomize_melody))
end