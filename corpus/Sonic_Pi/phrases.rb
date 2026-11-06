# Set the BPM
use_bpm 120

# Define a simple Motown-inspired theme
motown_theme = [:C4, :E4, :G4, :A4, :G4, :E4, :C4]

# Define a function for the fugue subject
define :fugue_subject do
  play_pattern_timed motown_theme, 0.25
end

# Play the subject (entry of the first voice)
fugue_subject

# Entry of the second voice (counterpoint)
in_thread do
  sleep 2
  fugue_subject
end

# Entry of the third voice (counterpoint)
in_thread do
  sleep 4
  fugue_subject
end

# Entry of the fourth voice (counterpoint)
in_thread do
  sleep 6
  fugue_subject
end

# Entry of the fifth voice (counterpoint)
in_thread do
  sleep 8
  fugue_subject
end

# You can continue to add more voices with increasing sleep values for each entry

# You can also develop the fugue further by adding variations and development sections
