# --- "AXIOM POLISHED" (PRODUCED FOR V4.5.1 ON WINDOWS 10) ---
use_bpm 120
set_volume! 1.0
use_debug false
set :song_status, :running

# --- HARMONY DEFINITIONS ---
define :v_chords do # Altered Pop (vi-IV-I-V)
  (ring chord(:A2, :m7), chord(:F2, :M7), chord(:C3, :major), chord(:G2, :major))
end

define :c_chords do # Pop Progression (I-V-vi-IV)
  (ring chord(:C3, :major), chord(:G2, :major), chord(:A2, :m7), chord(:F2, :M7))
end

# --- PRODUCTION FX: GLOBAL COMPRESSION & REVERB ---
with_fx :reverb, room: 0.6, mix: 0.4 do
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    
    # --- 1. GROUNDED RHYTHM (Center Pan) ---
    live_loop :beat_anchor do
      stop unless get(:song_status) == :running
      k_amp = (line 0.8, 1.2, steps: 32).mirror.tick # Evolving dynamics
      sample :bd_haus, amp: k_amp, pan: 0
      
      # Balanced Glitch: Panned stereo jitter
      sample :elec_plip, amp: 0.3, pan: -0.5 if one_in(3)
      sample :elec_twang, rate: 1.5, amp: 0.2, pan: 0.5 if one_in(4)
      sleep 0.5
    end
    
    # --- 2. THE LUSH PAD (Wide Stereo) ---
    live_loop :harmony_layer do
      stop unless get(:song_status) == :running
      use_synth :blade
      # Sectional Logic: Switch chords every 32 beats
      prog = (tick(:time) < 64 ? v_chords : c_chords)
      play prog.tick(:ch), release: 2.2, amp: 0.4, cutoff: 85
      sleep 2
    end
    
    # --- 3. THE PRIMARY HOOK (Panned Right) ---
    live_loop :main_melody do
      stop unless get(:song_status) == :running
      sync :beat_anchor
      use_synth :pluck
      # Short memorable motif with syncopation
      notes = (ring :E4, :G4, :A4, :C5, :r).shuffle
      n = notes.tick
      if one_in(2) && n != :r
        play n, amp: rdist(0.2, 0.8), release: 0.3, pan: 0.4
      end
      sleep [0.25, 0.5].choose
    end
    
    # --- 4. EVOLVING ORNAMENTATION (Panned Left) ---
    live_loop :counterpoint do
      stop unless get(:song_status) == :running
      sync :beat_anchor
      use_synth :pretty_bell
      # Secondary voice adds complexity through higher register
      if one_in(3)
        play (scale :A4, :minor_pentatonic).choose, amp: 0.2, release: 1, pan: -0.4
      end
      sleep 0.5
    end
  end
end

# --- MASTER CONTROL THREAD (Structure & Balance) ---
in_thread do
  puts "--- INTRO ---"
  sleep 32
  
  puts "--- SECTION 1 (VERSE) ---"
  sleep 64
  
  puts "--- SECTION 2 (CHORUS) ---"
  # Production Trick: Increase intensity via slide
  set :intensity, 1.0
  sleep 64
  
  puts "--- EXPERIMENTAL BRIDGE: TIMBRE SHOCK ---"
  with_bpm 60 do
    # Non-diatonic shock injection (C# Major 7)
    with_fx :bitcrusher, bits: 8 do
      synth :piano, note: chord(:Cs4, :M7), release: 4, amp: 1.2
      sleep 4
    end
    # Resolution back to Tonic (A minor add9)
    synth :piano, note: chord(:A2, :madd9), release: 8, amp: 1.5
    sleep 8
  end
  
  puts "--- OUTRO: FADE OUT ---"
  set :song_status, :finished
end