#Makes ascending MAJOR chord arpeggios from starting tone
#CONFIGURATION
c = 0 #counter
s = 0 #step time - set to 0 to play chord
t = 60 #starting tone
p = [s, s+s, s+s+s] #pattern


live_loop :scaler do
  play_pattern_timed [t, t+4, t+7], p
  sleep 1
  t = t+1
  c = c+1
end
