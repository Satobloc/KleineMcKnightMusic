use_bpm 30

live_loop :wump do
  with_fx :flanger, bits: [0.7, 0.1].choose, sample_rate: 10 do
    with_fx :band_eq, bits: 8, sample_rate: [300, 1000].choose do
      use_synth	:dull_bell #
      play_pattern_timed [:e4, :b4, :g3, :b3], [1, 1.5].choose, release: 0.3, amp: 0.2, attack: 0.1
      sleep 1
    end
  end
end


live_loop :sleety do
  with_fx :flanger, bits: 8, sample_rate: [0.44, 10, 0.9].choose do
    with_fx :echo, bits: 8, sample_rate: [0.44, 10, 0.9].choose do
      use_synth	:tri  #
      play_pattern_timed [:e2, :b2, :g2, :e2], [0.25, 0.5, 0.25, 1], release: 0.25, amp: 0.2
      sleep [0.5, 0.25].choose
    end
  end
end

live_loop :chug do
  with_fx :mono, bits: 0.2, sample_rate: 200 do
    in_thread do
      with_fx :flanger, bits: 8, sample_rate: [0.44, 10, 0.9].choose do
        with_fx :echo, bits: 8, sample_rate: 10 do
          sample :elec_wood
          sleep [0.25, 0.15, 8].choose
          sample :drum_bass_hard
          layer :dark_ambience, [:g2, :e3], 6, amp: 0.25
        end
      end
    end
    play_pattern_timed [:e2, :b2], [1, 1.5, 0.3].choose, release: 1, amp: 0.25
    sleep [1, 4].choose
  end
end

live_loop :ticka do
  with_fx :echo, bits: 0.2, sample_rate: 200 do
    in_thread do
      sample :elec_lo_snare
      sleep [0.125, 0.5].choose
      sample :elec_chime
      sleep [0.125, 0.5].choose
      layer :pretty_bell, [:g2, :e3], 6, amp: 0.25
    end
    play_pattern_timed [:e2, :b2], [1, 1.5, 0.15].choose, release: 1, amp: 0.2
    sleep [1, 4].choose
  end
end

live_loop :weouw do
  sleep [8, 12].choose
  with_fx :flanger, bits: [0.7, 0.1, 2].choose, sample_rate: 10 do
    with_fx :band_eq, bits: 8, sample_rate: [1, 0.9].choose do
      use_synth	:dull_bell #
      play_pattern_timed [:e4, :b4, :g3, :b3, :B2], [4, 6].choose, release: 0.3, amp: 0.2, attack: 0.1
      play_pattern_timed [:b4, :g4, :e4, :g3, :b3], [2, 8].choose, release: 0.3, amp: 0.2, attack: 0.1
    end
  end
end
