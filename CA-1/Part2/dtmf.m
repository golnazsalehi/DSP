function keyboard = dtmf (y,fs) 
    Lf=[697 770 852 941];
    Hf=[1209 1336 1477 1633];
    letters = {1, 2, 3, 'A'; 4, 5, 6,'B'; 7, 8, 9, 'C'; 'star', 0, 'hash' ,'D'};
    %-----------Setting Limits to find Low Freq
    Low1 = floor(697*length(y)/fs);
    Low2 = ceil(941*length(y)/fs);
    %-----------Setting Limits to find High Freq
    High1 = floor(1209*length(y)/fs);
    High2 = ceil(1633*length(y)/fs);
    %---------------------------FFT
    FFT_of_y = fft(y);
    Dif_of_FFT_of_y = diff(abs(FFT_of_y));
    %-----------------------------------------Low Frequency
    [~,LowFreq] = max(Dif_of_FFT_of_y(Low1-10 : Low2+10));
    LowFreq = LowFreq + Low1 -11;
    LowFreq = LowFreq*fs/length(y);
    %-----------------------------------------High Frequency
    [~,HighFreq] = max(Dif_of_FFT_of_y(High1-10 : High2+10));
    HighFreq = HighFreq + High1 -11;
    HighFreq = HighFreq*fs/length(y);
    %---------------------------
    [~,Lf_place] = min(abs(Lf - LowFreq));
    [~,Hf_place] = min(abs(Hf - HighFreq));
    keyboard=letters{Lf_place,Hf_place};
end