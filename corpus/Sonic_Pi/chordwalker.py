#                       CHORDWALKER
#========================================================
# DASHBOARD - User Input Section
#========================================================
set_volume! 5
use_synth :piano
# Examples of valid input: :Dm7, :C, [:C4, :E4, :G4], [:D5, :62, :A4]
# You can also mix named chord and note arrays

start_chord_input =  [69, 72, 62, 70]
target_chord_input = [53, :A4, 72]

#========================================================
# INSTRUCTIONS
# Enter your start and target chords here.
# You can use:
#   1) Named chord symbols (:C, :Dm7, :Fs7, :Cm11, etc.)
#   2) Arrays of MIDI notes ([60, 64, 67], [:C4, :E4, :G4])
#   3) A mix of the two
#
# EXAMPLE INPUT
#   start_chord_input = :F7
#   target_chord_input = [:G4, :B4, :D5]
# EXAMPLE INSTRUMENTS
#  sample :ambi_choir
#  use_synth :piano
#========================================================

#========================================================
# HELPER: Convert named chord symbols to MIDI note arrays
#========================================================

define :named_chord_to_notes do |name|
  chord_map = {
    :C => chord(:C4, :major).to_a,
    :Cm => chord(:C4, :minor).to_a,
    :C7 => chord(:C4, :dom7).to_a,
    :Cm7 => chord(:C4, :m7).to_a,
    :D => chord(:D4, :major).to_a,
    :Dm => chord(:D4, :minor).to_a,
    :D7 => chord(:D4, :dom7).to_a,
    :Dm7 => chord(:D4, :m7).to_a,
    :E => chord(:E4, :major).to_a,
    :Em => chord(:E4, :minor).to_a,
    :E7 => chord(:E4, :dom7).to_a,
    :Em7 => chord(:E4, :m7).to_a,
    :F => chord(:F4, :major).to_a,
    :Fm => chord(:F4, :minor).to_a,
    :F7 => chord(:F4, :dom7).to_a,
    :G => chord(:G4, :major).to_a,
    :Gm => chord(:G4, :minor).to_a,
    :G7 => chord(:G4, :dom7).to_a,
    :A => chord(:A4, :major).to_a,
    :Am => chord(:A4, :minor).to_a,
    :A7 => chord(:A4, :dom7).to_a,
    :B => chord(:B4, :major).to_a,
    :Bm => chord(:B4, :minor).to_a,
    :B7 => chord(:B4, :dom7).to_a
  }
  chord_map[name]
end

#========================================================
# HELPER: Convert any chord input to a mutable array of MIDI notes
#========================================================
define :resolve_chord do |ch|
  case ch
  when Symbol
    notes = named_chord_to_notes(ch)
    raise "Invalid chord symbol: #{ch}" if notes.nil?
    return notes.dup
  when Array
    return ch.map do |n|
      n.is_a?(Symbol) ? note(n) : n
    end
  else
    raise "Invalid chord input: #{ch.inspect}"
  end
end

#========================================================
# CORE: Generate the shortest stepwise path between two chords
#========================================================
define :generate_path do |start_chord, target_chord|
  current_chord = resolve_chord(start_chord)
  target_chord  = resolve_chord(target_chord)
  
  # Normalize lengths by repeating highest note
  max_len = [current_chord.size, target_chord.size].max
  current_chord += [current_chord[0]] * (max_len - current_chord.size)
  target_chord  += [target_chord[0]] * (max_len - target_chord.size)
  
  # Sort descending for consistent stepping
  current_chord.sort!.reverse!
  target_chord.sort!.reverse!
  
  path = [current_chord.dup]
  step_count = 0
  note_index = 0
  
  while current_chord != target_chord
    if current_chord[note_index] < target_chord[note_index]
      current_chord[note_index] += 1
    elsif current_chord[note_index] > target_chord[note_index]
      current_chord[note_index] -= 1
    end
    
    step_count += 1
    path << current_chord.dup if path.last != current_chord
    
    note_index += 1 if current_chord[note_index] == target_chord[note_index] && note_index < current_chord.size - 1
  end
  
  [path, step_count]
end

#========================================================
# RUN THE CHORD WALKER
#========================================================
path, total_steps = generate_path(start_chord_input, target_chord_input)

puts "Chord path (total steps: #{total_steps}):"
path.each_with_index do |c, i|
  puts "Step #{i}: Notes #{c.inspect}"
end

# Optional: play the path
path.each do |c|
  play c, release: 0.5
  sleep 0.5
end

#========================================================
# END CODEWALKER
#========================================================
