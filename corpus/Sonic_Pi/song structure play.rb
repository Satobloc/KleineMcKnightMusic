#FIRST SECTION
counter = 0
loop do
  counter1 = 0
  loop do
    [2, 1, 3, 4].each do |d|
      (range -2, 2).each do |i|
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
        play_chord (chord_degree d, :d, :minor, 3, invert: i)
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
        play_chord (chord_degree d, :f, :minor, 3, invert: i)
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