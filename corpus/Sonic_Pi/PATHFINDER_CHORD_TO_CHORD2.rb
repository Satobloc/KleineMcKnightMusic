#SABLE
# Function to generate the path from start to target
define :generate_path do |start_chord, target_chord|
  # Sort both chords in descending order
  sorted_start = start_chord.sort.reverse
  sorted_target = target_chord.sort.reverse
  
  path = []
  step_count = 0  # Initialize step counter
  
  # Initialize current chord
  current_chord = sorted_start.dup
  path << current_chord.dup
  
  note_count = sorted_start.size
  note_index = 0
  
  while current_chord != sorted_target
    # Find the smallest difference for the current note index
    current_note = current_chord[note_index]
    target_note = sorted_target[note_index]
    
    # Adjust the current note towards the target note
    if current_note < target_note
      current_chord[note_index] += 1
    elsif current_note > target_note
      current_chord[note_index] -= 1
    end
    
    # Increment the step counter
    step_count += 1
    
    # Add the updated chord to the path if it has changed
    path << current_chord.dup if path.last != current_chord
    
    # Move to the next note if the current note has reached its target
    if current_chord[note_index] == sorted_target[note_index]
      note_index += 1 if note_index < note_count - 1
    end
  end
  
  [path, step_count]
end

# Define the starting and target chords
start_chord = [72, 50, 81]  # Example starting chord
target_chord = [22, 53,81]  # Example target chord

# Generate the path and get the step count
path, step_count = generate_path(start_chord, target_chord)

# Print the path and step count for debugging purposes
puts "Path: #{path.inspect}"
puts "Total steps: #{step_count-1}"

# Play each chord in the path
path.each do |chord|
  play chord, release: 0.5
  sleep 0.5
end
