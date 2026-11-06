# A Phrygian = mode derived from the third mode of the F Major
# scale and consists of the notes A, B♭, C, D, E, F, and G.

# Define a function for playing notes with counterpoint
define :play_counterpoint do |note1, note2, duration|
  scale_notes = scale(:A, :phrygian, num_octaves: 2)
  in_thread do
    play note1, sustain: duration
  end
  play note2, sustain: duration
end

# Define a function to get the A Phrygian scale
define :get_a_phrygian_scale do
  return scale(:A, :phrygian)
end

# Define a function to get the F maj scale
define :get_fmaj_scale do
  return scale(:F, :major)
end

# Function to create a chord from the Phrygian scale starting at a given degree
define :build_phrygian_chord do |phrygian_scale, start_degree|
  root_note = phrygian_scale[start_degree]
  third_note = phrygian_scale[(start_degree + 2) % phrygian_scale.size]
  fifth_note = phrygian_scale[(start_degree + 4) % phrygian_scale.size]
  seventh_note = phrygian_scale[(start_degree + 6) % phrygian_scale.size]
  return [root_note, third_note, fifth_note, seventh_note]
end

# Function to create a chord from the Phrygian scale starting at a given degree
define :build_fmaj_chord do |fmaj_scale, start_deg|
  root_note = fmaj_scale[start_deg]
  third_note = fmaj_scale[(start_deg + 2) % fmaj_scale.size]
  fifth_note = fmaj_scale[(start_deg + 4) % fmaj_scale.size]
  return [root_note, third_note, fifth_note]
end

# = = = = = = = = = = = =

play_chord chord(:F, :major)  # Plays an F major chord
sleep 1  # Adding a sleep to separate the chords

# This plays the first three notes of the A phrygian scale as a chord
play_chord (scale :A, :phrygian).take(3)
sleep 1

# This plays the first three notes of the A phrygian scale as a chord
play_chord (scale :A, :phrygian).take(3)

# Generate chords using the Phrygian mode
live_loop :phrygian_mode_chords do
  phrygian_scale_notes = get_a_phrygian_scale
  phrygian_scale_notes.size.times do |i|
    phrygian_chord = build_phrygian_chord(phrygian_scale_notes, i)
    play_chord phrygian_chord
    sleep 1
  end
end

# Generate chords using the Phrygian mode
live_loop :fmaj_chords do
  fmaj_scale_notes = get_fmaj_scale
  fmaj_scale_notes.size.times do |i|
    fmaj_chord = build_fmaj_chord(fmaj_scale_notes, i)
    play_chord fmaj_chord
    sleep 1
  end
end

# Play the fusion piece with counterpoint
live_loop :fusion_counterpoint do
  scale_notes = scale(:A, :phrygian, num_octaves: 2)
  4.times do
    play_counterpoint choose(scale_notes), choose(scale_notes), 0.5
    sleep 0.5
  end
end
