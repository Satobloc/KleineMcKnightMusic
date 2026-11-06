define :melody do
  play_pattern_timed [60, 62, 64, 65], [0.5, 0.5, 0.5, 1]
  play_pattern_timed [67, 65, 64, 62], [0.5, 0.5, 0.5, 1]
end

define :harmony do
  play_chord [48, 52, 55], release: 4
  sleep 4
  play_chord [50, 53, 57], release: 4
  sleep 4
end

define :drum_beat do
  sample :drum_heavy_kick
  sleep 1
  sample :drum_snare_hard
  sleep 1
end

# Song Structure
in_thread do
  loop do
    drum_beat
  end
end

in_thread do
  loop do
    harmony
  end
end

in_thread do
  loop do
    melody
  end
end

sleep 4

2.times do
  melody
  sleep 4
end