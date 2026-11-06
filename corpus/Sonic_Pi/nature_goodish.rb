# Sonic Pi Script reworked to evoke 'Finally We Are No One' by Múm
# Using only nature sounds with soft ambient textures and minimalistic melodic variations

nature_path = "C:/Users/Admin/Music/SONIC PI SCRIPTS/NAUTRE_SOUNDS/"

# Helper function to play nature sound with varying pitch
define :play_nature_sound do |file, rate=1, dur=16|
  sample nature_path + file, rate: rate, sustain: dur if sample_loaded?(nature_path + file)
end

# Load all nature sounds
nature_sounds = [
  "avala-trail-forest-nature-246779.mp3",
  "bird-nature-sound-33-20953.mp3",
  "flowing-water-246403.mp3",
  "footsteps-in-water-nature-sounds-8185.mp3",
  "footsteps-on-nature-trail-246038.mp3",
  "heavy-rain-nature-sounds-8186.mp3",
  "nature-sound-near-river-or-waterfall-247409.mp3",
  "nature-sounds-240504.mp3",
  "quiet-nature-sounds-29791.mp3",
  "rain-sound-nature-sound-242838.mp3",
  "serbia-nature-sounds-245993.mp3",
  "sound-of-nature-deep-in-the-forests-10635.mp3",
  "thunder-245174.mp3"
]

# Preload all samples
nature_sounds.each do |sound|
  load_sample nature_path + sound
end

# Tempo for a flowing, organic feel
use_bpm 45

# Create a soft, evolving ambient soundscape
with_fx :reverb, room: 0.9, mix: 0.5 do
  live_loop :ambient_background do
    # Start with quiet, subtle sounds to build atmosphere
    play_nature_sound "quiet-nature-sounds-29791.mp3"
    sleep 8
    play_nature_sound "flowing-water-246403.mp3"
    sleep 16
  end
end

# Gentle rain with subtle delay for texture
with_fx :echo, phase: 1, decay: 4 do
  live_loop :rain do
    play_nature_sound "rain-sound-nature-sound-242838.mp3"
    sleep 16
  end
end

# Delicate footsteps as rhythmic and melodic elements, using pitch shifts
live_loop :melodic_footsteps do
  with_fx :reverb, room: 0.8, mix: 0.6 do
    sample nature_path + "footsteps-on-nature-trail-246038.mp3", rate: 1.3, sustain: 2
    sleep 2
    sample nature_path + "footsteps-in-water-nature-sounds-8185.mp3", rate: 0.9, sustain: 2
    sleep 2
    sample nature_path + "footsteps-in-water-nature-sounds-8185.mp3", rate: 1.1, sustain: 2
    sleep 2
  end
end

# Birdsong with soft pitch variations to create a nostalgic, playful melody
live_loop :bird_melody do
  with_fx :lpf, cutoff: 90 do  # Use low-pass filter to soften the sound
    sample nature_path + "bird-nature-sound-33-20953.mp3", rate: 1.4, finish: 0.3, sustain: 4
    sleep 4
    sample nature_path + "bird-nature-sound-33-20953.mp3", rate: 1.1, finish: 0.5, sustain: 4
    sleep 4
    sample nature_path + "bird-nature-sound-33-20953.mp3", rate: 0.9, finish: 0.4, sustain: 4
    sleep 4
  end
end

# Thunder rumbling in the distance for a dreamy, otherworldly atmosphere
live_loop :thunder do
  sleep 32  # Let the ambient scene build
  with_fx :echo, phase: 1.5, decay: 6 do
    sample nature_path + "thunder-245174.mp3", rate: 0.7, start: 0.5, sustain: 16
    sleep 16
  end
end
