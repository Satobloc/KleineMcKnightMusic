# Define a function to play a chord progression
define :play_chord_progression do |chords, samples, duration|
  chords.each do |chord|
    (range -2, 2).each do |i|
      sample samples[0], amp: 2  # Adjust the amp value as needed
      play_chord (chord_degree chord[0], :c, chord[1], 3, invert: i)
      sleep duration
    end
  end
end

# Opener Section
opener_chords = [[1, :minor], [4, :major], [5, :major], [1, :minor]]
opener_samples = [:piano, :ambi_piano, :bd_pure, :bass_woodsy_c]
play_chord_progression(opener_chords, opener_samples, 1)

# Transition Section
transition_chords = [[2, :minor], [5, :major], [1, :minor], [4, :major]]
transition_samples = [:pluck, :ambi_glass_hum, :bd_pure, :drum_heavy_kick]  # Adjusted samples
play_chord_progression(transition_chords, transition_samples, 0.5)

# FIRST SECTION
counter = 0
loop do
  counter1 = 0
  loop do
    [2, 1, 3, 4].each do |d|
      (range -2, 2).each do |i|
        sample :bd_pure, amp: 0.5  # Adjusted percussion volume
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
        sample :ambi_piano
        play_chord (chord_degree d, :b, :major, 3, invert: i)
        sleep 0.25
      end
    end
    counter2 += 1
    break if counter2 >= 1  # Exit inner loop after 1 iteration
  end
  counter += 1
  break if counter >= 4  # Exit outer loop after 4 iterations
end
# END FIRST SECTION

# SECOND SECTION
counter = 0
loop do
  counter1 = 0
  loop do
    [3, 2, 3, 4].each do |d|
      (range -3, 3).each do |i|
        sample :ambi_piano
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
        sample :drum_heavy_kick, amp: 0.3  # Adjusted percussion volume
        play_chord (chord_degree d, :f, :major, 3, invert: i)
        sleep 0.25
      end
    end
    counter2 += 1
    break if counter2 >= 1  # Exit inner loop after 1 iteration
  end
  counter += 1
  break if counter >= 4  # Exit outer loop after 4 iterations
end
# END SECOND SECTION

# Closer Section
closer_chords = [[6, :minor], [3, :major], [4, :major], [5, :major]]
closer_samples = [:piano, :ambi_piano, :bd_pure, :bass_woodsy_c]
play_chord_progression(closer_chords, closer_samples, 1)
