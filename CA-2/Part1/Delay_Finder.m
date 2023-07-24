function [Delay,Delay_place,noisy_sound] = Delay_Finder(ynoisy,x,Fs,Gain)
    %-----------------------Finding delay
    L=length(ynoisy); 
    dt=1/Fs; 
    t=(0:dt:(L/Fs-dt))';
    c = rceps(ynoisy);
    L_half_c = floor(length(c)/2);
    half_of_c = c(50:L_half_c,1);
    Max = max(half_of_c);
    Delay_place = find(c == Max);
    Delay = t(Delay_place(1));
    Delay=Delay(1);
    %-----------------------Remaking the noisy voice
    zero1 = zeros(Delay_place(1)-1,1);
    zero2 = zeros(L-Delay_place(1)+1-length(x));
    noisy_sound = ynoisy - cat(1,zero1,Gain*x,zero2);
     %-----------------------Saving the noisy voice
    audiowrite("noisy_voice.m4a",noisy_sound,Fs)
end
