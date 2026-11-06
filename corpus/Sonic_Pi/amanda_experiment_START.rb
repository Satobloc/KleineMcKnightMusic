# FOR AMANDA
# ==================================

define :generate_notes do
  phrase1 = [:F, :D, :Bb, :A]
  phrase2 = [:F, :D, :C, :A]
  phrase3 = [:F, :F, :C, :A]
  phrase4 = [:F, :C, :Bb, :A]
  phrase_array = [phrase1, phrase2, phrase3, phrase4].choose
  return phrase_array
end

define :generate_contrapoints do
  contra1 = [:A3, :Bb3, :F5, :G6, :A3, :Bb, :Ds, :F8]
  contra2 = [:A3, :C3, :Eb7, :E6, :A3, :C, :Ds8, :F]
  contra3 = [:Cs3, :Cs3, :G5, :G7, :A3, :Cs7, :F8, :F]
  contra4 = [:C3, :Cs3, :E5, :F7, :A3, :Bb7, :Cs5, :F]
  contra_array = [contra1, contra2, contra3, contra4].choose
  return contra_array
end

define :alternate_rhythms do
  a_rhythm1 = [0.25, 0.25, 0.25]
  a_rhythm2 = [0.125, 0.125, 1]
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
        amp = Math.sin((tick / 500.0) * Math::PI).abs
        pan = Math.sin((tick / 500.0) * Math::PI)
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
        use_synth :piano
        notes = generate_notes
        rhythms = generate_rhythms
        rhythms.each do |duration|
          amp = Math.sin((tick / 50.0) * Math::PI).abs
          pan = Math.sin((tick / 1.0) * Math::PI)
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
      live_loop :lownote, sync: :start_contra do
        if counter < 2
          unphase = Math.sin((tick / 2.0) * Math::PI)
          sleep 0.5*unphase
          use_synth :pluck
          notes = generate_contrapoints
          rhythms = alternate_rhythms
          rhythms.each do |duration|
            amp = Math.sin((tick / 1.0) * Math::PI).abs
            pan = Math.sin((tick / 1.0) * Math::PI)
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
          use_synth :piano
          notes = generate_notes
          rhythms = generate_rhythms
          rhythms.each do |duration|
            amp = Math.sin((tick / 500.0) * Math::PI).abs
            pan = Math.sin((tick / 2.0) * Math::PI)
            play_pattern_timed notes, [duration], pan: pan, amp: amp
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






