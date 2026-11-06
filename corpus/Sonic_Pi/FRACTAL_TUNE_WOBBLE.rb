use_bpm 120

# Define a logistic map function
define :logistic_map do |x, r|
  return r * x * (1 - x)
end

live_loop :fractal_modulation do
  with_fx [:echo,:wobble,:flanger,:tremolo].choose, phase: rrand(0,6), phase_slide: rrand(0,9) do |e|
    # Define the scale and its length
    my_scale = scale([:a4,:f4].choose, [:major,:phrygian].choose)
    scale_length = my_scale.length
    
    # Initialize logistic map parameters
    r = 8.7  # Control parameter for chaos
    x = 0.35  # Initial value between 0 and 1
    
    # Choose the note from the scale
    index = (x * scale_length).to_i
    
    note1 = my_scale[index]
    note2 = my_scale[index]+3
    note3 = my_scale[index]+5
    
    
    6.times do
      # Apply the logistic map
      x = logistic_map(x, r)
      
      # Map the logistic map output to an index in the scale
      
      # Ensure the index is within the valid range
      index = [[index, 0].max, scale_length - 1].min
      
      
      # Play the note
      synth :pluck, note: note1, sustain: 2, release: 0.9
      synth :pluck, note: note2, sustain: 2, release: 0.8
      synth :pluck, note: note3, sustain: 2, release: 0.7
      sleep [0.25,0.5].choose
      control e, phase: index
    end
  end
end

