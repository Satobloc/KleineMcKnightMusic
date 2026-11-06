live_loop :Bo do
  with_fx :flanger, depth: 0 do
    sample :ambi_drone, rate: 2
    sleep [0.25,10,5].choose
  end
  
  live_loop :Bane do
    with_fx :flanger, depth: 0 do
      sample :vinyl_scratch, rate: 0.5
      sleep [0.25,10,5].choose
    end
  end
  
  live_loop :Sean do
    use_synth :saw
    sleep 4
    play 77
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [70,62].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [77,60].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [70,62].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [77,60].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [70,62].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [77,60].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [70,62].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 77
    sleep 4
  end
  
  live_loop :Zach do
    use_synth :saw
    sleep 4
    play 77
    sleep 0.25+rrand(-0.0005,0.0001)
    play [72,67].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [72,62].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [72,67].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [72,62].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [72,67].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [72,62].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play [72,67].choose
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 0.25+rrand(-0.0005,0.0001)
    play 0
    sleep 4
  end
  
  live_loop :Jeanne do
    with_fx :flanger, depth: 10 do
      p=[0,10].choose
      d=[0,10].choose
      q=[0,10].choose
      play 60+p
      sleep 0.25+rrand(-0.0005,0.0001)
      play 67+d
      sleep 0.25+rrand(-0.0005,0.0001)
      play 62+q
      sleep 0.25+rrand(-0.0005,0.0001)
      play 62+q
      sleep 0.25+rrand(-0.0005,0.0001)
    end
  end
  
  live_loop :Justin do
    use_synth :fm
    play 77
    sleep 0.25+rrand(-0.0005,0.0001)
    play 72
    sleep 0.25+rrand(-0.0005,0.0001)
    play 70
    sleep 0.25+rrand(-0.0005,0.0001)
    play 72
    sleep 0.25+rrand(-0.0005,0.0001)
    play 77
    sleep 0.25+rrand(-0.0005,0.0001)
    play 72
    sleep 0.25+rrand(-0.0005,0.0001)
    play 70
    sleep 0.25+rrand(-0.0005,0.0001)
    play 72
    sleep 0.25+rrand(-0.0005,0.0001)
  end
end
live_loop :B0xer do
  with_fx :gverb, depth: rrand(-1,10) do
    with_fx :flanger, depth: rrand(-1,10) do
      
      sleep 8
      sample :drum_cymbal_hard, rate: rrand(0.5,0.7)
      sleep 20
    end
  end
end




































































































































































































