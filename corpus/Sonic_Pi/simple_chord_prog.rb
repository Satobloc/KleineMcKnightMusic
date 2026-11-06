define :play_chord_progression do |chords, duration|
  chords.each do |chord|
    play chord, sustain: duration
    sleep duration
  end
end

# Chord progression
chords = [:f4, chord(:D, :minor7), :f4, chord(:Bb, :major, invert: 1)]
duration = 2

# Play the chord progression
play_chord_progression(chords, duration)
