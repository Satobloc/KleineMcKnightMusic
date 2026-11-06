# Set the BPM and key
use_bpm 120
key = :C

# Define the main melody
define :main_melody do
  play_pattern_timed [:C5, :E5, :F5, :E5, :C5, :D5, :C5], [0.5, 0.5, 0.25, 0.25, 0.5, 0.5, 0.5]
end

# Define the counterpoint melody
define :counterpoint_melody do
  in_thread do
    2.times do
      play_pattern_timed [:G4, :A4, :C5, :A4], [0.5, 0.5, 0.5, 0.5]
    end
  end
end

# Play the main melody
main_melody

# Play the counterpoint melody
counterpoint_melody

# Play the main melody again
main_melody

# Play the counterpoint melody again
counterpoint_melody
