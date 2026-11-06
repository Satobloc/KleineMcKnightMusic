solenoids = "/Users/Admin/Music/SAMPLES/"
use_bpm 60

live_loop :solenoid3 do
  sample solenoids, "the-horn-of-cenarius", amp: 10
  sleep 300
end

live_loop :solenoid4 do
  sleep 10
  sample solenoids, "moog", amp: 10
  sleep 300
end

