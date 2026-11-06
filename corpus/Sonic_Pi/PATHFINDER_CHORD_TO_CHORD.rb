# Function to calculate the sum of absolute differences between two arrays
define :sum_of_absolute_differences do |arr1, arr2|
  arr1.zip(arr2).map { |a, b| (a - b).abs }.sum
end

# Function to generate all permutations of an array
define :permutations do |array|
  return [array] if array.length <= 1
  
  perms = []
  array.each_with_index do |element, index|
    rest = array[0...index] + array[(index + 1)..-1]
    permutations(rest).each do |perm|
      perms << [element] + perm
    end
  end
  perms
end

# Function to find the optimal permutation of target_chord
define :find_optimal_permutation do |start_chord, target_chord|
  sorted_start = start_chord.sort.reverse
  target_permutations = permutations(target_chord.sort.reverse)
  
  min_diff = Float::INFINITY
  best_permutation = target_chord
  
  target_permutations.each do |perm|
    diff = sum_of_absolute_differences(sorted_start, perm)
    if diff < min_diff
      min_diff = diff
      best_permutation = perm
    end
  end
  
  best_permutation
end

# Function to generate the path from start to target
define :generate_path do |start_chord, target_chord|
  # Sort start chord in descending order
  sorted_start = start_chord.sort.reverse
  # Find the optimal permutation of the target chord
  optimal_target = find_optimal_permutation(start_chord, target_chord)
  
  path = []
  step_count = 0  # Initialize step counter
  
  # Initialize current chord
  current_chord = sorted_start.dup
  path << current_chord.dup
  
  note_count = sorted_start.size
  note_index = 0
  
  while current_chord != optimal_target
    # Find the smallest difference for the current note index
    current_note = current_chord[note_index]
    target_note = optimal_target[note_index]
    
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
    if current_chord[note_index] == target_note
      note_index += 1 if note_index < note_count - 1
    end
  end
  
  [path, step_count]
end

# Define the starting and target chords
start_chord = [71, 52, 81]  # Example starting chord
target_chord = [72, 52, 81]  # Example target chord

# Generate the path and get the step count
path, step_count = generate_path(start_chord, target_chord)

# Print the path and step count for debugging purposes
puts "Path: #{path.inspect}"
puts "Total steps: #{step_count}"

# Play each chord in the path
path.each do |chord|
  play chord, release: 0.5
  sleep 0.5
end
