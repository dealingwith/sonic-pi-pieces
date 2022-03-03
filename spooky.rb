i = 1
p = -0.5
o = 0
going_up = true

live_loop :rise do
  sleep 0.5
  if i >= 2.5
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
  with_fx :bitcrusher do
    with_fx :echo do
      sample :loop_weirdo, onset: o, amp: i, pan: p
    end
  end
  ##| sample :loop_electric, onset: o, amp: i, pan: -p
  
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
  sample :drum_bass_hard, amp: 0.25
  sample :drum_cymbal_soft, amp: 0.25
  sleep 0.25
  sample :drum_bass_hard, amp: 0.25
  sleep 0.25
  sample :drum_cymbal_soft, amp: 0.25
  sample :drum_snare_hard, amp: 0.25
  sleep 0.499 # less than 0.5 !
end

live_loop :ambient, sync: :rise do
  with_fx :echo do
    sample :ambi_dark_woosh, amp: 1, attack: 0.5, release: 4
  end
  sleep 8
end

live_loop :spooky, sync: :rise do
  with_fx :bitcrusher do
    sample :ambi_haunted_hum, amp: 2, attack: 0.5, release: 0.5
  end
  sleep 16
end
