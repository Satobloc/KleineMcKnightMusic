

live_loop :Jeanne do
  with_fx :flanger, depth: 10 do
    play :E3
    sleep 0.5
    play :Cs3
    sleep 0.5
    play :Ab3
    sleep 0.5
    play :Gb3
    sleep 0.5
  end
end

live_loop :Jenna do
  with_fx :flanger, depth: 10 do
    sleep 0.5
    play :E2
    sleep 0.5
    play :Cs4
    sleep 0.5
    play :Ab2
    sleep 0.5
    play :Gb4
  end
end

live_loop :Janice do
  with_fx :distortion, depth: 20 do
    use_synth :beep
    play :C4
    sleep 0.5
    play :Db4
    sleep 0.5
    play :C4
    sleep 0.5
    play :E4
    sleep 0.5
    play :Fs4
    sleep 0.5
    play :Ds4
    sleep 0.5
    play :D4
    sleep 0.5
    play :G4
    sleep 0.5
    play :D4
    sleep 0.5
    play :Es4
    sleep 0.5
    play :B4
    sleep 0.5
    play :C4
    sleep 0.5
    play :Bb4
    sleep 0.5
    play :Gb4
  end
end
