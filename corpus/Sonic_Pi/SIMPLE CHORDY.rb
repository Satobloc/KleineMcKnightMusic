use_bpm 120

# Simple Melody
define :simple_melody do
  use_synth :piano
  play_pattern_timed [:c4, :d4, :e4, :g4, :e4, :d4, :c4, :e4],
    [0.6, 0.3, 0.3, 0.6, 0.6, 0.3, 0.6, 0.9],
    amp: 3, release: 0.4
end

# Simple Beat
define :simple_beat do
  use_synth :blade
  play_pattern_timed [:g4, :d4, :c4, :e4, :g4, :d4, :g4, :e4],
    [0.6, 0.3, 0.3, 0.6, 0.6, 0.3, 0.6, 0.9],
    amp: 5, release: 0.4
end

# Live Loops
live_loop :melody do
  simple_melody
  sleep 1 # Ensure melody duration matches beat
end

live_loop :beat do
  simple_beat
  sleep 1 # Ensure beat duration matches melody
end
