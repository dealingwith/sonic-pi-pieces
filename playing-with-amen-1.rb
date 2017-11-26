use_bpm 120

live_loop :drumloop do
  sample :loop_amen, beat_stretch: 4
  sleep 4
end

live_loop :bassline do
  sync :drumloop
  sample :bass_dnb_f, amp: 1.5, attack: 1, sustain: 1
  sleep 1
end

live_loop :snare2 do
  sync :drumloop
  sleep 2.5
  with_fx :bitcrusher do
    with_fx :reverb do
      sample :sn_zome, pan: -1, amp: 0.6
      sleep 1
      with_fx :whammy do
        sample :sn_dolf, pan: 1, amp: 0.5
      end
    end
  end
end

live_loop :chord do
  sync :drumloop
  synth :growl
  sleep 0.5
  with_fx :reverb do
    with_fx :flanger do
      play (chord :C, :minor7), attack: 1, sustain: 2.5, amp: 0.3
    end
  end
end

live_loop :littesounds do
  sync :drumloop
  sleep 1.5
  use_synth :piano
  with_fx :reverb do
    with_fx :slicer do
      play :C, pan: -1, decay: 0.1, amp: 0.5, attack: 0.1, sustain: 0.1
      sleep 0.25
      play :F, pan: 1, decay: 0.1, amp: 0.55, attack: 0.1, sustain: 0.1
      sleep 0.25
      play :C, pan: -1, decay: 0.1, amp: 0.6, attack: 0.1, sustain: 0.1
    end
  end
  sleep 2
end

live_loop :moreperc do
  sync :drumloop
  sleep 2
  with_fx :reverb do
    with_fx :slicer do
      sample :drum_splash_soft, pan: -1, decay: 0.1, amp: 0.5, attack: 0.1, sustain: 0.1
      sleep 0.25
      sample :drum_splash_soft, pan: 1, decay: 0.1, amp: 0.55, attack: 0.1, sustain: 0.1
      sleep 0.25
      sample :drum_splash_soft, pan: -1, decay: 0.1, amp: 0.6, attack: 0.1, sustain: 0.1
    end
  end
  sleep 1.5
end

live_loop :something do
  sync :drumloop
  sleep 4
  with_fx :reverb do
    with_fx :slicer do
      sample :ambi_soft_buzz, amp: 1.5, sustain: 3
    end
  end
end

live_loop :somethingelse do
  sync :drumloop
  sleep 5
  with_fx :reverb do
    with_fx :slicer do
      sample :ambi_choir, amp: 0.5, sustain: 1.5
    end
  end
end