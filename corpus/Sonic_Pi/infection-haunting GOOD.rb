use_bpm 116

# Define the main riff with Pachelbel's Canon elements
define :main_riff do
  with_fx :distortion, distort: 0.6 do
    4.times do
      play_pattern_timed([:E3, :G3, :A3, :F3], [0.5, 0.5, 0.5, 0.5])
      play_pattern_timed([:B3, :A3, :G3, :F3], [0.5, 0.5, 0.5, 0.5])
    end
  end
end

# Define the Albanian gypsy-inspired section
define :gypsy_section do
  with_fx :reverb, room: 0.8 do
    use_synth :pluck
    play_pattern_timed([:D4, :C4, :B3, :A3], [0.5, 0.5, 0.5, 0.5])
    sleep 0.5
    play_pattern_timed([:A3, :G3, :F3, :E3], [0.5, 0.5, 0.5, 0.5])
  end
end

# Define the haunting bridge
define :haunting_bridge do
  use_synth :dark_ambience
  play_pattern_timed([:F3, :A2, :B2, :F2], [0.7, 0.7, 0.7, 0.7])
end

# Define the infectious hook
define :infectious_hook do
  use_synth :saw
  with_fx :distortion, distort: 0.5 do
    play_pattern_timed([:E4, :F4, :G4, :F4], [0.3, 0.3, 0.3, 0.3])
  end
end

# Play the transformed composition
in_thread do
  # Intro (Pachelbel's Canon)
  main_riff
  
  # Verse 1 (Gypsy-inspired)
  gypsy_section
  
  # Chorus (Infectious hook)
  infectious_hook
  
  # Verse 2 (Gypsy-inspired)
  gypsy_section
  
  # Chorus (Infectious hook)
  infectious_hook
  
  # Bridge (Haunting)
  haunting_bridge
  
  # Outro (Pachelbel's Canon)
  main_riff
end
