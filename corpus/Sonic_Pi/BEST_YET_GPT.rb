# Define the drums loop with variations and effects
live_loop :drums do
  pattern = [:drum_bass_hard, :drum_snare_hard].ring
  pattern.each do |drum|
    sample drum, amp: rand + 0.5, rate: [1, 1.5, 2].choose
    sleep 0.5
  end
end

# Define the bass loop with variations and effects
live_loop :bass do
  notes = [:C2, :E2, :G2, :A2].ring
  with_fx :echo, phase: 0.5 do
    play_pattern notes, release: 1, amp: 0.8, cutoff: rrand(80, 120)
  end
  sleep 4
end

# Define the lead guitar loop with variations and effects
live_loop :lead_guitar do
  notes = [:C4, :E4, :G4, :A4].ring
  with_fx :distortion do
    with_fx :reverb, room: 0.5 do
      play_pattern notes, release: 0.5, amp: 0.5, cutoff: rrand(90, 110)
    end
  end
  sleep 4
end

# Define the backup guitar loop with variations and effects
live_loop :backup_guitar do
  chords = [chord(:C4, :minor), chord(:E4, :minor), chord(:G4, :major), chord(:A4, :minor)].ring
  with_fx :slicer, phase: 0.25 do
    with_fx :distortion, distort: 0.6 do
      chords.each do |chord|
        play_chord chord, release: 1, amp: 0.6, cutoff: rrand(80, 120)
        sleep 4
      end
    end
  end
end