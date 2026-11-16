# SPERMOLIO: metric chamber-folk / underwater crank-rap machine
# Sonic Pi 4.x
#
# This is a deliberately chaotic instrumental realization of the supplied
# direction. There is no voice synthesis here. The lyric text is segmented
# into phrase-sized metric units; a synthetic "mouth" line marks syllabic
# density, accents, rests, slides and sustained endings.
#
# Meter design:
#   Main cycle: 10 eighth-note slots grouped 4 + 3 + 3 (5/4)
#   Alternate slog: 5 quarter-note beats grouped 2 + 2 + 1
#   Tempo: 144 BPM quarter note; 10 eighth slots = 2.083 seconds.
#
# Chord spellings are the user's chord vocabulary:
#   Amin, Cmaj, Eb, Gbmin, C# major, Cm7.
# C# major is voiced enharmonically as Db-F-Ab for MIDI practicality.

use_bpm 144
use_random_seed (Time.now.to_f * 1000).to_i

# ---------- Chord vocabulary: exact supplied families ----------
define :voicing do |name|
  case name
  when :Amin   then [45, 48, 52, 57]       # A C E A
  when :Cmaj   then [48, 52, 55, 60]       # C E G C
  when :Eb     then [51, 55, 58, 63]       # Eb G Bb Eb
  when :Gbmin  then [42, 45, 49, 54]       # Gb A Db Gb
  when :Csharp then [49, 53, 56, 61]       # C# E# G# C#
  when :Cm7    then [48, 51, 55, 58]       # C Eb G Bb
  else [45, 48, 52, 57]
  end
end

define :root_of do |name|
  voicing(name)[0]
end

# ---------- Metric phrase cells ----------
# Each phrase is represented by 10 eighth-note slots.
# Numbers are relative syllabic events: 0=rest, 1=short, 2=normal,
# 3=stressed/clustered, 4=held syllable. This is a rhythmic proxy,
# not phonetic transcription or actual lyric playback.
#
# Phrase text is preserved as comments to make the mapping editable.
phrases = [
  # "Brings new meaning to the phrase I call shotgun!"
  {:text => "Brings new meaning to the phrase I call shotgun", :meter => [3,1,2,1,2,1,3,0,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Eb,:Amin], :color => :Gbmin},

  # "Ok... so back to liquefaction. They discovered benzine..."
  {:text => "Ok so back to liquefaction they discovered benzine because they happened to have the nozzle on the bottom of the compressor", :meter => [2,0,1,2,3,1,2,2,1,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Eb,:Gbmin], :color => :Csharp},

  # "Had it been on the top... they might've noticed a sloshing..."
  {:text => "Had it been on the top they might have noticed a sloshing and judiciously avoided it", :meter => [1,2,1,3,0,2,1,3,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Eb,:Eb], :color => :Eb},

  # "Wait. Are benzine and benzene different things?"
  {:text => "Wait are benzine and benzene different things", :meter => [3,0,2,1,3,1,2,0,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Eb,:Gbmin], :color => :Eb},

  # Portable oil gas pitch
  {:text => "So portable oil gas basically solves the problem have a nice country manner sick of all that whale oil boiling", :meter => [2,1,2,3,1,2,1,3,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Eb,:Gbmin], :color => :Csharp},

  # Victorian timing aside
  {:text => "Wait this was E flat three plus two beat so not Victorian yet I assume", :meter => [3,1,2,0,3,1,2,1,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Eb,:Csharp], :color => :Eb},

  # Country lord / whale oil
  {:text => "But presumably before it was commercialized the class conscious country lord actually was trying to boil whale oil at home", :meter => [1,2,1,2,3,1,2,1,3,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Eb,:Gbmin], :color => :Eb},

  # Compressed whale gas question
  {:text => "What was the advantage of compressed whale gas versus liquid whale head extraction", :meter => [3,1,2,1,3,1,2,1,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Eb,:Csharp], :color => :Cm7},

  # Spermaceti / spermolio
  {:text => "Spermaceti liquid whale head extraction spermolio tomato tomatalio", :meter => [3,1,2,2,3,1,2,1,3,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Eb,:Csharp], :color => :Amin},

  # Overlooked alternative
  {:text => "I think spermolio is a sadly overlooked alternative", :meter => [1,2,1,3,1,2,1,3,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Eb,:Csharp], :color => :Eb},

  # Whale carcass / melon tapping monologue
  {:text => "Sure beats the way we used to do it in my day dragging the whale carcass into the parlor in the morning go out on a fox hunt during the daylight hours to get out of the servant boys way while a crew of sixteen eight to twelve year olds performed the eight hour melon tapping procedure with time for smoke breaks come home light the whale spigot for a nice game of billiards wake up to whale stew in the morning just in time for the days carcass to arrive", :meter => [3,1,2,1,3,1,2,3,1,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Amin,:Gbmin], :color => :Cmaj},

  # Tobacco allowance / Swisher Sweets
  {:text => "Do not forget to budget for the boys smokes and Timmy likes his Swisher Sweets", :meter => [1,2,3,1,2,1,3,1,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Amin,:Csharp], :color => :Gbmin},

  # Lol, cheroot, tobacco
  {:text => "Lol cheroot that sounds familiar type of tobacco", :meter => [3,0,1,2,2,1,3,0,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Amin,:Csharp], :color => :Cm7},

  # Industrial-age dialogue
  {:text => "And too young to operate the lemonade stand pshaw this is the industrial age good sir no youth is too youth to feed into the gears what do you mistake us for Irish", :meter => [1,2,1,3,0,2,3,1,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Amin,:Eb], :color => :Amin},

  # Tobacco allowance / old stogies
  {:text => "Maybe we should cut the boys tobacco allowance let the younger ones fight over old stogies they have found short but not too big around builds character", :meter => [2,1,2,3,1,2,1,3,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Amin,:Amin], :color => :Csharp},

  # Timeline aside
  {:text => "I might be jumping ahead a bit in the timeline lyrically speaking", :meter => [1,2,1,3,1,2,0,2,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Amin,:Eb], :color => :Amin},

  # Boxcar William
  {:text => "That is Boxcar William to you", :meter => [3,1,2,0,3,1,2,0,2,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Amin,:Gbmin], :color => :Cmaj},

  # Final interruption
  {:text => "Do not make me have my", :meter => [1,2,3,1,2,1,3,0,0,4], :chords => [:Amin,:Cmaj,:Amin,:Eb,:Eb,:Eb,:Cmaj,:Cmaj,:Amin,:Csharp], :color => :Eb}
]

