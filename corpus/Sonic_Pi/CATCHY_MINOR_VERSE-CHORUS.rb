use_bpm 120

# Verse
define :bouncy_melody do
  use_synth :blade
  play_pattern_timed [:a4, :b4, :c5, :e5, :d5, :c5, :b4, :a4,
                      :a4, :c5, :e5, :g5, :e5, :c5, :b4, :a4,
                      :e4, :g4, :a4, :b4, :c5, :b4, :a4, :g4,
  :e4, :a4, :c5, :e5, :d5, :c5, :b4, :a4],
    [0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
     0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
     0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
     0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5], amp: 3
end

define :chord_progression_1 do
  use_synth :winwood_lead
  play_chord [:a3, :c4, :e4], sustain: 2, amp: 7
  sleep 2
  play_chord [:g3, :b3, :d4], sustain: 2, amp: 7
  sleep 2
  play_chord [:f3, :a3, :c4], sustain: 2, amp: 7
  sleep 2
  play_chord [:e3, :g3, :b3], sustain: 2, amp: 7
  sleep 2
end

define :chord_progression_2 do
  use_synth :beep
  play_chord [:a3, :c4, :e4], sustain: 2, amp: 7
  sleep 2
  play_chord [:f3, :a3, :c4], sustain: 2, amp: 7
  sleep 2
  play_chord [:d3, :f3, :a3], sustain: 2, amp: 7
  sleep 2
  play_chord [:e3, :g3, :b3], sustain: 2, amp: 7
  sleep 2
end

# Chorus
define :catchy_chorus_melody do
  use_synth :prophet
  play_pattern_timed [:c5, :e5, :g5, :a5, :g5, :e5, :c5, :d5,
  :e5, :g5, :a5, :c6, :b5, :a5, :g5, :e5],
    [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
     0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1.0], amp: 3
end

define :catchy_chorus_chords do
  use_synth :prophet
  play_chord [:c4, :e4, :g4], sustain: 1.5, amp: 6
  sleep 1.5
  play_chord [:g3, :b3, :d4], sustain: 1.5, amp: 6
  sleep 1.5
  play_chord [:a3, :c4, :e4], sustain: 1.5, amp: 6
  sleep 1.5
  play_chord [:f3, :a3, :c4], sustain: 1.5, amp: 6
  sleep 1.5
end

# Live loops
live_loop :verse do
  2.times do
    bouncy_melody
    sleep 8 # To ensure the loop matches the length of the melody
  end
  2.times do
    chord_progression_1
    chord_progression_2
  end
end

live_loop :chorus do
  sync :verse
  2.times do
    catchy_chorus_melody
    catchy_chorus_chords
  end
  sleep 8 # To ensure the loop matches the length of the chorus
end
