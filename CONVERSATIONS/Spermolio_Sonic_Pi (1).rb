# SPERMOLIO: a Sonic Pi arrangement sketch
# Written for Sonic Pi 4.x
#
# 144 BPM / 4-beat harmonic bars, with a loping 3+2 accent figure
# and occasional 5-beat ostinato phrases crossing the bar line.
#
# This is an instrumental reconstruction, not a transcription of Suno's
# audio. It uses a chamber-folk palette and the lyric prompt's chord colors.
# The actual female vocal is intentionally left open for live performance.

use_bpm 144
use_random_seed 1975

# ---------- Arrangement map ----------
# 124 bars x 4 beats at 144 BPM ~= 3:26.7
sections = [
  [:intro, 8],
  [:verse, 16],
  [:hook, 8],
  [:verse, 16],
  [:bridge, 12],
  [:verse, 16],
  [:hook, 8],
  [:breakdown, 8],
  [:final, 24],
  [:outro, 8]
]

define :section_at do |bar|
  return :intro if bar < 8
  return :verse if bar < 24
  return :hook if bar < 32
  return :verse if bar < 48
  return :bridge if bar < 60
  return :verse if bar < 76
  return :hook if bar < 84
  return :breakdown if bar < 92
  return :final if bar < 116
  :outro
end

# ---------- Harmonic vocabulary ----------
# MIDI note voicings. Eb/Bb/Cm/Ab are the main home territory;
# F7 and Gm add motion; Gbmin, C# and Amin/Cmaj are chromatic color.
chords = {
  :Ebmaj7 => [51, 55, 58, 62],  # Eb G Bb D
  :Bbmaj7 => [46, 50, 53, 57],  # Bb D F A
  :Cm7    => [48, 51, 55, 58],  # C Eb G Bb
  :Abmaj7 => [44, 48, 51, 55],  # Ab C Eb G
  :F7     => [41, 45, 48, 51],  # F A C Eb
  :Gm7    => [43, 46, 50, 53],  # G Bb D F
  :Gbmin  => [42, 45, 49, 52],  # Gb A Db E
  :Dbmaj  => [49, 53, 56, 60],  # Db F Ab C
  :Amin   => [45, 48, 52, 55],  # A C E G
  :Cmaj   => [48, 52, 55, 59]   # C E G B
}

home_progression = [:Ebmaj7, :Bbmaj7, :Cm7, :Abmaj7]
verse_progression = [:Ebmaj7, :Cm7, :Abmaj7, :Bbmaj7]
hook_progression = [:Abmaj7, :Bbmaj7, :Ebmaj7, :Cm7]
bridge_progression = [:Amin, :Dbmaj, :Gbmin, :F7, :Cm7, :Bbmaj7]

# ---------- Reusable musical gestures ----------
define :section_chord do |section, bar|
  case section
  when :intro
    [:Ebmaj7, :Bbmaj7, :Cm7, :Abmaj7][bar % 4]
  when :verse
    [:Ebmaj7, :Cm7, :Abmaj7, :Bbmaj7][(bar / 2) % 4]
  when :hook
    [:Abmaj7, :Bbmaj7, :Ebmaj7, :Cm7][(bar / 2) % 4]
  when :bridge
    [:Amin, :Dbmaj, :Gbmin, :F7, :Cm7, :Bbmaj7][(bar / 2) % 6]
  when :breakdown
    [:Cm7, :Abmaj7, :Gbmin, :F7][(bar / 2) % 4]
  when :final
    (bar % 6 == 4) ? :Dbmaj : [:Abmaj7, :Bbmaj7, :Ebmaj7, :Cm7][(bar / 2) % 4]
  else
    [:Ebmaj7, :Bbmaj7, :Cm7, :Abmaj7][bar % 4]
  end
end

# ---------- Felted piano: harmonic bed ----------
in_thread(name: :felted_piano) do
  with_fx :reverb, room: 0.78, mix: 0.28 do
    with_fx :lpf, cutoff: 94 do
      124.times do |bar|
        section = section_at(bar)
        chord_name = section_chord(section, bar)
        amp = (section == :intro || section == :outro) ? 0.42 : 0.62
        use_synth :piano
        if section == :breakdown
          play_chord chords[chord_name], attack: 0.08, sustain: 3.5, release: 1.2, amp: 0.38
          sleep 4
        else
          play_chord chords[chord_name], attack: 0.015, sustain: 2.4, release: 1.25, amp: amp
          # A soft off-beat answer gives the harmony its loping sway.
          sleep 2.5
          play_chord chords[chord_name].drop(1), attack: 0.01, sustain: 0.65, release: 0.8, amp: amp * 0.42
          sleep 1.5
        end
      end
    end
  end
