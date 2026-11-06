# --- "BEATER" (PRODUCTION-READY) ---
use_bpm 120
set_volume! 1.0
use_debug false
set :song_status, :running # Global flag for graceful stops

# --- HARMONY DEFINITIONS (V4.5.1 COMPATIBLE) ---
define :chorus_chords do
  # Pop Progression: I-V-vi-IV (C-G-Am-F)
  (ring chord(:C3, :major), chord(:G2, :major), chord(:A2, :m7), chord(:F2, :M7))
end

define :verse_chords do
  # Altered Pop: vi-IV-I-V (Am-F-C-G)
  (ring chord(:A2, :m7), chord(:F2, :M7), chord(:C3, :major), chord(:G2, :major))
end

# --- EXPERIMENTAL BRIDGE: TIMBRE CHORDS ---
define :play_timbre_chord do |note, mods|
  mods.each do |m|
    synth :fm, note: note, mod_index: m, divisor: 2, amp: 0.4, release: 2
  end
end

# --- CORE INSTRUMENTATION LOOPS ---
live_loop :beat_anchor do
  stop unless get(:song_status) == :running
  
  # Bar counter to emphasize first beat
  bar_pos = tick(:bar_counter) % 4
  
  # Kick: emphasize first beat, subtle randomization
  k_amp = 0.8 + (bar_pos == 0 ? 0.2 : 0) + rrand(-0.05, 0.05)
  sample :bd_haus, amp: k_amp
  
  # Glitch percussion with micro timing drift
  sleep 0.48 + rrand(-0.02, 0.02) # slight swing/drift
  sample :elec_plip, amp: 0.4 + rrand(-0.05,0.05) if one_in(3)
  
  sleep 0.48 + rrand(-0.02, 0.02)
  sample :elec_twang, rate: 1.5, amp: 0.3 + rrand(-0.05,0.05) if one_in(4)
  
  sleep 0.52 + rrand(-0.02, 0.02)
  # Optional ghost hit
  sample :elec_tick, amp: 0.2 + rrand(-0.05,0.05) if one_in(4)
  
  sleep 0.52 + rrand(-0.02, 0.02)
end

# --- HARMONY LAYER (SMOOTH & LUSH) ---
live_loop :harmony_layer do
  stop unless get(:song_status) == :running
  
  current_chord = (look < 32 ? verse_chords.tick : chorus_chords.tick)
  
  # Layered: staggered blade notes
  use_synth :blade
  current_chord.each do |n|
    play n, release: rrand(2.0, 2.5), amp: 0.25, cutoff: 70, pan: rrand(-0.2, 0.2)
    sleep 0.05
  end
  
  # Sub-layer for warmth
  use_synth :hollow
  current_chord.each do |n|
    play n - 12, release: 3.0, amp: 0.15, cutoff: 60
  end
  
  sleep 2
end

# --- GLITCHY MELODIC ELEMENT ---
live_loop :glitch_melody do
  stop unless get(:song_status) == :running
  use_synth :pluck
  
  notes = (ring :E4, :G4, :A4, :C5, :r).shuffle
  n = notes.tick
  if one_in(2) && n != :r
    play n, amp: rrand(0.6, 0.9), release: 0.2
  end
  sleep [0.25, 0.5].choose
end

# --- SONG CONTROL THREAD ---
in_thread do
  sleep 64
  
  # EXPERIMENTAL BRIDGE
  puts "--- BRIDGE: TIMBRE TRANSITION ---"
  with_bpm 60 do
    4.times do
      play_timbre_chord :A3, [0.8, 1.2, 1.5]
      sleep 2
    end
    
    # DISSONANT SHOCK: C# Major 7
    puts "--- DISSONANT PEAK ---"
    synth :piano, note: chord(:Cs4, :M7), release: 4, amp: 1.2
    sleep 4
  end
  
  # RESOLUTION
  puts "--- RESOLUTION ---"
  synth :piano, note: chord(:A2, :madd9), release: 8, amp: 1.2
  sleep 8
  
  # STOP EVERYTHING GRACEFULLY
  set :song_status, :finished
end
