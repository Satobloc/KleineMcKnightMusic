define :guitar_picking do |notes|
  use_synth :pluck
  notes.each do |note|
    play note
    sleep 0.25
  end
end

live_loop :guitar_pattern do
  # Define a chord or sequence of notes
  chord_notes = chord(:E3, :minor)
  
  # Play the pattern repeatedly
  4.times do
    guitar_picking(chord_notes)
  end
  
  # Change chord to keep it interesting
  chord_notes = chord(:A3, :minor)
  4.times do
    guitar_picking(chord_notes)
  end
end
