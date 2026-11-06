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

define :melody_instrument do
  # List of available synths
  synths = [:piano, :pretty_bell, :pluck, :sine, :tri, :fm, :blade, :prophet, :dpulse, :dsaw, :dtri, :tb303]
  
  # Randomly select a synth from the list
  selected_synth = synths.choose
  
  # Return the selected synth
  return selected_synth
end

live_loop :drums do
  sample :drum_heavy_kick
  sleep 1
  sample :drum_snare_hard
  sleep 1
  sample :drum_heavy_kick
  sleep 1
  sample :drum_snare_hard
  sleep 1
end

live_loop :hihat do
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_pedal
  sleep 1
end

live_loop :bass do
  use_synth :blade
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
  randomize_melody
end