### FULL-TABLE TABLA MACHINE - FULL SET + TOGGLES + RANDOMIZER ###
use_bpm 2
time = 0.0045
set_volume! 2

#==========================================================================================
# TAB INPUTS (one line per tabla sample, with optional mode/probability)
# Modes:
#   [ x ] = always
#   [ - ] = never
#   [ R ] = random ~70% (per-beat)
#   [NN] = numeric line probability (whole line chance)
#   [bNN] = numeric per-beat probability
#==========================================================================================
tabs = "
[R] tabla_dhec:  | o - - - | o - - - |
[R] tabla_ghe1:  | - o - - | - o - - |
[R] tabla_ghe2:  | x x o x | x x o x |
[R] tabla_ghe3:  | o - o o | - - o o |
[R] tabla_ghe4:  | o o - - | o o - - |
[R] tabla_ghe5:  | - o o - | - o o - |
[R] tabla_ghe6:  | - - o o | - - o o |
[R] tabla_ghe7:  | o - o - | o - o - |
[R] tabla_ghe8:  | - o - o | - o - o |
[R] tabla_ke1:   | o - - o | o - - o |
[R] tabla_ke2:   | - o - o | - o - o |
[R] tabla_ke3:   | o o - - | o o - - |
[R] tabla_na:    | - - o - | - - o - |
[R] tabla_na_o:  | o - - - | o - - - |
[R] tabla_na_s:  | - o - - | - o - - |
[R] tabla_re:    | o - o - | o - o - |
[R] tabla_tas1:  | - o - o | - o - o |
[R] tabla_tas2:  | o - - o | o - - o |
[R] tabla_tas3:  | - - o - | - - o - |
[R] tabla_te1:   | o - o - | o - o - |
[R] tabla_te2:   | - o - o | - o - o |
[R] tabla_te_m:  | o o - - | o o - - |
[R] tabla_te_ne: | - - o o | - - o o |
[R] tabla_tun1:  | o - - - | o - - - |
[R] tabla_tun2:  | - o - - | - o - - |
[R] tabla_tun3:  | - - o - | - - o - |
"

#==========================================================================================
# SAMPLE MAPPING
#==========================================================================================
instruments = {}
tabs.lines.each do |line|
  next if line.strip.empty?
  # Extract mode (everything inside brackets)
  mode_match = line.match(/^\[(.+?)\]/)
  mode = mode_match ? mode_match[1] : 'x'
  content = line.sub(/^\[.+?\]/, '').strip
  name, pattern = content.split(':')
  name.strip!
  pattern = pattern.tr(' ', '') # remove spaces
  instruments[name] = { 'pattern' => pattern, 'sample' => name.to_sym, 'mode' => mode }
end

#==========================================================================================
# MACHINE CORE
#==========================================================================================
bars = [instruments]  # single bar object

#==========================================================================================
# LIVE LOOP WITH RANDOMIZER AND MODE/PROBABILITY TOGGLE
#==========================================================================================
live_loop :tabla_machine do
  bars.each do |bar|
    length = bar.first[1]['pattern'].length
    length.times do |n|
      bar.each do |key, info|
        note = info['pattern'][n]
        next if note == '-'
        mode = info['mode']
        
        case mode
        when 'x'
          sample info['sample']
        when '-'
          # do nothing
        when 'R'
          sample info['sample'] if rand < 0.7
        when /^b(\d+)$/
          pct = $1.to_f / 100.0
          sample info['sample'] if rand < pct
        else
          # numeric line probability
          pct = mode.to_f / 100.0
          if rand < pct
            sample info['sample']
          end
        end
        
        sleep time + 0.0001 # tiny stagger to avoid Sonic Pi overload
      end
    end
  end
end