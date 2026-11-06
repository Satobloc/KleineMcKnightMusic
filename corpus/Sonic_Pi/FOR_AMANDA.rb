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
  rhythm4 = [1, 0.25, 0.5]
  rhythm_array = [rhythm1, rhythm2, rhythm3, rhythm4].choose
  return rhythm_array
end

# ==================================

# MAIN ==================================
use_synth :pluck
counter = 0
live_loop :topnote do
  if counter < 2
    use_synth :pluck
    notes = generate_notes
    rhythms = generate_rhythms
    rhythms.each do |duration|
      amp = Math.sin((tick / 10.0) * Math::PI).abs
      pan = Math.sin((tick / 10.0) * Math::PI)
      play_pattern_timed notes, [duration], amp: amp, pan: pan
    end
    counter += 1
  else
    counter = 0
  end
  sleep 1
end
counter = 0
live_loop :midnote do
  if counter < 2
    use_synth :pluck
    notes = generate_notes
    rhythms = generate_rhythms
    rhythms.each do |duration|
      amp = Math.sin((tick / 10.0) * Math::PI).abs
      pan = Math.sin((tick / 10.0) * Math::PI)
      play_pattern_timed notes, [duration], amp: amp, pan: pan
    end
    counter += 1
  else
    counter = 0
  end
  sleep 1
end
counter = 0
live_loop :lownote do
  if counter < 2
    use_synth :pluck
    notes = generate_notes
    rhythms = generate_rhythms
    rhythms.each do |duration|
      amp = Math.sin((tick / 10.0) * Math::PI).abs
      pan = Math.sin((tick / 10.0) * Math::PI)
      play_pattern_timed notes, [duration], amp: amp, pan: pan
    end
    counter += 1
  else
    counter = 0
  end
  sleep 1
end
counter = 0
live_loop :tonic do
  if counter < 2
    use_synth :pluck
    notes = generate_notes
    rhythms = generate_rhythms
    rhythms.each do |duration|
      play_pattern_timed notes, [duration]
    end
    counter += 1
  else
    counter = 0
  end
  sleep 1
end
# ==================================






