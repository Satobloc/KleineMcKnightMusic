use_bpm 90
set_volume! 1.0
set :song_status, :running

# GLOBAL FX BUS
with_fx :reverb, room: 0.8, mix: 0.6 do
  with_fx :compressor, threshold: 0.2, slope_above: 0.8 do
    
    # ------------------------------
    # HARMONIC LANDSCAPE (THICK & SMOOTH)
    # ------------------------------
    define :complex_harmony do
      use_synth :piano
      chord_prog = ring(
        chord(:A3, :m7),
        chord(:F3, :M7),
        chord(:B3, :dim),
        chord(:E3, :dom7)
      )
      
      # Layered: main chord + smeared lower octave
      play chord_prog.tick, sustain: 3.5, release: 4.0, amp: 0.6
      play chord_prog.tick - 12, sustain: 3.5, release: 4.0, amp: 0.35
      sleep 4
    end
    
    # ------------------------------
    # PRIMARY MELODIC HOOK (JUICY PLUCK)
    # ------------------------------
    define :quiet_pluck_hook do |octave_shift=0|
      use_synth :pluck
      notes = ring(:A4, :r, :G4, :F4, :E4, :r, :D5, :C5)
      notes = notes.map { |n| n == :r ? :r : n + octave_shift }
      rhythm = ring(0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.5, 0.25)
      
      with_fx :lpf, cutoff: 100 do
        notes.length.times do
          n = notes.tick
          r = rhythm.tick
          amp = rrand(0.9, 1.2) # humanized velocity
          play n, amp: amp, release: 0.08 if n != :r
          sleep r + rrand(-0.02, 0.02) # humanized timing
        end
      end
    end
    
    # ------------------------------
    # EVOLVING ORNAMENTATION (Piano)
    # ------------------------------
    define :piano_ornamentation do
      use_synth :piano
      tick_count = tick(:ornament_counter)
      if tick_count < 24
        notes = ring(:E5, :C5, :G4, :A4)
        rhythm = ring(0.25, 0.25, 0.5, 0.5)
        amp = 0.35
      else
        notes = ring(:C6, :A5, :Gs5, :E5, :D5, :B4)
        rhythm = ring(0.125, 0.125, 0.25, 0.125, 0.25, 0.5)
        amp = 0.5
      end
      with_fx :flanger, mix: 0.25, depth: 4 do
        notes.length.times do
          play notes.tick, release: 0.05, amp: amp
          sleep rhythm.tick
        end
      end
    end
    
    # ------------------------------
    # DEEP, GRITTY BEAT ANCHOR
    # ------------------------------
    define :beat_anchor do
      sample :bd_tek, amp: 1.5 if one_in(2)
      sleep 0.5
      sample :sn_dub, amp: 1.2, rate: 1.1 if one_in(2)
      sleep 0.5
      sample :elec_tick, amp: 0.25, rate: rrand(1.5,2.5) if one_in(4)
      sleep 0.5
      sample :elec_plip, amp: 0.35 if one_in(6)
      sleep 0.5
    end
    
    # ------------------------------
    # DISSONANT PEAK
    # ------------------------------
    define :dissonant_peak do
      s = synth :pluck, note: :A4, release: 3.0, cutoff: 70, res: 0.5, cutoff_slide: 2.0
      control s, cutoff: 120, res: 0.95
      use_synth :piano
      play chord(:Cs5, :M7), attack: 0.1, release: 4.0, amp: 3.5
      sleep 4
      play chord(:A3, :m9), release: 8, amp: 2.0
      sleep 8
    end
    
    # ------------------------------
    # LIVE LOOPS
    # ------------------------------
    live_loop :harmony do
      stop unless get(:song_status) == :running
      complex_harmony
    end
    
    live_loop :pluck_melody do
      stop unless get(:song_status) == :running
      quiet_pluck_hook
    end
    
    live_loop :piano_runs do
      stop unless get(:song_status) == :running
      piano_ornamentation
    end
    
    live_loop :rhythm_anchor do
      stop unless get(:song_status) == :running
      beat_anchor
    end
    
    # ------------------------------
    # CONTROL THREAD
    # ------------------------------
    in_thread do
      sleep 64
      set :song_status, :stopping
      sleep 4
      dissonant_peak
      set :song_status, :stopped
    end
    
  end
end
