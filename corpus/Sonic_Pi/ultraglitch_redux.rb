# Set the tempo
use_bpm 70

# Define a helper function to add layers of sound
define :layer do |synth, notes, release, effects={}|
  with_fx :level, amp: effects[:amp] || 1 do
    with_fx :reverb, room: effects[:room] || 0.8 do
      with_fx :echo, decay: effects[:decay] || 2, phase: effects[:phase] || 0.25 do
        notes.each do |note|
          synth synth, note: note, release: release, amp: effects[:note_amp] || 1
          sleep 0.5
        end
      end
    end
  end
end

# Intro: Ambient pads and glitchy textures with subtle movement
in_thread do
  use_synth :dark_ambience
  layer :dark_ambience, [:e3, :g3, :b3, :d4, :e4], 4, amp: 0.5, room: 0.9
end

in_thread do
  sleep 4
  4.times do
    sample :glitch_perc1, rate: 0.5, start: 0.1, finish: 0.2, amp: 0.6
    sleep 0.5
    sample :glitch_perc2, rate: 0.6, start: 0.2, finish: 0.3, amp: 0.6
    sleep 0.5
    sample :glitch_perc3, rate: 0.7, start: 0.3, finish: 0.4, amp: 0.6
    sleep 0.5
    sample :glitch_perc4, rate: 0.8, start: 0.4, finish: 0.5, amp: 0.6
    sleep 0.5
  end
end

# Building: Adding rhythmic elements with variation
in_thread do
  sleep 8
  16.times do
    sample :bd_808, amp: 1.5
    sleep 0.75
    sample :elec_blip, rate: [0.5, 1, 1.5].choose, amp: 0.8
    sleep 0.5
    sample :elec_blip2, rate: [0.5, 1, 1.5].choose, amp: 0.8
    sleep 0.5
    sample :elec_blip, rate: [0.5, 1, 1.5].choose, amp: 0.7
    sleep 0.25
  end
end

# Layered melodies: Plucked synths with evolving arpeggios
in_thread do
  sleep 16
  use_synth :pluck
  with_fx :echo, decay: 3, phase: 0.5 do
    play_pattern_timed [:e4, :g4, :b4, :d5, :e5], [0.5], release: 0.6, amp: 0.8
  end
end

# Evolving soundscape: Additional textured layers with arpeggios
in_thread do
  sleep 24
  use_synth :prophet
  layer :prophet, [:e3, :g3, :b3, :d4, :e4], 4, amp: 0.4, room: 0.9, decay: 3, note_amp: 0.7
end

# Adding glitchy percussion: Enhancing the rhythm
in_thread do
  sleep 32
  32.times do
    sample :glitch_perc5, rate: [0.5, 1, 1.5].choose, amp: 0.7
    sleep 0.25
    sample :elec_blip, rate: [0.5, 1, 1.5].choose, amp: 0.7
    sleep 0.25
  end
end

# Full layered climax with bass and evolving synths
in_thread do
  sleep 40
  use_synth :fm
  play_pattern_timed [:e2, :g2, :b2, :d3, :e3], [1], release: 2, amp: 1.2
end

# Outro: Gradual fade-out of elements and final atmospheric textures
in_thread do
  sleep 56
  with_fx :level, amp: 0.5 do
    with_fx :reverb, room: 0.9 do
      with_fx :echo, decay: 2, phase: 0.5 do
        use_synth :blade
        play_pattern_timed [:e3, :g3, :b3, :d4, :e4], [1], release: 2, amp: 0.8
      end
    end
  end
  sleep 16
  use_synth :dark_ambience
  play_pattern_timed [:e3, :g3, :b3, :d4, :e4], [2], release: 4, amp: 0.3
end
