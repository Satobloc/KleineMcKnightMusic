# Set the BPM and key
use_bpm 120
key = :C

# Define the chords for the song
define :chords do
  play chord(key, :major7)
  sleep 1
  play chord(key, :minor7)
  sleep 1
  play chord(key, :minor)
  sleep 1
  play chord(key, :major)
  sleep 1
end

# Define the melody
define :melody do
  play_pattern_timed [:C5, :E5, :G5, :A5, :G5, :F5, :D5], [0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.5]
end

# Play the song structure
in_thread do
  2.times do
    chords
    melody
    chords
    melody
  end
end
