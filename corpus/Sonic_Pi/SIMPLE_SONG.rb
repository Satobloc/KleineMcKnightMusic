use_bpm 120

# Simple Melody
define :simple_melody do
  use_synth :piano
  2.times do
    play_pattern_timed [:c4, :d4, :e4, :g4, :e4, :d4, :c4, :e4],
      [0.6, 0.3, 0.3, 0.6, 0.6, 0.3, 0.6, 0.9],
      amp: 3, release: 0.4
  end
end

# Simple Beat
define :simple_beat do
  2.times do
    sample :drum_bass_hard, amp: 1.0
    sleep 0.6
    sample :drum_snare_hard, amp: 0.6
    sleep 0.3
    sample :drum_bass_hard, amp: 1.0
    sleep 0.3
    sample :drum_snare_hard, amp: 0.9
    sleep 0.6
    sample :drum_bass_hard, amp: 0.6
    sleep 0.6
    sample :drum_snare_hard, amp: 0.5
    sleep 0.3
    sample :drum_snare_hard, amp: 0.5
    sleep 0.3
    sample :drum_bass_hard, amp: 0.5
    sleep 0.6
    sample :drum_cymbal_pedal, amp: 1.5
    sleep 0.9
  end
end

# Live Loops
live_loop :melody do
  simple_melody
  sleep 1 # Ensure melody duration matches beat
end

live_loop :beat do
  sync :melody
  simple_beat
  sleep 1 # Ensure beat duration matches melody
end
