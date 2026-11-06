# Set the BPM
use_bpm 120

# Define a Motown-inspired theme
motown_theme = [:C4, :E4, :G4, :A4, :G4, :E4, :C4]

# Define a function for the fugue subject
define :fugue_subject do
  play_pattern_timed motown_theme, 0.25
end

# Entry of the first voice (subject)
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

# Development section (variation)
in_thread do
  sleep 10
  play_pattern_timed motown_theme.shuffle, 0.25
end

# Entry of the sixth voice (counterpoint)
in_thread do
  sleep 12
  fugue_subject
end

# Entry of the seventh voice (counterpoint)
in_thread do
  sleep 14
  fugue_subject
end

# Development section (variation)
in_thread do
  sleep 16
  play_pattern_timed motown_theme.reverse, 0.25
end

# Entry of the eighth voice (counterpoint)
in_thread do
  sleep 18
  fugue_subject
end

# Entry of the ninth voice (counterpoint)
in_thread do
  sleep 20
  fugue_subject
end

# Entry of the tenth voice (counterpoint)
in_thread do
  sleep 22
  fugue_subject
end

# Entry of the eleventh voice (counterpoint)
in_thread do
  sleep 24
  fugue_subject
end

# Entry of the twelfth voice (counterpoint)
in_thread do
  sleep 26
  fugue_subject
end
