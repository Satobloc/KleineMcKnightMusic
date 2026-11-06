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

# Define the bass loop
live_loop :bass do
  bass_notes = (ring :C2, :G2, :C2)
  durations = (ring 1, 1, 1)
  bass_notes.length.times do |i|
    use_synth :fm
    play bass_notes[i], release: durations[i], amp: 0.7
    sleep durations[i]
  end
end

# Define the chord progression
chord_progression = [[60, 64, 67], [65, 69, 72], [67, 71, 74]]

# Define the chord loop
live_loop :chords do
  3.times do
    chord_progression.each do |chord|
      use_synth :hollow
      play_chord chord, release: time_signature, amp: 0.5
      sleep time_signature
    end
  end
end

# Define the melody loop
live_loop :melody do
  melody_notes = (ring :E4, :D4, :C4)
  durations = (ring 0.5, 0.5, 1)
  melody_notes.length.times do |i|
    use_synth :piano
    play melody_notes[i], release: durations[i], amp: 0.5
    sleep durations[i]
  end
end

