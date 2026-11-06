

define :generate_contrapoints do
  contra1 = [:A3, :Bb3, :F5, :G6, :A3, :Bb, :Ds, :F8]
  contra2 = [:A3, :C3, :Eb7, :E6, :A3, :C, :Ds8, :F]
  contra3 = [:Cs3, :Cs3, :G5, :G7, :A3, :Cs7, :F8, :F]
  contra4 = [:C3, :Cs3, :E5, :F7, :A3, :Bb7, :Cs5, :F]
  contra_array = [contra1, contra2, contra3, contra4].choose
  return contra_array
end

define :alternate_rhythms do
  # slopp = Math.sin((tick / 1.0) * Math::PI).abs
  slopp=1
  a_rhythm1 = [slopp*0.25, 0.25, 0.25]
  a_rhythm2 = [slopp*0.125, 0.125, 1]
  a_rhythm3 = [slopp*0.25, 0.25, 0.5]
  a_rhythm4 = [slopp*1, 0.25, 0.5]
  a_rhythm_array = [a_rhythm1, a_rhythm2, a_rhythm3, a_rhythm4].choose
  return a_rhythm_array
end

# CONTRAPOINT PLAY

counter = 0
live_loop :lownote do
  if counter < 2
    unphase = Math.sin((tick / 500.0) * Math::PI)
    sleep 0.5
    use_synth :pluck
    notes = generate_contrapoints
    rhythms = alternate_rhythms
    rhythms.each do |duration|
      #      amp = Math.sin((tick / 10.0) * Math::PI).abs
      #      pan = 0.7
      #      dec_l = Math.sin((tick / 10.0) * Math::PI).abs
      #      sus_l = Math.sin((tick / 10.0) * Math::PI).abs
      #      cut = Math.sin((tick / 10.0) * Math::PI).abs
      #      res = Math.sin((tick / 10.0) * Math::PI).abs
      #      phase = Math.sin((tick / 10.0) * Math::PI).abs
      #      pul_w = Math.sin((tick / 10.0) * Math::PI).abs
      play_pattern_timed notes, [duration]
      # pulse_width: pul_w, phase: phase, resonance: res, cutoff: cut, amp: amp, pan: pan, decay_level: dec_l, sustain_level: sus_l
    end
    counter += 1
  else
    counter = 0
  end
  sleep 1
end