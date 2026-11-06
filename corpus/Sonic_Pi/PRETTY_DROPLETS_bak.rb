#PRETTY DROPLETS#

use_bpm 90

# Define a logistic map function
define :logistic_map do |x, r|
  return r * x * (1 - x)
end

live_loop :fractal_modulation do
  with_fx [:echo,:wobble,:flanger,:tremolo].choose, phase: rrand(1,6), phase_slide: rrand(1,9) do |e|
    # Define the scale and its length
    my_scale = scale([:b4,:fs4,:d4,:a4,:g4].choose, :major)
    scale_length = my_scale.length
    
    # Initialize logistic map parameters
    r = rrand(1,10)  # Control parameter for chaos
    x = 0.2  # Initial value between 0 and 1
    
    # Choose the note from the scale
    index = (x * scale_length).to_i
    
    note1 = my_scale[index]
    note2 = my_scale[index]+my_scale[index]-3
    note3 = my_scale[index]+my_scale[index]-4
    
    
    rrand(2,3).times do
      # Apply the logistic map
      x = logistic_map(x, r)
      
      # Map the logistic map output to an index in the scale
      
      # Ensure the index is within the valid range
      index = [[index, 0].max, scale_length - 1].min
      
      puts "X"
      puts x
      puts "R"
      puts r
      
      # Play the note
      synth :pluck, note: note1, sustain: r, release: r
      control e, phase: (r).abs
      synth :pluck, note: note2, sustain: r, release: r
      synth :pluck, note: note3, sustain: r, release: r
      sleep rrand(0.25,0.75)
      
    end
  end
end

