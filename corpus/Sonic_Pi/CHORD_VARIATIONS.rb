# ==================================

define :generate_notes do
  phrase1 = [:F, :D, :A, :Bb]
  phrase2 = [:A, :F, :C, :D]
  phrase3 = [:C, :A, :F, :F]
  phrase4 = [:F, :C, :A, :Bb]
  phrase_array = [phrase1, phrase2, phrase3, phrase4].choose
  return phrase_array
end

define :generate_rhythms do
  rhythm1 = [0.5, 0.5, 1.0]
  rhythm2 = [0.25, 0.25, 0.5]
  rhythm3 = [0.25, 0.25, 0.5]
  rhythm_array = [phrase1, phrase2, phrase3, phrase4].choose
  return rhythm_array
end

# ==================================

use_pattern :generate_rhytms
use_synth :pluck

live_loop :topnote do
  notes = generate_notes
  notes.each do |note|
    play note
    sleep 0.5
  end
end

live_loop :midnote do
  notes = generate_notes
  notes.each do |note|
    play note
    sleep 0.5
  end
end

live_loop :lownote do
  notes = generate_notes
  notes.each do |note|
    play note
    sleep 0.5
  end
end

live_loop :tonic do
  notes = generate_notes
  notes.each do |note|
    play note
    sleep 0.5
  end
end

# ==================================






