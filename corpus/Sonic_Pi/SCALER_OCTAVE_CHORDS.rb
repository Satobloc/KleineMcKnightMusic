# Makes ascending chord arpeggios from starting tone and a range of chord types


############################################# CONFIGURATION
c = 0                                         # counter
s = 0.25                                      # step time
t = 60                                        # starting tone
p = [s, s+s, s+s+s, s+s+s+s]                  # pattern

############################################# CHOSES CHORD STRUCTURE
define :ch_struct do |base_note|
  patterns = [
    [base_note+0, base_note+4, base_note+7],               # Major chord
    [base_note+0, base_note+3, base_note+7],               # Minor chord
    [base_note+0, base_note+3, base_note+6],               # Diminished chord
    [base_note+0, base_note+4, base_note+8],               # Augmented chord
    [base_note+0, base_note+4, base_note+7, base_note+10], # Major 7th chord
    [base_note+0, base_note+3, base_note+7, base_note+10], # Minor 7th chord
    [base_note+0, base_note+4, base_note+7, base_note+11], # Dominant 7th chord
    [base_note+0, base_note+4, base_note+7, base_note+9],  # Major 6th chord
    [base_note+0, base_note+3, base_note+7, base_note+9],  # Minor 6th chord
  ]
  return patterns.choose
end

live_loop :scaler do
  h = ch_struct(t)         # Choose a chord pattern based on the current tone
  play_pattern_timed h, p  # Play the chosen chord pattern
  sleep 1                  # Update variables
  t = t + 1
  c = c + 1
end
