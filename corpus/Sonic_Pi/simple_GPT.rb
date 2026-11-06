# Define the melody
melody = [:c4, :e4, :g4, :a4, :g4, :e4]

# Define the duration of each note
note_duration = 0.5

# Play the melody with variations
live_loop :melody do
  # Play the original melody
  melody.each do |note|
    play note, release: note_duration
    sleep note_duration
  end
  
  # Add variations to the melody
  melody.reverse.each do |note|
    play note, release: note_duration
    sleep note_duration
  end
end
