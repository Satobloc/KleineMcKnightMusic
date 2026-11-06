use_bpm 120

live_loop :quadratic_modulation do
  # Define a base note
  base_note = :c4
  
  # Use vt to simulate the passage of virtual time
  vt = tick
  
  # Calculate a value using a quadratic function and transform it to range between 55 and 75
  value = ((vt ** 2 % 21) + 55).to_i
  
  # Ensure the value is within the range of 55 to 75
  value = [[value, 55].max, 75].min
  
  # Play the note with the calculated value as the pitch
  synth :beep, note: value, sustain: 0.5, release: 0.5
  
  sleep 0.5
end