set :spermolio_phrases, phrases

# ---------- Shared clock ----------
# One cell is 10 eighths = five quarter-note beats.
# All parts advance by the same 5/4 cell, but use different internal accents.

# ---------- Felted-ish piano: actual piano synth, softened ----------
in_thread(name: :piano) do
  use_synth :piano
  with_fx :lpf, cutoff: 88 do
    with_fx :reverb, room: 0.78, mix: 0.30 do
      get(:spermolio_phrases).each_with_index do |ph, idx|
        # Main chord sequence from the supplied repeated cadence.
        ph[:chords].each_with_index do |ch, slot|
          ns = voicing(ch)
          # Chord attacks emphasize 4+3+3 group boundaries: 0, 4, 7.
          accent = [0,4,7].include?(slot) ? 0.68 : 0.40
          play_chord ns, attack: 0.015, sustain: (slot == 9 ? 0.9 : 0.34),
            release: 0.42, amp: accent
          sleep 0.5 # eighth-note slot
        end
        # Color chord from the annotation at phrase head, as a brief dissonant flare.
        play_chord voicing(ph[:color]), attack: 0.01, sustain: 0.12, release: 0.7, amp: 0.22
      end
    end
  end
end

# ---------- Vibraphone: Pachelbel-ish looping, altered on each return ----------
in_thread(name: :vibraphone) do
  use_synth :pretty_bell
  with_fx :reverb, room: 0.92, mix: 0.42 do
    get(:spermolio_phrases).each_with_index do |ph, idx|
      base = [74, 77, 79, 77, 74, 72, 70, 72]
      base.each_with_index do |n, i|
        # Refrain-like motif returns with changing emphasis and occasional mutation.
        n = n + choose([-2,0,0,2,5]) if one_in(4)
        amp = ([0,4,7].include?(i) ? 0.38 : 0.19)
        play n, release: (i == 7 ? 1.1 : 0.42), amp: amp
        sleep 0.625
      end
      sleep 0.0
    end
  end
end

