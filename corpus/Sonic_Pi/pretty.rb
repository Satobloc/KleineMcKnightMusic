use_bpm 120

# Define the scale for the piece (you can adjust this)
scale_notes = scale(:C4, :dorian, num_octaves: 2)

# Define a function for playing notes with counterpoint
define :play_counterpoint do |note1, note2, duration|
  in_thread do
    play note1, sustain: duration
  end
  play note2, sustain: duration
end

# Play the fusion piece with counterpoint
live_loop :fusion_counterpoint do
  4.times do
    play_counterpoint choose(scale_notes), choose(scale_notes), 0.5
    sleep 0.5
  end
end
