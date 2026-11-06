
use_bpm 90
set_volume! 1.0
use_debug false
set :song_status, :running # Set initial global status

with_fx :reverb, room: 0.8, mix: 0.6 do
  
  # --- HARMONIC LANDSCAPE (Piano for Rich Harmony) ---
  # FIX 1: Using :M7 as per user preference (also a recognized symbol [3])
  define :complex_harmony do
    use_synth :piano
    # Progression: Am7 - Fmaj7 (F M7) - Bdim - E7
    chord_prog = (ring (chord :A3, :m7), (chord :F3, :M7), (chord :B3, :dim), (chord :E3, :m7))
    play chord_prog.tick, release: 3.5, sustain: 3.0, amp: 0.6
    sleep 4
  end
  
  # --- PRIMARY MELODIC HOOK (Pluck Counterpoint) ---
  # Quietly powerful, disarmingly simple, repeating motif.
  define :quiet_pluck_hook do |octave_shift=0|
    use_synth :pluck
    notes = (ring :A4, :G4, :F4, :E4).map {|n| n + octave_shift}
    rhythm = (ring 0.3, 0.3, 0.4, 1.0).ring
    
    with_fx :lpf, cutoff: 100 do
      4.times do
        play notes.tick, rhythm: rhythm.tick, amp: 1.0, release: 0.2
        sleep 2.0 / 4
      end
    end
  end
  
  
  # --- EVOLVING ORNAMENTATION / SECONDARY COUNTERPOINT (Piano) ---
  define :piano_ornamentation do
    tick_count = tick(:ornament_counter)
    
    use_synth :piano
    
    if tick_count < 16
      # Phase 1: Simple Arpeggiation. Use a single-element ring for proper .tick usage.
      notes_to_play = (ring :C5, :E5, :A5, :E5)
      rhythm_list = (ring 0.25)
      amp = 0.3
    else
      # Phase 2: Complexified, chromatic and playful runs.
      notes_to_play = (ring :C5, :D5, :E5, :B4, :C4, :A4)
      rhythm_list = (ring 0.15, 0.15, 0.2, 0.5)
      amp = 0.6
    end
    
    4.times do
      play notes_to_play.tick, release: 0.1, amp: amp
      
      # FIX 2: Use .tick on the rhythm_list to ensure a single numeric duration is passed
      # and the rhythmic pattern advances correctly for each iteration [1, 2].
      sleep rhythm_list.tick
    end
  end
  
  # --- BEAT HOOK (Subtle, Non-Repetitive Anchoring) ---
  define :beat_anchor do
    # Uses probability and light syncopation to "fray" the structure [6, 7]
    sample :bd_haus, amp: 1.0 if one_in(2)
    sleep 0.5
    sample :elec_snare, amp: 0.7
    sleep 0.5
    sample :elec_plip, amp: 0.3 if one_in(3)
    sleep 0.5
    sample :elec_twang, amp: 0.5 if one_in(4)
    sleep 0.5
  end
  
  # --- DIVERGENCE / DISSONANT EMOTIONAL PEAK ---
  # Dissonant chord chosen for maximum impact and structural divergence
  define :dissonant_peak do
    puts "--- DISSONANT PEAK: IIImaj7 DIVERGENCE ---"
    
    # Rising Pluck Tension
    use_synth :pluck
    with_fx :lpf, cutoff: 110, res: 0.8 do
      play_pattern_timed scale(:G4, :chromatic).take(6), [0.1, 0.1, 0.1, 0.15, 0.2, 0.25], amp: 1.5
    end
    
    # Climax Chord: C# Major 7 (:Cs5, :maj7)
    use_synth :piano
    play chord(:Cs5, :M7), release: 3.0, amp: 3.5, attack: 0.1
    sleep 2.0
    
    # Immediate resolution
    play chord(:A3, :madd9), release: 8, amp: 4.0 # Resolved, profound chord [1-4]
    sleep 4
    
  end
  
  
  # --- FULL SONG STRUCTURE: Live Loops ---
  
  # Harmonically rich piano layer (Harmony)
  live_loop :harmony do
    stop unless get(:song_status) == :running
    complex_harmony
  end
  
  # Pluck melody (Hook/Counterpoint 1)
  live_loop :pluck_melody do
    stop unless get(:song_status) == :running
    quiet_pluck_hook
    sleep 2 # Adjusted sleep for hook duration
  end
  
  # Piano ornamentation (Counterpoint 2 / Complexity)
  live_loop :piano_runs do
    stop unless get(:song_status) == :running
    piano_ornamentation
    sleep 4 # Matches harmony timing for structural meshing
  end
  
  # Beat anchor
  live_loop :rhythm_anchor do
    stop unless get(:song_status) == :running
    beat_anchor
  end
  
  # --- CONTROL THREAD (Structure and Peak) ---
  in_thread do
    # Intro/Verse (16 Bars total before peak preparation)
    sleep 64
    
    # Divergence Command: Stop the musical loops gracefully
    set :song_status, :peak_imminent
    puts "--- Divergence Initiated ---"
    
    # Wait for one final cycle to ensure all loops see the change and stop gracefully
    sleep 4
    
    # Execute the Dissonant Peak
    dissonant_peak
    
    # Outro/Fade (allow the final resolving chord to ring out)
    sleep 8
    
    # Stop remaining loops/cleanup
    stop
  end
end

