# Set the tempo to 140 BPM, a typical dubstep speed
use_bpm 140

# Define a helper function to add layers of sound with wobble bass
define :layer do |synth, notes, release, effects={}|
  with_fx :level, amp: effects[:amp] || 1 do
    with_fx :reverb, room: effects[:room] || 0.8 do
      with_fx :echo, decay: effects[:decay] || 2, phase: effects[:phase] || 0.25 do
        notes.each do |note|
          synth synth, note: note, release: release
          sleep 0.5
        end
      end
    end
  end
end

# Intro: Atmosphere and build-up with eerie sounds
in_thread do
  use_synth :dark_ambience
  layer :dark_ambience, [:e3, :g3, :b3, :d4, :e4], 4, amp: 0.5
end

# Layered glitchy sounds for buildup
in_thread do
  sleep 4
  sample :glitch_perc1, rate: 0.5, start: 0.1, finish: 0.2, amp: 0.6
  sleep 0.5
  sample :glitch_perc2, rate: 0.6, start: 0.2, finish: 0.3, amp: 0.6
  sleep 0.5
  sample :glitch_perc3, rate: 0.7, start: 0.3, finish: 0.4, amp: 0.6
  sleep 0.5
  sample :glitch_perc4, rate: 0.8, start: 0.4, finish: 0.5, amp: 0.6
end

# First drop: Wobbly bass and intense percussion
in_thread do
  sleep 12
  16.times do
    use_synth :tb303
    with_fx :wobble, depth: 0.8, phase: 0.5 do
      play_pattern_timed [:e2, :g2, :b2, :e3], [0.5], release: 0.6, amp: 1.5
    end
    sleep 0.5
    sample :elec_blip2, rate: [0.5, 1, 1.5].choose, amp: 0.8
    sleep 0.5
  end
end

# Adding syncopated percussion for that dubstep feel
in_thread do
  sleep 24
  32.times do
    sample :bd_808, amp: 2
    sleep 0.5
    sample :elec_blip, rate: [0.5, 1, 1.5].choose, amp: 0.8
    sleep 0.5
    sample :elec_blip2, rate: [0.5, 1, 1.5].choose, amp: 0.8
    sleep 0.5
  end
end

# Second drop: Growling bass with glitchy rhythm
in_thread do
  sleep 40
  16.times do
    use_synth :fm
    with_fx :lpf, cutoff: 60 do
      play_pattern_timed [:e1, :g1, :b1, :d2], [0.5], release: 0.8, amp: 2
    end
    sleep 0.5
    sample :glitch_perc1, rate: 0.7, start: 0.2, finish: 0.3, amp: 0.7
    sleep 0.25
    sample :glitch_perc2, rate: 0.8, start: 0.3, finish: 0.4, amp: 0.7
    sleep 0.25
  end
end

# Growl bass with slow filter sweep in the background
in_thread do
  sleep 60
  use_synth :saw
  with_fx :lpf, cutoff: 40 do
    play_pattern_timed [:e1, :g1, :b1, :e2], [1], release: 1, amp: 1.8
  end
end

# Final drop: Full wobbles and percussion madness
in_thread do
  sleep 72
  32.times do
    sample :bd_808, amp: 2
    sleep 0.25
    sample :elec_blip, rate: [0.5, 1, 1.5].choose, amp: 1.2
    sleep 0.25
    sample :elec_blip2, rate: [0.5, 1, 1.5].choose, amp: 1.2
    sleep 0.25
    with_fx :wobble, depth: 0.9, phase: 0.25 do
      use_synth :tb303
      play_pattern_timed [:e2, :g2, :b2, :e3], [0.25], release: 0.4, amp: 1.8
    end
  end
end

# Outro: Slowing down with filter sweeps and fading bass
in_thread do
  sleep 104
  with_fx :level, amp: 0.4 do
    with_fx :reverb, room: 0.9 do
      with_fx :echo, decay: 3, phase: 0.75 do
        use_synth :blade
        play_pattern_timed [:e3, :g3, :b3, :d4, :e4], [1], release: 2
      end
    end
  end
  sleep 16
  use_synth :dark_ambience
  play_pattern_timed [:e3, :g3, :b3, :d4, :e4], [2], release: 4, amp: 0.3
end
