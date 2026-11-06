use_bpm 120

# Verse
define :bouncy_melody do
  use_synth :piano
  play_pattern_timed [:a4, :b4, :c5, :e5, :d5, :c5, :b4, :a4,
                      :a4, :c5, :e5, :g5, :e5, :c5, :b4, :a4,
                      :e4, :g4, :a4, :b4, :c5, :b4, :a4, :g4,
  :e4, :a4, :c5, :e5, :d5, :c5, :b4, :a4],
    [0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
     0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
     0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
     0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5],
    amp: rrand(2, 4), attack: rrand(0.1, 0.3)
end

define :chord_progression_1 do
  use_synth :piano
  play_chord [:a3, :c4, :e4], sustain: 2, amp: rrand(5, 8), attack: rrand(0.2, 0.5)
  sleep 2
  play_chord [:g3, :b3, :d4], sustain: 2, amp: rrand(5, 8), attack: rrand(0.2, 0.5)
  sleep 2
  play_chord [:f3, :a3, :c4], sustain: 2, amp: rrand(5, 8), attack: rrand(0.2, 0.5)
  sleep 2
  play_chord [:e3, :g3, :b3], sustain: 2, amp: rrand(5, 8), attack: rrand(0.2, 0.5)
  sleep 2
end

define :chord_progression_2 do
  use_synth :piano
  play_chord [:a3, :c4, :e4], sustain: 2, amp: rrand(5, 8), attack: rrand(0.2, 0.5)
  sleep 2
  play_chord [:f3, :a3, :c4], sustain: 2, amp: rrand(5, 8), attack: rrand(0.2, 0.5)
  sleep 2
  play_chord [:d3, :f3, :a3], sustain: 2, amp: rrand(5, 8), attack: rrand(0.2, 0.5)
  sleep 2
  play_chord [:e3, :g3, :b3], sustain: 2, amp: rrand(5, 8), attack: rrand(0.2, 0.5)
  sleep 2
end

# Chorus
define :catchy_chorus_melody do
  use_synth :piano
  play_pattern_timed [:c5, :e5, :g5, :a5, :g5, :e5, :c5, :d5,
  :e5, :g5, :a5, :c6, :b5, :a5, :g5, :e5],
    [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
     0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1.0],
    amp: rrand(3, 6), attack: rrand(0.1, 0.3)
end

define :catchy_chorus_chords do
  use_synth :piano
  play_chord [:c4, :e4, :g4], sustain: 1.5, amp: rrand(6, 10), attack: rrand(0.2, 0.5)
  sleep 1.5
  play_chord [:g3, :b3, :d4], sustain: 1.5, amp: rrand(6, 10), attack: rrand(0.2, 0.5)
  sleep 1.5
  play_chord [:a3, :c4, :e4], sustain: 1.5, amp: rrand(6, 10), attack: rrand(0.2, 0.5)
  sleep 1.5
  play_chord [:f3, :a3, :c4], sustain: 1.5, amp: rrand(6, 10), attack: rrand(0.2, 0.5)
  sleep 1.5
end

# Rhythm Line
define :dynamic_rhythm_line do
  use_synth :drum_heavy_kick
  16.times do
    sample :drum_bass_hard, amp: rrand(0.4, 0.8)
    sleep 0.5
  end
end

define :structured_bass_line do
  use_synth :dpulse
  bass_notes = [:a2, :a2, :g2, :g2, :f2, :f2, :e2, :e2]
  rhythm_pattern = [0.5, 0.5, 1, 1, 0.5, 0.5, 1, 1]
  4.times do |i|
    play bass_notes[i % bass_notes.size], amp: rrand(3, 6), release: rrand(0.4, 0.6)
    sleep rhythm_pattern[i % rhythm_pattern.size]
  end
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

live_loop :rhythm do
  dynamic_rhythm_line
end

live_loop :bass do
  structured_bass_line
end
