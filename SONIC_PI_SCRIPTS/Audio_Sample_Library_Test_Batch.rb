# HYPERFLIRT SAMPLE CHARACTER SURVEY
# Sonic Pi 4.5 / Sonic Pi 4.x
#
# A listening pass: 12 distinct files selected across library folders.
# It first takes one random file from each available folder group, then
# fills any remaining slots from the unselected library. This reduces the
# chance that one genre or directory dominates a survey by accident.
# Each file gets one unpitched excerpt, followed by the cumulative tock.
#
# Preloads only this small batch before playback.
# No effects, synth layers, or playback-rate changes.

BPM = 20
use_bpm BPM

LIBRARY_GLOB = "D:/HYPERFLIRT/**"
TEST_COUNT = 12
GROUP_SIZE = 5

SAMPLE_AMP = 1.0
SAMPLE_SUSTAIN = 1.20
SAMPLE_RELEASE = 0.10
SAMPLE_WAIT = 1.40

COUNT_TICK_GAP = 0.08
COUNT_GROUP_GAP = 0.35
MARKER_GAP = 0.25

puts "Indexing Hyperflirt audio library..."
LIBRARY_PATHS = sample_paths(LIBRARY_GLOB)
puts "Sonic Pi indexed #{LIBRARY_PATHS.length} supported audio files."

if LIBRARY_PATHS.empty?
  puts "ERROR: Sonic Pi found no supported audio files. Nothing to audition."
else
  # Group by the first folder below the library's immediate category folder.
  # For example, WORLD and ELECTRONIC remain separate survey pools.
  folder_groups = LIBRARY_PATHS.group_by do |path|
    parts = path.split("/")
    parts.length > 4 ? parts[0..3].join("/") : parts[0..-2].join("/")
  end

  folder_firsts = folder_groups.values.map { |paths| paths.choose }
  diversified = folder_firsts.shuffle
  remaining = LIBRARY_PATHS - diversified
  TEST_PATHS = (diversified + remaining.shuffle).take(TEST_COUNT)

  puts "Selected #{TEST_PATHS.length} distinct files, without replacement."
  puts "Folder groups represented: #{[folder_groups.length, TEST_COUNT].min}."
  puts "Preloading this small batch. Please wait..."

  load_samples TEST_PATHS
  sleep 2

  puts "Preload complete. Beginning character survey."

  TEST_PATHS.each_with_index do |picked_path, offset|
    sample_number = offset + 1
    fragment_start = rrand(0.0, 0.50)
    fragment_finish = fragment_start + 0.35

    puts ""
    short_name = picked_path.split("/").last
    puts "=============================================="
    puts "SAMPLE ID: #{sample_number}"
    puts "FILENAME: #{short_name}"
    puts "FOLDER: #{picked_path.split("/")[0..-2].last}"
    puts "FULL PATH: #{picked_path}"
    puts "=============================================="
    puts "AUDITION: #{sample_number} | #{short_name}"
    puts "Playing an excerpt of up to about 4 seconds at normal speed."

    # At 20 BPM, 1.20 beats sustain + 0.10 beats release = 3.9 seconds.
    sample picked_path,
      start: fragment_start,
      finish: fragment_finish,
      rate: 1,
      amp: SAMPLE_AMP,
      attack: 0.01,
      sustain: SAMPLE_SUSTAIN,
      release: SAMPLE_RELEASE

    # Let the excerpt finish before the counter begins.
    sleep SAMPLE_WAIT

    puts "TOCKER #{sample_number}"
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
  puts "CHARACTER SURVEY COMPLETE."
  puts "For favourites, note SAMPLE ID and FILENAME from the log."
  puts "Scheduled #{TEST_PATHS.length} distinct file samples."
end
