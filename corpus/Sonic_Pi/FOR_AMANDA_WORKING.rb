# FOR AMANDA
# ==================================

define :generate_notes do
  phrase1 = [:F, :D, :A, :Bb]
  phrase2 = [:A, :F, :C, :D]
  phrase3 = [:C, :A, :F, :F]
  phrase4 = [:F, :C, :A, :Bb]
  phrase_array = [phrase1, phrase2, phrase3, phrase4].choose
  return phrase_array
end

define :generate_contrapoints do
  contra1 = [:C, :A, :G, :F]
  contra2 = [:E, :E, :A, :C]
  contra3 = [:G, :G, :C, :C]
  contra4 = [:C, :C, :E, :F]
  contra_array = [contra1, contra2, contra3, contra4].choose
  return contra_array
end

define :alternate_rhythms do
  a_rhythm1 = [0.75, 0.15, 1.0]
  a_rhythm2 = [0.15, 0.75, 0.5]
  a_rhythm3 = [0.25, 0.25, 0.5]
  a_rhythm4 = [1, 0.25, 0.5]
  a_rhythm_array = [a_rhythm1, a_rhythm2, a_rhythm3, a_rhythm4].choose
  return a_rhythm_array
end

define :generate_rhythms do
  rhythm1 = [0.5, 0.5, 1.0]
  rhythm2 = [0.25, 0.25, 0.5]
  rhythm3 = [0.25, 0.25, 0.5]
  rhythm4 = [1, 0.25, 0.5]
  rhythm_array = [rhythm1, rhythm2, rhythm3, rhythm4].choose
  return rhythm_array
end

# MAIN ==================================
use_synth :pluck

cycle = 0
loop do
  counter = 0
  live_loop :topnote do
    if counter < 2
      use_synth :piano
      notes = generate_notes
      rhythms = generate_rhythms
      rhythms.each do |duration|
        amp = Math.sin((tick / 10.0) * Math::PI).abs
        pan = Math.sin((tick / 10.0) * Math::PI)
        play_pattern_timed notes, [duration], amp: amp, pan: pan
        cycle += 1
        if cycle > 2
          cue :start_next
        end
        
      end
      counter += 1
    else
      counter = 0
    end
    sleep 1
  end
  sleep 1
  
  if cycle > 3
    counter = 0
    live_loop :midnote, sync: :start_next do
      if counter < 2
        use_synth :pluck
        notes = generate_notes
        rhythms = generate_rhythms
        rhythms.each do |duration|
          amp = Math.sin((tick / 10.0) * Math::PI).abs
          pan = Math.sin((tick / 5.0) * Math::PI)
          play_pattern_timed notes, [duration], amp: amp, pan: pan
        end
        counter += 1
      else
        counter = 0
      end
      sleep 1
    end
    if cycle > 6
      counter = 0
      live_loop :lownote, sync: :start_next do
        if counter < 2
          use_synth :pretty_bell
          notes = generate_notes
          rhythms = generate_rhythms
          rhythms.each do |duration|
            amp = Math.sin((tick / 10.0) * Math::PI).abs
            pan = Math.sin((tick / 2.0) * Math::PI)
            play_pattern_timed notes, [duration], amp: amp, pan: pan
          end
          counter += 1
        else
          counter = 0
        end
        sleep 1
      end
    end
    if cycle > 12
      counter = 0
      live_loop :tonic, cue: :start_next do
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
    end
  end
end
# ==================================






