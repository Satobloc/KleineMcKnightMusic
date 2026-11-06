live_loop :random_scales do
  # Shuffle the scale names to get a different order each time
  shuffled_scales = scale_names.shuffle
  
  # Print the shuffled scale names for reference
  puts "Shuffled Scales: #{shuffled_scales.inspect}"
  
  # Iterate over the shuffled scale names
  shuffled_scales.each do |scale_name|
    # Generate the scale using the current scale name
    selected_scale = scale(:c, scale_name)
    puts selected_scale
    # Print the generated scale for reference
    puts "Playing Scale: #{scale_name} - Notes: #{selected_scale.inspect}"
    
    # Play each note in the selected scale
    selected_scale.each do |note|
      play note, release: 0.5
      sleep 0.5
    end
  end
  
  # Sleep for a while before shuffling and playing the scales again
  sleep 2
end
