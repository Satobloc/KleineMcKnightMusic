# HYPERFLIRT SAMPLE LIBRARY TEST BATCH
# Sonic Pi 4.5 / Sonic Pi 4.x
#
# Diagnostic pass: 10 distinct files selected randomly from Sonic Pi's
# recursive sample_paths index. Each file gets one longer excerpt, at
# normal playback speed and a useful audition level, followed by the
# cumulative tock counter.
#
# Preloads only this small test batch before playback to avoid first-use
# sample-loading delays during the timed sequence.
#
# This is a diagnostic harness, not an alternate copy of the logo script.

BPM = 20
use_bpm BPM

LIBRARY_GLOB = "D:/HYPERFLIRT/**"
TEST_COUNT = 10
GROUP_SIZE = 5

SAMPLE_AMP = 1.0
SAMPLE_SUSTAIN = 0.55
SAMPLE_RELEASE = 0.05
SAMPLE_WAIT = 0.65

COUNT_TICK_GAP = 0.08
COUNT_GROUP_GAP = 0.35
MARKER_GAP = 0.25

puts "Indexing Hyperflirt audio library..."
LIBRARY_PATHS = sample_paths(LIBRARY_GLOB)
puts "Sonic Pi indexed #{LIBRARY_PATHS.length} supported audio files."

if LIBRARY_PATHS.empty?
  puts "ERROR: Sonic Pi found no supported audio files. Nothing to audition."
else
  TEST_PATHS = LIBRARY_PATHS.shuffle.take(TEST_COUNT)
  puts "Selected #{TEST_PATHS.length} distinct files, without replacement."
  puts "Preloading this small batch. Please wait..."

  load_samples TEST_PATHS
  sleep 2

  puts "Preload complete. Beginning audition."

  TEST_PATHS.each_with_index do |picked_path, offset|
    sample_number = offset + 1
    fragment_start = rrand(0.0, 0.70)
    fragment_finish = fragment_start + 0.25

    puts ""
    puts "SAMPLE #{sample_number}/#{TEST_PATHS.length}"
    puts "FILE: #{picked_path}"
    puts "Playing up to 1.8 seconds at normal speed."

    # A 0.60-beat envelope at 20 BPM is 1.8 seconds.
    # No FX, synth layers, or playback-rate changes.
    sample picked_path,
      start: fragment_start,
      finish: fragment_finish,
      rate: 1,
      amp: SAMPLE_AMP,
      attack: 0.01,
      sustain: SAMPLE_SUSTAIN,
      release: SAMPLE_RELEASE

    # Allow the sample envelope to finish before the counter begins.
    sleep SAMPLE_WAIT

    puts "COUNT #{sample_number}"
    use_synth :pluck

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

    sleep MARKER_GAP
  end

  puts ""
  puts "SAMPLE LIBRARY TEST COMPLETE."
  puts "Ten distinct file samples were scheduled for audition."
end
