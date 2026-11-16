# HYPERFLIRT SAMPLE LIBRARY TEST BATCH
# Sonic Pi 4.5 / Sonic Pi 4.x
#
# Diagnostic pass: 30 distinct files selected randomly from Sonic Pi's
# own recursive sample_paths index. Each file gets exactly one short,
# unpitched sample fragment, followed by the cumulative tock counter.
#
# This is a separate test harness, not an alternate copy of the logo script.
# Run the whole buffer. Watch the log for the full path of every file tested.

BPM = 20
use_bpm BPM

LIBRARY_GLOB = "D:/HYPERFLIRT/**"
TEST_COUNT = 30
GROUP_SIZE = 5

SAMPLE_AMP = 0.60
SAMPLE_SUSTAIN = 0.05
SAMPLE_RELEASE = 0.03

COUNT_TICK_GAP = 0.04
COUNT_GROUP_GAP = 0.28
MARKER_GAP = 0.35

puts "Indexing Hyperflirt audio library..."
LIBRARY_PATHS = sample_paths(LIBRARY_GLOB)
puts "Sonic Pi indexed #{LIBRARY_PATHS.length} supported audio files."

if LIBRARY_PATHS.empty?
  puts "ERROR: Sonic Pi found no supported audio files. Nothing to audition."
else
  # Shuffle once and take a unique sample of the indexed library.
  TEST_PATHS = LIBRARY_PATHS.shuffle.take(TEST_COUNT)
  puts "Testing #{TEST_PATHS.length} distinct files, without replacement."
  puts "Each file contributes one short fragment."

  TEST_PATHS.each_with_index do |picked_path, offset|
    sample_number = offset + 1
    fragment_start = rrand(0.0, 0.75)
    fragment_finish = fragment_start + 0.20

    puts ""
    puts "SAMPLE #{sample_number}/#{TEST_PATHS.length}"
    puts "FILE: #{picked_path}"
    
    # One fragment from this file. No synth layer, no effects, no layering.
    sample picked_path,
      start: fragment_start,
      finish: fragment_finish,
      rate: 1,
      amp: SAMPLE_AMP,
      attack: 0.001,
      sustain: SAMPLE_SUSTAIN,
      release: SAMPLE_RELEASE

    # Let the short sample finish before its count marker.
    sleep 0.10

    # Cumulative tock count. Tenth and completed decades are accented.
    puts "COUNT #{sample_number}"
    use_synth :pluck

    if sample_number < 20
      sample_number.times do |i|
        if i == 9
          play 40, amp: 0.42, attack: 0.001, decay: 0.035,
            sustain: 0, release: 0.045, coef: 0.82
        else
          play 47, amp: 0.25, attack: 0.001, decay: 0.025,
            sustain: 0, release: 0.035, coef: 0.76
        end

        if i < sample_number - 1
          if (i + 1) % GROUP_SIZE == 0
            sleep COUNT_GROUP_GAP
          else
            sleep COUNT_TICK_GAP
          end
        end
      end
    else
      tens = sample_number / 10
      units = sample_number % 10

      tens.times do |i|
        play 40, amp: 0.42, attack: 0.001, decay: 0.035,
          sustain: 0, release: 0.045, coef: 0.82
        sleep COUNT_TICK_GAP if i < tens - 1
      end

      if units > 0
        sleep COUNT_GROUP_GAP
        units.times do |i|
          play 47, amp: 0.25, attack: 0.001, decay: 0.025,
            sustain: 0, release: 0.035, coef: 0.76

          if i < units - 1
            if (i + 1) % GROUP_SIZE == 0
              sleep COUNT_GROUP_GAP
            else
              sleep COUNT_TICK_GAP
            end
          end
        end
      end
    end

    sleep MARKER_GAP
  end

  puts ""
  puts "SAMPLE LIBRARY TEST COMPLETE."
  puts "Successfully scheduled #{TEST_PATHS.length} distinct file samples."
end
