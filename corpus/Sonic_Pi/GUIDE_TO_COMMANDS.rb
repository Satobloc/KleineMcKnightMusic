#Sonic Pi Command List
#Copy and Paste from this command list into your sonic pi file

#Use the command play to play a note using the default synth
#play  note (symbol_or_number)
#Usage:
play 60 #midinote 60 or middle c
play :c4 #create a symbol by typing colon then the note name and an octave designation
play :e5, release: 2, amp: 0.5 #you can add parameters as well

#Use the command sleep to wait before executing the next command
#sleep  beats (number)
#Usage:
sleep 1 #wait for 1 beat before executing the next command (quarter note in 4/4)
sleep 0.5 #wait for half a beat (eighth note in 4/4)
sleep 0.25 #wait for a quarter of a beat (sixteenth note in 4/4)

#use the sample command to play back some recorded audio
#sample  name_or_path (symbol_or_string)
#Usage:
sample :drum_bass_hard, rate: 0.5 #play the sample at half speed (pitch drops by an octave)
sample :drum_bass_hard, rate: -1 #play the sample backwards!

#Use the live_loop to loop a bit of code over and over, redefine it as many times as you want and it automatically updates
#live_loop  name (symbol)
#Usage:
live_loop :loop do
  sample :loop_amen
  sleep sample_duration :loop_amen #use to return the length of the specified sample
end

#Change the synth currently in use with the use_synth command
#use_synth  synth_name (symbol)
#Usage:
use_synth :dark_ambience
play :d2, attack: 2, release: 4

#use the chord command to play a chord
#chord  tonic (symbol), name (symbol)
#Usage:
play chord :c3, :minor7
sleep 2
play chord :g3, :dom7

#scale  tonic (symbol), name (symbol)
#Usage:
live_loop :scale do
  play (scale :a3, :hungarian_minor).tick
  sleep 1
end

#wrap some code in a special effect like reverb, echo, distortion, etc
#with_fx  fx_name (symbol)
#Usage:
live_loop :drums do
  with_fx :distortion, distort: 0.9 do
    sample :loop_amen
    sleep sample_duration :loop_amen
  end
end

#create a function with the define command to wrap some code into a name you can refer to
#define  name (symbol)
#Usage:
define :foo do #create function foo which plays back note 50 and waits for 1 beat
  play 50
  sleep 1
end

foo

#use a conditional like one_in to let Sonic Pi flip a coin and choose which code to execut
#one_in  num (number)
#Returns true or false with a specified probability - it will return true every one in num times where num is the param you specify
#Usage:
live_loop :condition do
  if one_in 2
    play 60 #if one_in returns true, play 60
  else
    play 72 #else if one_in returns false, play 72
  end
  sleep 1
end

#ring is a list that wraps back from the end to the beginning
#Usage:
(ring 0.25, 0.5, 1, 2)
#if you use the command .tick on a ring it will keep playing from the end to the beginning
live_loop :mel do
  use_synth :piano
  play (ring :c4, :g4, :e4, :a4, :d4, :b4).choose
  sleep (ring 0.25, 0.5, 0.75).tick
end

#live_audio enables you to use your built-in microphone with Sonic Pi effects
#Important! Run this with headphones plugged in
with_fx :reverb, room: 1 do
  with_fx :echo, phase: 0.5, decay: 6 do
    live_audio :voice
  end
end
#if you have to stop an instance of live_audio you can use the parameter :stop
live_audio :voice, :stop