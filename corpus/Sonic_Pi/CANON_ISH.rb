use_bpm Math.sin(vt)+60  # Adjust the tempo as needed


###FUNCTIONS###
# Function to play each note in a chord
define :play_chord_notes do |chord|
  use_synth :pluck
  chord.each do |note|
    x.times do
      play note, sustain: 1, release: 1
    end
  end
end

# List of chords to be played sequentially
chords = [
  chord(:d5, :major),  # D major chord
  chord(:a4, :major),   # A major chord
  chord(:b4, :major),   # B major chord
  chord(:fs4, :major),  # F# major chord
  chord(:g4, :major),   # G major chord
  chord(:d5, :major),  # D major chord (repeated)
  chord(:g4, :major),   # G major chord (repeated)
  chord(:a4, :major)    # A major chord (repeated)
]

#chord_type = ct  # Define the chord type
#chord(:d4, :maj),  # D major chord
chords_aug = [
  chord(:d4, :maj),  # D major chord
  chord(:a, :maj),   # A major chord
  chord(:b, :maj),   # B major chord
  chord(:fs, :min),  # F# major chord
  chord(:g, :min),   # G major chord
  chord(:d4, :maj),  # D major chord (repeated)
  chord(:g, :maj),   # G major chord (repeated)
  chord(:a, :maj)    # A major chord (repeated)
]

###LIVE_LOOPS###

puts synth_names

live_loop :play_chords do
  use_synth :beep
  chords.each do |chords|
    play_chord chords, sustain: 1, release: 1  # Play each chord
    sleep 1.8  # Wait before playing the next chord
  end
end


live_loop :play_chords_notes do
  sleep 0.2
  chords_aug.each do |chord_notes|
    play_pattern_timed play_chord_notes(chord_notes), [0.1,0.075,0.08]  # Play each chord
    sleep 0.1  # Wait before playing the next chord
  end
end



