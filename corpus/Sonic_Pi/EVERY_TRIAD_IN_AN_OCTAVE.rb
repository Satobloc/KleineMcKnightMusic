use_bpm 120
use_synth :piano

# Define the notes of the octave
notes = [:c4, :d4, :e4, :f4, :g4, :a4, :b4, :c5]

# Define the intervals for each type of triad
triads = {
  major: [0, 4, 7],
  minor: [0, 3, 7],
  diminished: [0, 3, 6],
  augmented: [0, 4, 8]
}

# Method to play a triad
define :play_triad do |note, intervals|
  chord_notes = intervals.map { |i| note + i }
  play_chord chord_notes, sustain: 1
  sleep 1.5
end

live_loop :triads do
  notes.each do |note|
    triads.each do |type, intervals|
      play_triad note, intervals
      sleep 0.5
    end
  end
  sleep 4
end