end

# ---------- Low bass: sturdy pulse with a five-beat shadow ----------
in_thread(name: :upright_bass) do
  use_synth :pluck
  with_fx :reverb, room: 0.45, mix: 0.16 do
    124.times do |bar|
      section = section_at(bar)
      chord_name = section_chord(section, bar)
      root = chords[chord_name][0] - 12
      if section == :intro || section == :outro
        play root, release: 1.4, amp: 0.55
        sleep 2
        play root + 7, release: 0.8, amp: 0.28
        sleep 2
      elsif section == :breakdown
        play root, release: 2.2, amp: 0.48
        sleep 4
      else
        # Four-on-the-floor is avoided: bass accents 1, the late 3, and 4.
        play root, release: 0.65, amp: 0.78
        sleep 1.5
        sleep 0.5
        play root + 7, release: 0.35, amp: 0.40
        sleep 1
        play root + 12, release: 0.5, amp: 0.54
        sleep 1
      end
    end
  end
end

# ---------- Vibraphone: the sticky, circular earworm ----------
in_thread(name: :vibraphone_hook) do
  use_synth :pretty_bell
  with_fx :reverb, room: 0.88, mix: 0.38 do
    124.times do |bar|
      section = section_at(bar)
      if [:hook, :final].include?(section)
        motif = [74, 77, 79, 77, 74, 70, 72, 74]
        motif.each_with_index do |n, i|
          play n, release: 0.42, amp: (i == 0 || i == 4) ? 0.48 : 0.27
          sleep 0.5
        end
      elsif section == :intro || section == :outro
        [74, 77, 79, 77].each do |n|
          play n, release: 0.9, amp: 0.25
          sleep 1
        end
      else
        [74, 77, 79, 82].each_with_index do |n, i|
          play n, release: 0.55, amp: 0.14
          sleep 1
        end
      end
    end
  end
end

# ---------- Singing-saw line: slow bends and suspended notes ----------
in_thread(name: :singing_saw) do
  use_synth :saw
  with_fx :reverb, room: 0.95, mix: 0.42 do
    with_fx :echo, phase: 0.75, decay: 3, mix: 0.18 do
      124.times do |bar|
        section = section_at(bar)
        if [:intro, :bridge, :breakdown, :final, :outro].include?(section)
          notes = (section == :bridge) ? [68, 70, 73, 72] : [67, 70, 74, 72]
          notes.each do |n|
            play n, attack: 0.35, sustain: 0.9, release: 1.0, cutoff: 78, amp: 0.19
            sleep 1
          end
        else
          play 70, attack: 0.25, sustain: 2.2, release: 0.8, cutoff: 76, amp: 0.12
          sleep 4
        end
      end
    end
  end
end

# ---------- Percussion: brushed, lopsided chamber-folk swagger ----------
in_thread(name: :percussion) do
  124.times do |bar|
    section = section_at(bar)
    if section == :intro || section == :outro
      sample :elec_tick, amp: 0.18, rate: 0.65
      sleep 2
      sample :elec_tick, amp: 0.12, rate: 0.85
      sleep 2
    elsif section == :breakdown
      # Leave the center exposed; only a faint pulse remains.
      sample :elec_tick, amp: 0.10, rate: 0.55
      sleep 4
    else
      # 3+2 accents represented as uneven eighth-note groupings:
      # three eighths, then two eighths, then three eighths.
      # This totals one 4/4 bar while giving the bar a lopsided gait.
      sample :bd_haus, amp: 0.48
      sleep 1.5
      sample :elec_tick, amp: 0.16, rate: 0.8
      sleep 1
      sample :elec_tick, amp: 0.13, rate: 0.7
      sleep 1
      sample :sn_dolf, amp: 0.24
      sleep 0.5
      sample :elec_tick, amp: 0.16, rate: 0.9
    end
  end
end

# ---------- Optional vocal-shaped instrumental answer ----------
# A short, sliding monophonic figure leaves room for the actual voice.
in_thread(name: :vocal_shadow) do
  use_synth :tri
  with_fx :reverb, room: 0.72, mix: 0.25 do
    124.times do |bar|
      section = section_at(bar)
      if [:verse, :hook, :final].include?(section)
        phrase = (section == :hook) ? [72, 74, 77, 74] : [70, 72, 74, 72]
        phrase.each_with_index do |n, i|
          play n, attack: 0.025, sustain: 0.12, release: 0.28,
            amp: 0.12, cutoff: 88, slide: 0.08
          sleep (i == 2 ? 1.0 : 0.75)
        end
        sleep 1
      else
        sleep 4
      end
    end
  end
end

# Keep the main thread alive for the full arrangement.
sleep 124 * 4
