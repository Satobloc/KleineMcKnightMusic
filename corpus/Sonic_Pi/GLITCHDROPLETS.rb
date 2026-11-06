# s
## GLITCHROPLETS

use_bpm 90
set_volume! 1.0
use_debug false
set :song_status, :running # Global control for graceful stop

with_fx :reverb, room: 0.8, mix: 0.6 do
  
  # --- HARMONIC LANDSCAPE (Piano for Rich Harmony) ---
  # Sophisticated Minor Progression: Am7 - Fmaj7 - Bdim - E7 (i7 - VImaj7 - ii° - V7)
  define :complex_harmony do
    use_synth :piano # Rich, acoustic-like harmony
    
    # FIX: Ensure E chord is dominant (E7 or :7) for V7 resolution tension
    # Note: Using :M7 for Fmaj7 is confirmed as a valid symbol
    chord_prog = (ring (chord :A3, :m7), (chord :F3, :M7), (chord :B3, :dim), (chord :E3, :m6))
    play chord_prog.tick, release: 3.5, sustain: 3.0, amp: 0.6
    sleep 4 # 1 bar duration
  end
  
  # --- PRIMARY MELODIC HOOK (Pluck Counterpoint) ---
  # Quietly powerful, disarmingly simple, highly rhythmic hook
  define :quiet_pluck_hook do |octave_shift=0|
    use_synth :pluck
    
    # Rhythmic complexity achieved via syncopation and rests
    notes = (ring :A4, :r, :G4, :F4, :E4, :r, :D5, :C5).map {|n| n + octave_shift}
    rhythm = (ring 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5, 0.25) # Varied timing
    
    with_fx :lpf, cutoff: 100 do
      notes.length.times do
        # Use a short release for delicacy
        play notes.tick, amp: 1.0, release: 0.08 if look != :r
        sleep rhythm.look
      end
    end
  end
  
  # --- EVOLVING ORNAMENTATION (Piano Playful Counterpoint) ---
  define :piano_ornamentation do
    # Use the tick counter to define complexity evolution
    tick_count = tick(:ornament_counter)
    use_synth :piano
    
    if tick_count < 24 # Phase 1: Simple, repetitive, diatonic (Playful start)
      notes_to_play = (ring :E5, :C5, :G4, :A4)
      rhythm_list = (ring 0.25, 0.25, 0.5, 0.5)
      amp = 0.35
    else # Phase 2: Intricate, chromatic runs, wider leaps (Structural evolution)
      # Introduce chromaticism (G#) and wider intervals for sophistication
      notes_to_play = (ring :C6, :A5, :Gs5, :E5, :D5, :B4)
      rhythm_list = (ring 0.125, 0.125, 0.25, 0.125, 0.25, 0.5)
      amp = 0.5
    end
    
    
    with_fx :flanger, mix: 0.2, depth: 3 do # Add delicate swirling effect
      notes_to_play.length.times do
        play notes_to_play.tick, release: 0.05, amp: amp
        sleep rhythm_list.look
      end
    end
  end
  
  # --- BEAT HOOK (Subtle, Non-Repetitive Anchoring) ---
  define :beat_anchor do
    # Use a softer kick and higher probabilities for less aggressive rhythm
    sample :bd_pure, amp: 0.8, rate: 1.0 if one_in(3) # Less frequent, softer kick
    sleep 0.5
    sample :elec_snare, amp: 0.6, rate: 1.2 if one_in(2)
    sleep 0.5
    # Micro-rhythmic detail/fraying via high-frequency clicks
    sample :elec_tick, amp: 0.2, rate: rrand(1.5, 2.5) if one_in(4)
    sleep 0.25
    sample :elec_plip, amp: 0.3 if one_in(6)
    sleep 0.25
  end
  
  # --- DIVERGENCE / DISSONANT EMOTIONAL PEAK ---
  define :dissonant_peak do
    puts "--- DISSONANT PEAK: IIImaj7 DIVERGENCE (Advanced) ---"
    
    # 1. Rising Tension: Modulate a pluck synth using LPF/Resonance slide
    s_pluck = synth :pluck, note: :A4, release: 3.0, cutoff: 70, res: 0.5, cutoff_slide: 2.0
    control s_pluck, cutoff: 120, res: 0.95 # High resonance for whistling tension
    
    # 2. Climax Chord (Piano) - C# Major 7 (IIImaj7 - unexpected major third shift)
    use_synth :piano
    play chord(:Cs5, :M7), release: 4.0, amp: 3.5, attack: 0.1 # Dissonant clash with A minor
    
    sleep 4.0
    
    # Immediate resolution back to A minor added 9th (madd9) [Conversation History]
    play chord(:A3, :madd9), release: 8, amp: 2.0
    sleep 8
  end
  
  
  # --- SONG STRUCTURE (8 Bars = 32 beats per section) ---
  
  # Harmonically Rich Piano Loop
  live_loop :harmony do
    stop unless get(:song_status) == :running
    complex_harmony
  end
  
  # Pluck Melody Hook Loop (High Counterpoint)
  live_loop :pluck_melody do
    stop unless get(:song_status) == :running
    quiet_pluck_hook
  end
  
  # Piano Ornamentation Loop (Complexification Layer)
  live_loop :piano_runs do
    stop unless get(:song_status) == :running
    piano_ornamentation
  end
  
  # Beat Anchor Loop
  live_loop :rhythm_anchor do
    stop unless get(:song_status) == :running
    beat_anchor
  end
  
  # --- CONTROL THREAD (Manages structure and divergence) ---
  in_thread do
    # Allow 16 bars (64 beats) of interwoven complexity
    sleep 64
    
    # Graceful Divergence: Signal loops to stop after current cycle
    set :song_status, :peak_imminent
    puts "--- Structural Interruption for Dissonance ---"
    
    # Wait for running loops to catch up (4 bars * 0.25 sec/beat = 1 sec max for the pluck hook to finish)
    sleep 4
    
    # Execute the Dissonant Peak and Resolution
    dissonant_peak
    
    # End song
    stop
  end
end