# ---------- Singing saw: legato, unstable and slightly seasick ----------
in_thread(name: :singing_saw) do
  use_synth :saw
  with_fx :reverb, room: 0.96, mix: 0.48 do
    with_fx :echo, phase: 0.75, decay: 3.5, mix: 0.22 do
      get(:spermolio_phrases).each_with_index do |ph, idx|
        root = root_of(ph[:chords][0])
        line = [root + 19, root + 22, root + 24, root + 22, root + 19]
        line.each_with_index do |n, i|
          n = n + choose([-1,0,0,1]) if one_in(3)
          play n, attack: 0.20, sustain: (i == 4 ? 1.0 : 0.55),
            release: 0.9, cutoff: 78, amp: 0.13, slide: 0.18
          sleep 1
        end
      end
    end
  end
end

# ---------- Bagpipe-like underwater drone ----------
in_thread(name: :drone) do
  use_synth :hollow
  with_fx :lpf, cutoff: 58 do
    with_fx :reverb, room: 1, mix: 0.55 do
      get(:spermolio_phrases).each_with_index do |ph, idx|
        root = root_of(ph[:chords][0]) - 12
        play root, attack: 0.3, sustain: 3.8, release: 1.0, amp: 0.18
        play root + 7, attack: 0.4, sustain: 3.3, release: 0.9, amp: 0.09
        sleep 5
      end
    end
  end
end

# ---------- Jaw harp / osseophone: plunks, ticks, glitches ----------
in_thread(name: :osseophone) do
  use_synth :pluck
  with_fx :bitcrusher, bits: 5, sample_rate: 11025, mix: 0.28 do
    get(:spermolio_phrases).each_with_index do |ph, idx|
      10.times do |slot|
        density = ph[:meter][slot]
        if density >= 2 || one_in(3)
          n = root_of(ph[:chords][slot]) + choose([0, 7, 12, 19])
          play n, release: rrand(0.06, 0.22), amp: density == 3 ? 0.34 : 0.17
        end
        sleep 0.5
      end
    end
  end
end

# ---------- Percussion: 4+3+3 lilt, then 2+2+1 stomp ----------
in_thread(name: :percussion) do
  get(:spermolio_phrases).each_with_index do |ph, idx|
    # 10 eighth slots. Group accents at 0, 4, 7 = 4+3+3.
    10.times do |slot|
      if [0,4,7].include?(slot)
        sample :bd_haus, amp: slot == 0 ? 0.52 : 0.27
      elsif [2,6,9].include?(slot)
        sample :elec_tick, amp: 0.14, rate: 0.8
      end
      # Phrase-ending five-beat slog: stronger 2+2+1 accents.
      if idx % 4 == 3 && [0,4,8].include?(slot)
        sample :sn_dolf, amp: [0.26,0.20,0.34][[0,4,8].index(slot)]
      end
      sleep 0.5
    end
  end
end

# ---------- "Vocal" metric proxy: syllabic contour, not speech ----------
# Each lyric phrase becomes ten rhythmic units. Higher density produces
# more attacks; stress values alter accent and pitch; final unit is often held.
in_thread(name: :metric_vocal_proxy) do
  use_synth :tri
  with_fx :reverb, room: 0.55, mix: 0.20 do
    get(:spermolio_phrases).each_with_index do |ph, idx|
      base = root_of(ph[:chords][0]) + 24
      ph[:meter].each_with_index do |weight, slot|
        if weight > 0
          # Three neighboring pitches create a mumble-rap / declamatory contour.
          offset = case weight
                   when 1 then choose([0,2])
                   when 2 then choose([0,2,3,5])
                   when 3 then choose([0,5,7,10])
                   else choose([0,2,5,7])
                   end
          dur = weight == 4 ? 0.42 : (weight == 3 ? 0.20 : 0.12)
          play base + offset, attack: 0.015, sustain: dur,
            release: weight == 4 ? 0.48 : 0.12,
            amp: weight == 3 ? 0.32 : (weight == 4 ? 0.25 : 0.16),
            slide: weight == 4 ? 0.12 : 0.03
        end
        sleep 0.5
      end
    end
  end
end

# ---------- Performance note ----------
# The text strings in `phrases` are the lyric metric units. They are not
# spoken or sung by Sonic Pi. To add real voice later, record or import a
# vocal track and align its phrase attacks to the same 10-slot cells.
