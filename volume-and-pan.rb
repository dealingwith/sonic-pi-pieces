i = 0.5
p = -0.5
o = 0
going_up = true

live_loop :rise do
  sleep 0.5
  if i >= 2
    i = 2
    p = 1
    going_up = false
  elsif i <= 0.5
    i = 0.5
    p = -0.5
    going_up = true
  end
  
  puts "amp: #{i}"
  puts "pan: #{p}"
  puts "offset: #{o}"
  
  sample :guit_em9, onset: o, amp: i, pan: p
  sample :loop_electric, onset: o, amp: i, pan: -p
  
  if going_up
    i += 0.5
    p += 0.5
  else
    i -= 0.5
    p -= 0.5
  end
  
  if o > 3
    o = 0
  else
    o += 1
  end
  
end

live_loop :hits_hats, sync: :rise do
  with_fx :bpf do
    sample :drum_bass_hard
    sample :drum_cymbal_soft
    sleep 0.25
    sample :drum_bass_hard
    sleep 0.25
    sample :drum_cymbal_soft
    sample :drum_snare_hard
    sleep 0.499 # less than 0.5 !
  end
end

##| live_loop :ambient, sync: :rise do
##|   with_fx :echo do
##|     sample :ambi_choir, attack: 2, release: 4
##|   end
##|   sleep 4
##| end
