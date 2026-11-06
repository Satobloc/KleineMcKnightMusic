# Set the BPM
use_bpm 120

# Define an unusual scale
unusual_scale = [:C4, :D4, :E4, :G4, :A4, :B4]

# Define a function for a melody using the unusual scale
define :melody do
  4.times do
    play_pattern_timed unusual_scale, 0.25
  end
end

# Define a function for an innovative bridge
define :innovative_bridge do
  with_fx :echo, phase: 0.25 do
    melody
  end
end

# Opening
melody

# Chorus 1
melody

# Verse 1
melody

# Chorus 2
melody

# Innovative Bridge
innovative_bridge

# Crescendo
with_fx :distortion, distort: 0.5 do
  melody
end

# Melancholy Outro
with_fx :reverb, room: 1, mix: 0.7 do
  melody
end
