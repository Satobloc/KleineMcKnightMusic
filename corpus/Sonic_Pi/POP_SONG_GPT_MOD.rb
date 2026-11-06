# Pop Song in Sonic Pi

use_bpm 120

# Define the chords for verse and chorus
verse_chords = [:c4, :g4, :a4, :f4].shuffle
chorus_chords = [:f4, :g4, :c4, :a4].shuffle
outro_chords = [:a4, :g4, :f4, :e4]

# Define the melody for verse and chorus
verse_melody = [:e5, :d5, :c5, :b4, :c5, :d5, :e5, :g5].shuffle
chorus_melody = [:c5, :e5, :g5, :f5, :a5, :g5, :f5, :e5].shuffle
outro_melody = [:a5, :g5, :f5, :e5, :a5, :g5, :f5, :e5]

# Define drum patterns
define :drum_verse do
  sample :bd_haus, amp: 2
  sleep 0.5
  sample :sn_dub
  sleep 0.5
  sample :bd_haus, amp: 2
  sleep 0.25
  sample :sn_dub
  sleep 0.25
  sample :bd_haus, amp: 2
  sleep 0.5
end

define :drum_chorus do
  sample :bd_haus, amp: 2
  sleep 0.5
  sample :sn_dolf, amp: 1.5
  sleep 0.5
  sample :bd_haus, amp: 2
  sleep 0.5
  sample :sn_dolf, amp: 1.5
  sleep 0.5
end

define :drum_outro do
  sample :bd_haus, amp: 2
  sleep 1
  sample :sn_dolf, amp: 1.5
  sleep 1
end

# Define the verse section
define :verse do
  in_thread do
    use_synth :blade
    2.times do
      verse_chords.each do |chord|
        play chord
        sleep 1
      end
    end
  end
  in_thread do
    2.times do
      verse_melody.each do |note|
        play note
        sleep 0.5
      end
    end
  end
  8.times do
    drum_verse
  end
end

# Define the chorus section
define :chorus do
  in_thread do
    use_synth :blade
    2.times do
      chorus_chords.each do |chord|
        play chord
        sleep 1
      end
    end
  end
  in_thread do
    2.times do
      chorus_melody.each do |note|
        play note
        sleep 0.5
      end
    end
  end
  8.times do
    drum_chorus
  end
end

# Define the bridge section
define :bridge do
  in_thread do
    use_synth :blade
    4.times do
      play :e4
      sleep 1
      play :g4
      sleep 1
      play :f4
      sleep 1
      play :c4
      sleep 1
    end
  end
  16.times do
    sample :elec_hi_snare
    sleep 1
  end
end

define :outro do
  in_thread do
    use_synth :blade
    1.times do
      outro_chords.each do |chord|
        play chord
        sleep 1
      end
    end
  end
  in_thread do
    1.times do
      outro_melody.each do |note|
        play note
        sleep 0.5
      end
    end
  end
  6.times do
    drum_outro
  end
end

# Song structure
puts 'START VERSE1'
verse
puts 'END VERSE1'
puts 'START CHORUS1'
chorus
puts 'END CHORUS1'
puts 'START VERSE2'
verse
puts 'END VERSE2'
puts 'START CHORUS2'
chorus
puts 'END CHORUS2'
puts 'START BRIDGE'
bridge
puts 'END BRIDGE'
puts 'START CHORUS3'
chorus
puts 'END CHORUS3'
puts 'START OUTRO'
outro
puts 'END OUTRO'