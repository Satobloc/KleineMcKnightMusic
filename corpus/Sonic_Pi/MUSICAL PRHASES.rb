# MUSICAL PHRASES

phrase1 = [:F, :F, :F, :F]
phrase2 = [:Bb, :Bb, :Bb, :Bb]
phrase3 = [:A, :A, :A, :A]
phrase4 = [:A, :A, :A, :A]
phrase_array = [phrase1, phrase2, phrase3, phrase4].choose


contra1 = [:A3, :Bb3, :F5, :G6, :A3, :Bb, :Ds, :F8]
contra2 = [:A3, :C3, :Eb7, :E6, :A3, :C, :Ds8, :F]
contra3 = [:Cs3, :Cs3, :G5, :G7, :A3, :Cs7, :F8, :F]
contra4 = [:C3, :Cs3, :E5, :F7, :A3, :Bb7, :Cs5, :F]
contra_array = [contra1, contra2, contra3, contra4].choose

a_rhythm1 = [0.25, 0.25, 0.25]
a_rhythm2 = [0.125, 0.125, 1]
a_rhythm3 = [0.25, 0.25, 0.5]
a_rhythm4 = [1, 0.25, 0.5]
a_rhythm_array = [a_rhythm1, a_rhythm2, a_rhythm3, a_rhythm4].choose

rhythm1 = [0.5, 0.5, 1.0]
rhythm2 = [0.25, 0.25, 0.5]
rhythm3 = [0.25, 0.25, 0.5]
rhythm4 = [1, 0.25, 0.5]
rhythm_array = [rhythm1, rhythm2, rhythm3, rhythm4].choose


play_pattern_timed phrase1, rhythm1
sleep 1
play_pattern_timed phrase_array, rhythm_array


