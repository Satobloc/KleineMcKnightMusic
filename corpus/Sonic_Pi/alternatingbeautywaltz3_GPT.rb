# Set BPM and time signature
use_bpm 120
time_signature = 3

# Define the drum loop
live_loop :drums do
  3.times do
    sample :drum_bass_hard, amp: 0.6
    sleep 1
    sample :drum_snare_hard, amp: 0.6
    sleep 1
    sample :drum_snare_soft, amp: 0.4
    sleep 1
  end
end

# Define the bass loop for the verse
live_loop :bass_verse do
  sync :verse
  bass_notes = (ring :C2, :G2, :C2)
  durations = (ring 1, 1, 1)
  bass_notes.length.times do |i|
    use_synth :fm
    play bass_notes[i], release: durations[i], amp: 0.7
    sleep durations[i]
  end
end

# Define the bass loop for the chorus
live_loop :bass_chorus do
  sync :chorus
  bass_notes = (ring :F2, :G2, :C2)
  durations = (ring 1, 1, 1)
  bass_notes.length.times do |i|
    use_synth :fm
    play bass_notes[i], release: durations[i], amp: 0.7
    sleep durations[i]
  end
end

# Define the chord progression for the verse
verse_chord_progression = [[60, 64, 67], [65, 69, 72], [67, 71, 74]]

# Define the chord loop for the verse
live_loop :chords_verse do
  sync :verse
  3.times do
    verse_chord_progression.each do |chord|
      use_synth :hollow
      play_chord chord, release: time_signature, amp: 0.5
      sleep time_signature
    end
  end
end

# Define the chord progression for the chorus
chorus_chord_progression = [[65, 69, 72], [67, 71, 74], [60, 64, 67], [62, 66, 69]]

# Define the chord loop for the chorus
live_loop :chords_chorus do
  sync :chorus
  3.times do
    chorus_chord_progression.each do |chord|
      use_synth :hollow
      play_chord chord, release: time_signature, amp: 0.5
      sleep time_signature
    end
  end
end

# Define the primary melody loop for the verse
live_loop :melody_verse do
  sync :verse
  [1, 3, 6, 4].each do |d|
    (range -3, 3).each do |i|
      play_chord (chord_degree d, :c, :major, 3, invert: i)
      sleep 0.25
    end
  end
end

# Define the harmonizing melody loop for the verse
live_loop :harmony_verse do
  sync :verse
  [2, 4, 5, 7].each do |d|
    (range -3, 3).each do |i|
      play_chord (chord_degree d, :c, :major, 3, invert: i)
      sleep 0.25
    end
  end
end

# Define the melody loop for the chorus
live_loop :melody_chorus do
  sync :chorus
  [6, 5, 4, 3].each do |d|
    (range -3, 3).each do |i|
      play_chord (chord_degree d, :c, :major, 3, invert: i)
      sleep 0.25
    end
  end
end

# Define the harmony loop for the chorus
live_loop :harmony_chorus do
  sync :chorus
  [7, 6, 5, 4].each do |d|
    (range -3, 3).each do |i|
      play_chord (chord_degree d, :c, :major, 3, invert: i)
      sleep 0.25
    end
  end
end

# Define the song structure
4.times do
  cue :verse
  sleep 24 # Wait for one repetition of verse chords and melody
  cue :chorus
  sleep 24 # Wait for one repetition of chorus chords and melody
end

