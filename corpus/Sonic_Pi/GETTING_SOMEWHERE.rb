# Set BPM and time signature
use_bpm 120
time_signature = 3

synths1 = [:sine, :saw, :pulse, :tb303, :dsaw, :tri, :zawa]
synths2 = [:rhodey, :pluck, :piano, :organ_tonewheel, :sc808_clap]
synths3 = [:sine, :gabberkick, :bass_foundation, :beep, :winwood_lead]


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
    use_synth synths1.choose # Choose a random synth from the list
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
      use_synth synths2.choose # Choose a random synth from the list
      play_chord chord, release: time_signature, amp: 0.5
      sleep time_signature
    end
  end
end

# Define the melody loop using the provided code snippet
live_loop :melody do
  [1, 3, 6, 4].each do |d|
    (range -3, 3).each do |i|
      use_synth synths3.choose # Choose a random synth from the list
      play_chord (chord_degree d, :c, :major, 3, invert: i)
      sleep 0.25
    end
  end
end
