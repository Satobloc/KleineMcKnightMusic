# Define a function for the drum fill
define :drum_fill do
  sample :drum_snare_soft  # Play a soft snare hit
  sleep [0.25, 0.5].choose
  sample :drum_tom_lo_soft  # Play a soft low tom hit
  sleep 0.25
  sample :drum_tom_mid_soft  # Play a soft mid tom hit
  sleep 0.25
  sample :drum_tom_hi_soft  # Play a soft high tom hit
  sleep 0.25
end

drum_fill

counter1 = 0
loop do
  # Define the function before calling it
  define :play_chord_progression do |chords, samples|
    chords.each_with_index do |chord, index|
      (range -2, 2).each do |i|
        sample samples[index]
        play_chord (chord_degree chord[0], :c, chord[1], 3, invert: i)
        sleep 1
      end
    end
  end
  
  # Opener Section
  opener_chords = [[1, :minor], [4, :major], [5, :major], [1, :minor]]
  opener_samples = [:piano, :piano, :drum_splash_hard, :bass_trance_c]
  play_chord_progression(opener_chords, opener_samples)
  
  counter1 += 1
  break if counter1 >= 2  # Exit inner loop after 2 iterations
end

# Transition Section

# Define a function to play a transition pattern
define :play_transition do |pattern, samples|
  pattern.each_with_index do |chord, index|
    (range -2, 2).each do |i|
      sample samples[index]
      play_chord (chord_degree chord[0], :c, chord[1], 3, invert: i)
      sleep 0.5
    end
  end
end

# Define transition chord progressions and samples
transition_chords = [[1, :minor], [4, :major], [5, :major], [1, :minor]]
transition_samples = [:piano, :piano, :drum_splash_hard, :bass_trance_c]

# Play the transition chord progression
play_transition(transition_chords, transition_samples)


#FIRST SECTION
counter = 0
loop do
  counter1 = 0
  loop do
    [2, 1, 3, 4].each do |d|
      (range -2, 2).each do |i|
        sample :drum_soft_buzz
        play_chord (chord_degree d, :g, :major, 3, invert: i)
        sleep 0.25
      end
    end
    counter1 += 1
    break if counter1 >= 2  # Exit inner loop after 3 iterations
  end
  counter2 = 0
  loop do
    [1, 2, 2, 1].each do |d|
      (range -2, 2).each do |i|
        drum_fill
        play_chord (chord_degree d, :b, :major, 3, invert: i)
        sleep 0.25
      end
    end
    counter2 += 1
    break if counter2 >= 1  # Exit inner loop after 1 iterations
  end
  counter += 1
  break if counter >= 4  # Exit outer loop after 4 iterations
end
#END FIRST SECTION

#SECOND SECTION
counter = 0
loop do
  counter1 = 0
  loop do
    [3, 2, 3, 4].each do |d|
      (range -3, 3).each do |i|
        drum_fill
        play_chord (chord_degree d, :d, :major, 3, invert: i)
        sleep 0.25
      end
    end
    counter1 += 1
    break if counter1 >= 2  # Exit inner loop after 3 iterations
  end
  counter2 = 0
  loop do
    [2, 4, 2, 3].each do |d|
      (range -3, 3).each do |i|
        sample :drum_soft_kick
        play_chord (chord_degree d, :f, :major, 3, invert: i)
        sleep 0.25
      end
    end
    counter2 += 1
    break if counter2 >= 1  # Exit inner loop after 1 iterations
  end
  counter += 1
  break if counter >= 4  # Exit outer loop after 4 iterations
end
#END SECOND SECTION
