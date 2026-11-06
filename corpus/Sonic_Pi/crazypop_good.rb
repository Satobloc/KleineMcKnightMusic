# Set the tempo for a punk-influenced feel
use_bpm 160

# Define bluegrass and Motown sections
define :bluegrass_section do
  play_pattern_timed([:G4, :D4, :A3, :B3, :D4], [0.3, 0.3, 0.3, 0.3, 0.3])
end

define :motown_section do
  play_pattern_timed([:C4, :E4, :G4, :A4], [0.3, 0.3, 0.3, 0.3])
end

# Define a fugue-like structure with intricate counterpoint
define :fugue_counterpoint do
  in_thread do
    4.times do
      play [:G3, :B3, :D4, :E4].choose, release: 0.2
      sleep 0.2
    end
  end
  
  in_thread do
    4.times do
      play [:A3, :C4, :E4, :G4].choose, release: 0.2
      sleep 0.2
    end
  end
end

# Main composition
in_thread do
  # Intro
  2.times do
    bluegrass_section
    motown_section
  end
  
  # Verse 1
  bluegrass_section
  fugue_counterpoint
  motown_section
  
  # Chorus
  motown_section
  fugue_counterpoint
  
  # Verse 2
  bluegrass_section
  fugue_counterpoint
  motown_section
  
  # Chorus
  motown_section
  fugue_counterpoint
end
