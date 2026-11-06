use_bpm 120

define :bouncy_melody do
  play_pattern_timed [:a4, :b4, :c5, :e5, :d5, :c5, :b4, :a4,
                      :a4, :c5, :e5, :g5, :e5, :c5, :b4, :a4,
                      :e4, :g4, :a4, :b4, :c5, :b4, :a4, :g4,
  :e4, :a4, :c5, :e5, :d5, :c5, :b4, :a4],
    [0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
     0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
     0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5,
     0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5]
    end

live_loop :bouncy_happy do
  bouncy_melody
  sleep 8 # To ensure the loop matches the length of the melody
end
