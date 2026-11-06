live_loop :slidery do
  
  with_fx :tremolo, phase: rrand(0.25,12), phase_slide: rrand(4,9) do |e|
    use_synth :dpulse
    play rrand(50,65), release: rrand(4,5)
    s = play rrand(65,72), release: rrand(3,5), note_slide: rrand(0.5,7.5)
    sleep [0.5,0.25].choose
    control e, phase: [0.025,0.05].choose
    control s, note: [65,67,72].choose
    sleep [0.5,0.25].choose
    control e, phase: [1.04,1.03].choose
    control s, note: [64,65,71].choose
    sleep [1,0.75].choose
    control e, phase: [0.01,0.02].choose
    control s, note: [69,71,76].choose
    sleep 1
  end
end
