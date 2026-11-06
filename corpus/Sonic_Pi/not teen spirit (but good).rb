use_bpm 116

# Define the main riff
define :main_riff do
  with_fx :distortion, distort: 0.6 do
    4.times do
      play :E3
      sleep 0.5
      play :A3
      sleep 0.5
      play :G3
      sleep 0.5
      play :A3
      sleep 0.5
      play :E3
      sleep 0.5
      play :A2
      sleep 0.5
      play :G2
      sleep 0.5
      play :A2
      sleep 0.5
    end
  end
end

# Define the chorus
define :chorus do
  with_fx :distortion, distort: 0.6 do
    play :F3
    sleep 0.5
    play :A3
    sleep 0.5
    play :B3
    sleep 0.5
    play :Ab3
    sleep 0.5
  end
end

# Play the main riff
main_riff

# Play the chorus
chorus

# Play the main riff again
main_riff

# Play the chorus again
chorus

# Bridge
with_fx :distortion, distort: 0.6 do
  play :G3
  sleep 0.5
  play :A3
  sleep 0.5
  play :F3
  sleep 0.5
  play :B3
  sleep 0.5
end

# Play the main riff one last time
main_riff

# Play the chorus as an outro
chorus
