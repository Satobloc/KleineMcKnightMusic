
live_loop :Capricorn do
  with_fx :bitcrusher, mix: 1, amp:20+tick/200 do
    sample :drum_tom_lo_soft
    sleep 0.5-tick/100
    sample :drum_cymbal_pedal
    sleep 0.5-tick/100
    sample :drum_heavy_kick
    sleep 0.5-tick/100
    sample :drum_tom_hi_soft
    sleep 0.5-tick/100
    sample :perc_snap2
    sleep 0.5-tick/100
  end
end

live_loop :Sagg do
  with_fx :bitcrusher, mix: 1, amp:35+tick/300 do
    sleep 10
    sample :drum_tom_lo_soft
    sleep 0.5-tick/200
    sample :drum_cymbal_pedal
    sleep 0.5-tick/100
    sample :drum_heavy_kick
    sleep 0.5-tick/200
    sample :drum_tom_hi_soft
    sleep 0.5-tick/100
    sample :perc_snap2
    sleep 0.5-tick/100
    sample :drum_tom_lo_soft
    sleep 0.5-tick/100
    sample :drum_cymbal_pedal
    sleep 0.5-tick/200
    sample :drum_heavy_kick
    sleep 0.5-tick/200
    sample :drum_tom_hi_soft
    sleep 0.5-tick/200
    sample :perc_snap2
    sleep 0.5-tick/100
    sample :drum_tom_lo_soft
    sleep 0.5-tick/100
    sample :drum_cymbal_pedal
    sleep 0.5-tick/200
    sample :drum_heavy_kick
    sleep 0.25-tick/300
    sample :drum_tom_hi_soft
    sleep 0.25-tick/100
    sample :perc_snap2
    sleep 0.25-tick/200
    sample :drum_tom_lo_soft
    sleep 0.25-tick/100
    sample :drum_cymbal_pedal
    sleep 0.25-tick/100
    sample :drum_heavy_kick
    sleep 0.35-tick/200
    sample :drum_tom_hi_soft
    sleep 0.35-tick/100
    sample :drum_bass_hard
    sleep 0.35-tick/100
    sample :drum_tom_lo_soft
    sleep 0.25-tick/100
    sample :drum_cymbal_pedal
    sleep 0.05+[tick*0,tick*0.02,tick*0.010].choose
    sample :drum_heavy_kick
    sleep 0.25+[tick*0,tick*0.01,tick*0.020].choose
    sample :drum_bass_hard
    sleep 0.15+[tick*0,tick*0.20].choose
    sample :drum_cymbal_hard
    sleep 0.35+[tick*0,tick*0.2,tick].choose
    sample :drum_cymbal_hard
    sleep 10
  end
end

live_loop :Reginald do
  sample :perc_bell, amp: 20+tick/300
  sleep 4-tick/200
  play :eb7
  sleep 10-tick/100
  play :eb7
  sleep 10-tick/200
  play :eb7
  sleep 10-tick/200
  play :eb7
  sleep 10-tick/100
  play :eb7
  sleep 10-tick/300
end


live_loop :Jeanne do
  with_fx :flanger, depth: 10+tick/300 do
    play :E3
    sleep 0.5-tick/300
    play :Cs3
    sleep 0.5-tick/300
    play :Ab3
    sleep 0.5-tick/300
    play :Gb3
    sleep 0.5-tick/300
  end
end

live_loop :Jenna do
  with_fx :flanger, depth: 10+tick/300 do
    sleep 0.5-tick/300
    play :E2
    sleep 0.5-tick/300
    play :Cs4
    sleep 0.5-tick/300
    play :Ab2
    sleep 0.5-tick/300
    play :Gb4
  end
end

