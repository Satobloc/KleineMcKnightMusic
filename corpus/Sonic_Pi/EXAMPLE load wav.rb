solenoids = "/Users/Admin/Music/"
use_bpm 40

live_loop :solenoid1 do
  sample solenoids, "NAUGHTY CIRCUS COLLAPSE", beat_stretch: 80, onset: [1,2,3,4,5,6,7,8,9].choose
  sleep 0.125
end