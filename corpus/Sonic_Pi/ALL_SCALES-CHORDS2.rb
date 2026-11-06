use_bpm 90

# Define a list of scales
scales = [:acem_asiran, :acem_kurdi, :acemli_rast, :aeolian, :ahirbhairav, :augmented, :augmented2, :bartok, :bayati, :bayati_2, :bayati_araban, :bestenigar, :bhairav, :blues_major, :blues_minor, :buselik, :buselik_2, :cargah, :chinese, :chromatic, :diatonic, :diminished, :diminished2, :dorian, :dugah, :dugah_2, :egyptian, :enigmatic, :evcara, :evcara_2, :evcara_3, :evcara_4, :evic, :evic_2, :ferahfeza, :ferahfeza_2, :ferahnak, :gong, :gulizar, :harmonic_major, :harmonic_minor, :hex_aeolian, :hex_dorian, :hex_major6, :hex_major7, :hex_phrygian, :hex_sus, :hicaz, :hicaz_2, :hicaz_humayun, :hicaz_humayun_2, :hicazkar, :hicazkar_2, :hindu, :hirajoshi, :hungarian_minor, :huseyni, :huseyni_2, :huzzam, :huzzam_2, :indian, :ionian, :isfahan, :isfahan_2, :iwato, :jiao, :karcigar, :kumoi, :kurdi, :kurdili_hicazkar, :kurdili_hicazkar_2, :kurdili_hicazkar_3, :kurdili_hicazkar_4, :kurdili_hicazkar_5, :leading_whole, :locrian, :locrian_major, :lydian, :lydian_minor, :mahur, :major, :major_pentatonic, :marva, :melodic_major, :melodic_minor, :melodic_minor_asc, :melodic_minor_desc, :messiaen1, :messiaen2, :messiaen3, :messiaen4, :messiaen5, :messiaen6, :messiaen7, :minor, :minor_pentatonic, :mixolydian, :muhayyer, :neapolitan_major, :neapolitan_minor, :neva, :neva_2, :nihavend, :nihavend_2, :octatonic, :pelog, :phrygian, :prometheus, :purvi, :rast, :ritusen, :romanian_minor, :saba, :scriabin, :sedaraban, :sedaraban_2, :segah, :segah_2, :sehnaz, :sehnaz_2, :sehnaz_3, :sehnaz_4, :sevkefza, :sevkefza_2, :sevkefza_3, :shang, :spanish, :sultani_yegah, :sultani_yegah_2, :super_locrian, :suzidil, :suzidil_2, :suznak, :suznak_2, :tahir, :tahir_2, :todi, :ussak, :uzzal, :uzzal_2, :whole, :whole_tone, :yegah, :yegah_2, :yu, :zhi, :zirguleli_hicaz, :zirguleli_hicaz_2, :zirguleli_suznak, :zirguleli_suznak_2, :zirguleli_suznak_3]
chords = ["+5", "1", "11", "11+", "13", "5", "6", "6*9", "7", "7+5", "7+5-9", "7-10", "7-11", "7-13", "7-5", "7-9", "7sus2", "7sus4", "9", "9+5", "9sus4", "M", "M7", "a", "add11", "add13", "add2", "add4", "add9", "augmented", "dim", "dim7", "diminished", "diminished7", "dom7", "halfdim", "halfdiminished", "i", "i7", "m", "m+5", "m11", "m11+", "m13", "m6", "m6*9", "m7", "m7+5", "m7+5-9", "m7+9", "m7-5", "m7-9", "m7b5", "m9", "m9+5", "madd11", "madd13", "madd2", "madd4", "madd9", "maj", "maj11", "maj9", "major", "major7", "min", "minor", "minor7", "sus2", "sus4"]

live_loop :chord_and_arpeggio do
  # Choose a random scale
  scale_name = scales.choose
  root_note = [:a4,:b4,:c4,:d4,:e4,:f4,:g4].choose  # You can change this to any root note you'd like
  chord_name = chords.choose
  
  
  # Define the chord and scale
  scale_notes = scale(root_note, scale_name)
  chord_notes = chord(root_note, chord_name)  # You can change this to any chord type you'd like
  
  
  # Play and arpeggiate the chord with the :pluck synth
  with_fx :reverb, mix: 0.3 do
    6.times do
      synth :beep, note: chord_notes, sustain: 6, release: 2, attack_level: 4
      play_pattern [scale_notes.choose,scale_notes.choose,scale_notes.choose,scale_notes.choose,scale_notes.choose,scale_notes.choose,scale_notes.choose], synth: :pluck, release: 1
      sleep 0.25
    end
  end
  
  sleep 0.5  # Duration of the loop
end
