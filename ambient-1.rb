live_loop :amb do
  with_fx :reverb do
    with_fx :flanger, delay: 10, depth: 20 do
      with_fx :echo do
        use_synth :subpulse
        play chord(:c, :major7), amp: 1.5
      end
    end
  end
  sleep 4
end

live_loop :amb2 do
  sync :amb
  sleep 2
  with_fx :reverb do
    with_fx :echo, decay: 7 do
      with_fx :flanger, delay: 10, depth: 20 do
        use_synth :dpulse
        play chord(:g, :major7), amp: 0.5
      end
    end
  end
  sleep 2
end

live_loop :bass do
  sync :amb
  with_fx :reverb do
    with_fx :flanger, delay: 10, depth: 20 do
      with_fx :echo, decay: 15 do
        sample :bass_hard_c, amp: 0.3
      end
    end
  end
end

live_loop :kick do
  with_fx :reverb do
    sample :bd_808, amp: 5
  end
  sleep 2
end

live_loop :snare do
  sleep 1
  with_fx :reverb do
    sample :elec_mid_snare, amp: 2
  end
  sleep 1
end

live_loop :funk do
  sync :amb
  sleep 2
  with_fx :reverb do
    with_fx :panslicer, smooth: 1 do
      sample :ambi_swoosh, amp: 4, sustain: 5, rate: -1
    end
  end
end

live_loop :snare2 do
  sleep 1.5
  with_fx :reverb do
    with_fx :distortion do
      with_fx :echo, decay: 2.5, amp: 0.2, mix: 0.3, phase: 0.25 do
        sample :sn_dolf, amp: 0.2, pan: 0.6
        sample :elec_pop, amp: 0.6, pan: 0.6
      end
    end
  end
  sleep 2.5
end

live_loop :mel do
  sync :amb
  with_fx :reverb do
    with_fx :ring_mod, mix: 0.3 do
      with_fx :lpf do
        use_synth :tri
        play scale(:c, :major_pentatonic).choose, amp: 0.6, decay: 1, attack: 0.1
      end
    end
  end
  sleep 2
  with_fx :reverb do
    with_fx :ring_mod do
      with_fx :flanger do
        use_synth :mod_sine
        play scale(:g, :major_pentatonic).choose, amp: 0.2, decay: 1.5
      end
    end
  end
end
