### LOVE IT WORKING


use_bpm 90
set_volume! 1.0
use_debug false

# Global Reverb for atmosphere and space
with_fx :reverb, room: 0.8, mix: 0.6 do
  
  # --- HARMONIC LANDSCAPE (Piano for Rich Harmony) ---
  # Sophisticated Minor Progression: Am7 - Fmaj7 - Bdim - E7 (i7 - VImaj7 - ii° - V7)
  define :complex_harmony do
    use_synth :piano
    # Progression: Am7 - Fmaj7 (F M7) - Bdim - E7
    chord_prog = (ring (chord :A3, :m7), (chord :F3, :M7), (chord :B3, :dim), (chord :E3, :m7))
    play chord_prog.tick, release: 3.5, sustain: 3.0, amp: 0.6
    sleep 4
  end
  
  # --- PRIMARY MELODIC HOOK (Pluck for Counterpoint/Definition) ---
  # Quietly powerful and disarmingly simple motif, leading the counterpoint
  define :quiet_pluck_hook do |octave_shift=0|
    use_synth :pluck # Sharp, distinct voice for counterpoint
    # Simple rhythmic motif (3 notes fast, one long sustain)
    notes = (ring :A4, :G4, :F4, :E4).map {|n| n + octave_shift}
    rhythm = (ring 0.3, 0.3, 0.4, 1.0) # Uses varied durations for interest
    
    with_fx :lpf, cutoff: 100 do
      4.times do
        play notes.tick, rhythm: rhythm.look, amp: 1.0, release: 0.2
        sleep 2.0 / 4 # Keep rhythm syncopated to the 4-beat pattern
      end
    end
  end
  
  # --- EVOLVING ORNAMENTATION / SECONDARY COUNTERPOINT (Piano) ---
  # Starts playful, structurally evolves by using passing notes and wider leaps
  define :piano_ornamentation do |evolution=0|
    use_synth :piano
    # Base motif: Arpeggiated A minor triad notes
    notes = (scale :A5, :minor).take(3)
    
    if evolution == 0
      # Phase 1: Simple up-and-down motion (Playful)
      notes_to_play = (ring notes, notes, notes, notes)
      play_pattern_timed notes_to_play, [0.25, 0.25, 0.5, 0.5], amp: 0.4
      
    else # Phase 2/3: Complexified, chromatic, structural fraying
      # Introduces chromatic tension (D# and G#) and wider leaps
      notes_to_play = (ring :C5, :E5, :D5, :Ds5, :A4, :Gs4)
      play_pattern_timed notes_to_play, [0.2, 0.2, 0.3, 0.3, 0.5, 0.5], amp: 0.7, release: 0.1
    end
  end
  
  # --- BEAT HOOK (Simple, Subtle, Non-Repetitive) ---
  define :beat_anchor do
    # Anchoring kick drum, lightly syncopated snare/click
    in_thread do
      # Non-repetitive element: random chance and small time variation ("fraying")
      sample :bd_haus, amp: 1.0, rate: 1.0 if one_in(2)
      sleep 0.5
      sample :elec_snare, amp: 0.7
      sleep 0.5
      sample :elec_plip, amp: 0.3, rate: 1.2 if one_in(3)
      sleep 0.5
      sample :elec_twang, amp: 0.5 if one_in(4)
      sleep 0.5
    end
  end
  
  # --- Single Slightly Dissonant Emotional Peak ---
  # Focuses on an abrupt shift in harmony and register for dramatic contrast
  define :dissonant_peak do
    puts "--- DISSONANT PEAK: IIImaj7 DIVERGENCE ---"
    
    # 1. Rising Tension in Pitch/Rhythm (Pluck)
    use_synth :pluck
    with_fx :lpf, cutoff: 110, res: 0.8 do # High resonance
      # Rapid, chromatic ascent
      play_pattern_timed scale(:G4, :chromatic).take(6), [0.1, 0.1, 0.1, 0.15, 0.2, 0.25], amp: 1.5
    end
    
    # 2. Climax Chord (Piano) - C# Major 7 (Borrowed IIImaj7, highly dissonant against A minor)
    use_synth :piano
    play chord(:Cs5, :M7), release: 3.0, amp: 3.5, attack: 0.1
    sleep 2.0
  end
  
  # --- FULL SONG STRUCTURE ---
  
  # INTRO (8 Bars: Harmonic Foundation + Pluck Hook establishing the motif)
  in_thread do
    16.times do
      complex_harmony
    end
  end
  
  # The Pluck hook starts immediately, leading the song
  in_thread do
    16.times do
      quiet_pluck_hook
    end
  end
  
  # Beat enters
  in_thread do
    16.times do
      beat_anchor
    end
  end
  
  sleep 32 # End of Intro/Start of Verse 1
  
  # VERSE 1 (8 Bars: Harmony + Hook + Simple Ornamentation)
  in_thread do
    8.times do
      piano_ornamentation(2)
      sleep 4
    end
  end
  
  sleep 32 # End of Verse 1
  
  # BUILD / PRE-PEAK (4 Bars: Increasing Counterpoint and complexity)
  # Ornamentation evolves to chromatic fraying (evolution 1)
  in_thread do
    4.times do
      piano_ornamentation(1)
      sleep 4
    end
  end
  
  sleep 16 # Wait for build to complete
  
  # DISSONANCE
  dissonant_peak # 2 beats of dissonance + resolution
  
  # OUTRO (8 Bars: Decaying Harmony and Simple Hook return)
  # The rhythm track is intentionally killed to emphasize the fraying structure
  :beat_anchor
  
  in_thread do
    8.times do
      # Harmony shifts to a simpler, decaying motif (IV-i)
      use_synth :piano
      play_chord (ring chord(:F3, :major), chord(:A3, :minor)).tick, release: 6, amp: 0.4
      
      # Final, spaced, simple pluck notes (the remnant of the hook)
      use_synth :pluck
      play (scale :A5, :minor_pentatonic).choose, release: 0.1, amp: 0.8 if one_in(2)
      
      sleep 4
    end
  end
  
  sleep 32
  
end