live_loop :Janice do
  with_fx :distortion, depth: 20+tick/300 do
    use_synth :beep
    play 0
    sleep 0.5-tick/300
    play :Db4
    play 0-tick/300
    play :C4
    play 0-tick/300
    play :E4
    play 0-tick/300
    play :Fs4
    play 0-tick/300
    play :Ds4
    play 0-tick/300
    play :D4
    play 0-tick/300
    play :G4
    play 0-tick/300
    play :D4
    sleep 0.5-tick/300
    play :Es4
    sleep 0.5-tick/300
    play :B4
    sleep 0.5-tick/300
    play :C4
    sleep 0.5-tick/300
    play :Bb4
    sleep 0.5-tick/300
    play :Gb4
    play :C4-tick/300
    sleep 0.5-tick/300
    play :Db4
    sleep 0.5-tick/300
    play :C4
    sleep 0.5-tick/300
    play :E4
    sleep 0.5-tick/300
    play :Fs4
    sleep 0.5-tick/300
    play :Ds4
    sleep 0.5-tick/300
    play :D4
    sleep 0.5-tick/300
    play :G4
    sleep 0.5-tick/300
    play :D4
    sleep 0.5-tick/300
    play :Es4
    sleep 0.5-tick/300
    play :B4
    sleep 0.5-tick/300
    play :C4
    sleep 0.5-tick/300
    play :Bb4
    sleep 0.5-tick/300
    play :Gb4
  end
end

live_loop :Hank do
  with_fx :distortion, depth: 20+tick/300 do
    use_synth :beep
    play 0
    sleep 0.5-tick/300
    play :Ds5
    play 0-tick/300
    play :Cs3
    play 0-tick/300
    play :Eb2
    play 0-tick/300
    play :F2
    play 0-tick/300
    play :Ds5
    play 0-tick/300
    play :Ds4
    play 0-tick/300
    play :Gb4
    play 0-tick/300
    play :Ds3
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :B4
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    play :C4-tick/300
    play 0
    play :Db4
    play 0
    play :C4
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :G5
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :B5
    sleep 0.5-tick/300
    play :C4
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
  end
end

live_loop :Yasser do
  with_fx :distortion, depth: 30, amp:5 do
    use_synth :growl
    play :G8
    play :Fs8
    play :Bb8
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :D6
    play :E6
    play :Bb6
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :D6
    play :Fs6
    play :Bb6
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :E8
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :E6
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :E6
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :D7
    play :E7-tick/300
    play :Fs8
    play :Bb6-tick/300
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play:e6
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :E6
    play :Fs8-tick/300
    play :Bb6-tick/300
  end
end

live_loop :Baxter do
  with_fx :echo, depth: 1, amp:8 do
    use_synth :fm
    play 0
    sleep 0.5-tick/300
    play 0-tick/300
    sleep 0.5-tick/300
    play 0-tick/300
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0-tick/300
    sleep 0.5-tick/300
    play 0-tick/300
    sleep 0.5-tick/300
    play 0-tick/300
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :E6
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0-tick/300-tick/300
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :E6
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :E6
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play 0
    sleep 0.5-tick/300
    play :ds6
    sleep 0.5-tick/300
    play :eb6
    sleep 0.25-tick/300
    play :Eb6
    sleep 0.25-tick/300
    play :Ds7
    sleep 0.25-tick/300
    play :G6
    sleep 0.25-tick/300
    play :g6
    sleep 0.25-tick/300
    play :Fs6
    sleep 0.25-tick/300
    play :Eb6
    sleep 0.25-tick/300
    play :bb6
    sleep 0.25-tick/300
    play :b5
    sleep 0.5-tick/300
    play :eb6
    sleep 0.25-tick/300
    play :eb7
    sleep 0.25-tick/300
    play :Ds7
    sleep 0.25-tick/300
    play :E6
    sleep 0.25-tick/300
    play :Fs7
    sleep 0.25-tick/300
    play :Fs6
    sleep 0.25-tick/300
    play :ds6
    sleep 0.25-tick/300
    play :bb6
    sleep 0.25-tick/300
    play :bb7
    sleep 0.5-tick/300
    play :eb6
    sleep 0.25-tick/300
    play :Eb6
    sleep 0.25-tick/300
    play :Ds6
    sleep 0.25-tick/300
    play :E7
    sleep 0.25-tick/300
    play :g7
    sleep 0.25-tick/300
    play :Fs6
    sleep 0.25-tick/300
    play :ds6
    sleep 0.25-tick/300
    play :bb6
    sleep 0.25-tick/300
    play 0
    sleep 0.25-tick/300
    play:e6
    sleep 0.25-tick/300
    play 0
    sleep 0.25-tick/300
    play :g8
  end
end
