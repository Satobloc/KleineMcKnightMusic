live_loop :Sammie do
  sample :ambi_drone, decay: 1, onset: pick, sustain: 10, release: 1, rate: [1,0.5].choose
  sleep [1,0.5].choose
end

live_loop :Jock do
  sample :vinyl_rewind, decay: 1, onset: pick, sustain: 2, release: 1, rate: [2,0.5].choose
  sleep [1,0.5].choose
end

live_loop :Jake do
  sample :glitch_perc2, decay: 1, onset: pick, sustain: 2, release: 1, rate: 1
  sleep [1,1].choose
end

live_loop :Jelli do
  sample :tabla_tun2, decay: 1, onset: pick, sustain: 2, release: 1, rate: 1
  sleep [16,1].choose
end

live_loop :Jersey do
  sample :tabla_tas2, decay: 1, onset: pick, sustain: 2, release: 1, rate: 1
  sleep [1,2].choose
end

live_loop :Jenison do
  sample :tabla_ke1, decay: 1, onset: pick, sustain: 2, release: 1, rate: 1
  sleep [7,1].choose
end

live_loop :Jackson do
  sample :tabla_dhec, onset: pick, sustain: 1, release: 1
  sleep [3,1].choose
end

live_loop :Jerre do
  sample :tabla_re, onset: pick, sustain: 1, release: 1
  sleep [4,1].choose
end