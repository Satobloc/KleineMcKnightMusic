use_bpm 120

# TOP NOTE
define :top_note do
  use_synth :piano
  play_pattern_timed [:c4, :d4, :f4, :g4, :e4, :d4, :c4, :f4],
    [0.6, 0.3, 0.3, 0.6, 0.6, 0.3, 0.6, 0.9],
    amp: 5, release: rrand(0.2,0.8)
end

# MID NOTE
define :mid_note do
  use_synth :piano
  play_pattern_timed [:g4, :a4, :d4, :e4, :g4, :f4, :g4, :d4],
    [0.6, 0.3, 0.3, 0.6, 0.6, 0.3, 0.6, 0.9],
    amp: 5, release: rrand(0.2,0.5)
end

# BOTTOM NOTE
define :bottom_note do
  use_synth :piano
  play_pattern_timed [:e4, :f4, :g4, :c4, :c4, :a4, :e4, :g4],
    [0.6, 0.3, 0.3, 0.6, 0.6, 0.3, 0.6, 0.9],
    amp: 5, release: rrand(0.1,0.8)
end

# BASS LINE
define :bass_line do
  use_synth :pluck
  play_pattern_timed [:e4, :e4, :g4, :g4, :g4, :e4, :e4, :g4],
    [0.6, 0.3, 0.3, 0.6, 0.6, 0.3, 0.6, 0.9],
    amp: 5, release: rrand(0.1,0.8)
end

# Live Loops
live_loop :topnote do
  top_note
  sleep 1 # Ensure melody duration matches beat
end

live_loop :midnote do
  mid_note
  sleep 1 # Ensure beat duration matches melody
end

live_loop :bottomnote do
  bottom_note
  sleep 1 # Ensure beat duration matches melody
end

live_loop :bassline do
  bass_line
  sleep 1 # Ensure beat duration matches melody
end
