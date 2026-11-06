live_loop :quest do
  use_synth :piano
  notes = [:a4, :c4, :d4, :g4, :C4, :a4, :e4]
  durations = [0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 1]
  play_pattern_timed notes, durations
end

live_loop :answ do
  use_synth :piano
  notes = [:d4, :g4, :d4, :e4, :g4, :d4, :c4]
  durations = [0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 1]
  play_pattern_timed notes, durations
end