live_loop :random_scale do
  # Choose a random scale name
  selected_scale_name = scale_names.choose
  
  # Print the selected scale name for reference
  puts "Selected Scale: #{selected_scale_name}"
  
  # Generate a random scale using the selected scale name
  selected_scale = scale(:c, selected_scale_name)
  
  # Print the generated scale for reference
  puts "Selected Scale Notes: #{selected_scale.inspect}"
  
  # Play a random note from the selected scale
  play selected_scale.choose, release: 0.5
  
  # Wait for 0.5 seconds before the next iteration
  sleep 0.5
end
