# FOR AMANDA
# ==================================

define :yololo do
  # Get the current time as a Time object
  current_time_obj = current_time
  # Format the time object as a string without dashes, spaces, or colons
  doodad = current_time_obj.strftime("%Y%m%d%H%M%S")
  # Convert the cleaned date string to an integer
  d = doodad.to_i
  d = d*Math.sin((tick * Math.sin(d)) * Math::PI).abs
  return d
end

use_random_seed yololo

define :generate_contrapoints do
  phrase1 = [:C, :A, :F, :G]
  phrase2 = [:E, :C, :G, :B]
  phrase3 = [:G, :E, :A, :D]
  phrase4 = [:E3, :C3, :G3, :F3]
  phrase_array = [phrase1, phrase2, phrase3, phrase4].choose
  return phrase_array
end

define :generate_notes do
  contra1 = [:C, :E, :G, :E, :A, :C, :E, :C]
  contra2 = [:F, :A, :C, :G, :B, :D, :G]
  contra3 = [:A, :D, :A, :G, :B, :F, :B, :A]
  contra4 = [:D, :C, :E, :G, :E, :F, :D]
  contra_array = [contra1, contra2, contra3, contra4].choose
  return contra_array
end

define :generate_notes2 do
  contra1 = [:D, :F, :A, :G, :D, :E, :A, :F, :B, :D, :E, :G, :A, :G, :D, :B]
  contra2 = [:G, :D, :A, :G, :F, :A, :B, :G, :E, :G, :B, :D, :G, :A, :B]
  contra3 = [:A, :D, :A, :G, :B, :F, :B, :A, :B, :F, :D, :G, :A]
  contra4 = [:D, :C, :E, :G, :E, :F, :D, :C, :G, :C, :B, :C, :D, :G, :B]
  contra_array = [contra1, contra2, contra3, contra4].choose
  return contra_array
end

define :alternate_rhythms do
  a_rhythm1 = [0.5, 0.5, 0.5]
  a_rhythm2 = [0.5, 0.25, 0.5]
  a_rhythm3 = [0.25, 0.25, 0.5]
  a_rhythm4 = [0.5, 0.5, 0.25]
  a_rhythm_array = [a_rhythm1, a_rhythm2, a_rhythm3, a_rhythm4].choose
  return a_rhythm_array
end

define :generate_rhythms do
  rhythm1 = [0.5, 0.5, 1]
  rhythm2 = [0.5, 1, 0.5]
  rhythm3 = [1, 0.5, 0.5]
  rhythm4 = [0.5, 1, 1]
  rhythm_array = [rhythm1, rhythm2, rhythm3, rhythm4].choose
  return rhythm_array
end

# MAIN ==================================

use_synth :piano


counter = 0
cycle = 0
if cycle < 20
  10.times do
    loop do
      live_loop :drone do
        sample :bass_thick_c, amp: 0.08, sustain: 10, sustain_level: 0.8, release: 1
        play_pattern_timed [:F, :A, :G, :B, :D], [1, 1, 1, 2, 1]
      end
      live_loop :topnote do
        if counter > 5
          use_synth :organ_tonewheel
          notes = generate_notes
          rhythms = alternate_rhythms
          rhythms.each do |duration|
            sleep 0.25
            amp = (0.3-Math.sin((tick / 90.0) * Math::PI)).abs
            pan = Math.sin((tick / 10.0) * Math::PI)
            play_pattern_timed notes, [duration], amp: amp, pan: pan
            cycle += 1
            if cycle > 2
              cue :start_next
            end
            
          end
          counter += 1
        else
          counter += 1
        end
        sleep 1
      end
      sleep 1
      
      if cycle > 0
        counter > 2
        live_loop :midnote, sync: :start_next do
          if counter > 2
            use_synth :pulse
            notes = generate_notes
            rhythms = generate_rhythms
            rhythms.each do |duration|
              amp = 0.1
              pan = Math.sin((tick / 5.0) * Math::PI)
              play_pattern_timed notes, [duration], amp: amp, pan: pan
            end
            counter += 1
          else
            counter += 1
          end
          sleep 2
        end
        if cycle > 6
          live_loop :lownote, sync: :start_next do
            if counter < 6
              use_synth :pluck
              notes = generate_notes2
              rhythms = alternate_rhythms
              rhythms.each do |duration|
                sleep [0.0125, 0.25].choose
                amp = Math.sin((tick / 10.0) * Math::PI).abs
                pan = Math.sin((tick / 2.0) * Math::PI)
                play_pattern_timed notes, [duration], amp: 0.05, pan: pan
              end
              counter += 1
            else
              counter += 1
            end
            sleep 1
          end
        end
        if cycle > 12
          live_loop :tonic, cue: :start_next do
            if counter > 10
              use_synth :beep
              notes = generate_notes
              rhythms = generate_rhythms
              rhythms.each do |duration|
                play_pattern_timed notes, [duration], amp: 0.3
              end
              counter += 1
            else
              counter += 1
            end
            sleep 2
          end
        end
      end
    end
  end
end



# ==================================






