use_bpm 120

define :bouncy_melody do
  play_pattern_timed [:a4, :b4, :c5, :e5], [0.5, 0.5, 0.5, 0.5]
  play_pattern_timed [:d5, :c5, :b4, :a4], [0.5, 0.5, 0.5, 0.5]
  play_pattern_timed [:a4, :c5, :e5, :g5], [0.5, 0.5, 0.5, 0.5]
  play_pattern_timed [:e5, :c5, :b4, :a4], [0.5, 0.5, 0.5, 0.5]
  play_pattern_timed [:e4, :g4, :a4, :b4], [0.5, 0.5, 0.5, 0.5]
  play_pattern_timed [:c5, :b4, :a4, :g4], [0.5, 0.5, 0.5, 0.5]
  play_pattern_timed [:e4, :a4, :c5, :e5], [0.5, 0.5, 0.5, 0.5]
  play_pattern_timed [:d5, :c5, :b4, :a4], [0.5, 0.5, 0.5, 0.5]
end

live_loop :bouncy_happy do
  bouncy_melody
  sleep 8 # To ensure the loop matches the length of the melody
end
