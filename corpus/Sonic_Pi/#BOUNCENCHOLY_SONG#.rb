#BOUNCENCHOLY_SONG#

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

# Bass Line
define :fast_bass_line_verse do
  use_synth :dpulse
  bass_notes = [:a2, :g2, :f2, :e2, :a2, :g2, :f2, :e2,:a2, :g2, :f2, :e2, :a2, :g2, :f2, :e2]
  rhythm_pattern = [0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
                    0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
                    0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
                    0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5]
  8.times do |i|
    play bass_notes[i % bass_notes.size], amp: rrand(3, 6), release: rrand(0.3, 0.5)
    sleep rhythm_pattern[i % rhythm_pattern.size]
  end
end

define :fast_bass_line_chorus do
  use_synth :dpulse
  bass_notes = [:a2, :c3, :e3, :g3, :a2, :c3, :e3, :g3,:a2,:c3, :e3, :g3, :a2, :c3, :e3, :g3]
  rhythm_pattern = [0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
                    0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
                    0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
                    0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5]
  8.times do |i|
    play bass_notes[i % bass_notes.size], amp: rrand(4, 7), release: rrand(0.3, 0.5)
    sleep rhythm_pattern[i % rhythm_pattern.size]
  end
end

# Rhythm Line
define :fast_rhythm_line_verse do
  use_synth :dull_bell
  16.times do
    sample :bass_thick_c, amp: rrand(0.6, 1.0)
    sleep 0.25
  end
end

define :fast_rhythm_line_chorus do
  use_synth :dull_bell
  16.times do
    sample :bass_thick_c, amp: rrand(0.6, 1.0)
    sleep 0.25
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
  sync :verse
  fast_rhythm_line_verse
  sleep 8 # Ensures rhythm line plays throughout the verse
end

live_loop :bass do
  sync :verse
  fast_bass_line_verse
  sleep 8 # Ensures bass line plays throughout the verse
end

live_loop :chorus_rhythm do
  sync :chorus
  fast_rhythm_line_chorus
  sleep 8 # Ensures rhythm line plays throughout the chorus
end

live_loop :chorus_bass do
  sync :chorus
  fast_bass_line_chorus
  sleep 8 # Ensures bass line plays throughout the chorus
end
