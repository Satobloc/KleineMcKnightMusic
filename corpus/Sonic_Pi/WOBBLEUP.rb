#WOBBLEUP#

chordinput = :a
chordroot = chordinput[0]

live_loop :ranger do
  play_pattern_timed (range 60, 72, step: 0.5, inclusive: false), (0.25), amp: 5  #start, finish, step_size
  sleep 1
end

