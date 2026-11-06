use_bpm 120

define :guitar_picking do |notes|
  use_synth :pluck
  notes.each do |note|
    play note, release: 0.1, amp: 0.8
    sleep 0.25
  end
end

live_loop :guitar_pattern do
  # Define a random seed for shuffling
  seed = 82275
  
  # Shuffle the notes using the random seed
  use_random_seed seed
  chord_notes = chord(:E3, :minor).shuffle
  
  # Play the pattern repeatedly
  4.times do
    guitar_picking(chord_notes).shuffle
  end
  sleep 0.15
  
  # Change the random seed for the next chord
  seed = tick
  
  # Shuffle the notes using the new random seed
  use_random_seed seed
  chord_notes = chord(:A3, :minor).shuffle
  
  4.times do
    guitar_picking(chord_notes).shuffle
  end
end
