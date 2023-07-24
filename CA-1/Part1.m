%% Part1
%% 1) ploting channels in time domain
[sonata,fs] = audioread('sonata.mp3');
channel1 = sonata(:,1);
channel2 = sonata(:,2);
[r,c] = size(channel2);
t=(1:r)/fs;
figure(1)
subplot(3,1,1)
plot(t,channel1)
title('channel1')
xlabel('time')
subplot(3,1,2)
plot(t,channel2)
title('channel2')
xlabel('time')
subplot(3,1,3)
plot(t,channel1)
hold on
plot(t,channel2)
xlabel('time')
title('channel1 and channel2')
legend('channel1','channel2')
%% 2) FFt of the channels
figure(2)
subplot(2,1,1)
c1 = fftshift(fft(channel1));
f=linspace(-fs/2,fs/2,r);
plot(f,abs(c1))
xlabel('Frequency (Hz)')
ylabel('Magnitude of FFT')
title('channel1')
%-------
subplot(2,1,2)
c2 = fftshift(fft(channel2));
plot(f,abs(c2))
xlabel('Frequency (Hz)')
ylabel('Magnitude of FFT')
title('channel2')
%% 3) Plotting the PSD of the channel1,
figure(3)
PSD_of_channel1 = abs(c1).^2;
plot(f,PSD_of_channel1)
xlabel('Frequency (Hz)')
title('PSD of channel 1')
%% 4) Using spectrogram to find out about the frequencies at spicific moments
% call spectrogram to get s,f,t
figure(1)
% Use imagesc to display it
[s,f , t] =spectrogram (channel1, 16,6, [], fs);
subplot(4,1,1)
imagesc(t,f,log(abs(s)));
colorbar
axis xy
ylabel('Frequency (Hz)')
xlabel('Time (s)')
title('window size = 16,noverlap = 6')

[s,f , t] =spectrogram (channel1, 16,[], [], fs);
subplot(4,1,2)
imagesc(t,f,log(abs(s)));
colorbar
axis xy
ylabel('Frequency (Hz)')
xlabel('Time (s)')
title('window size = 16,noverlap = 0')
%--------------
[s,f , t] =spectrogram (channel1, 256,100, [], fs);
subplot(4,1,3)
imagesc(t,f,log(abs(s)));
colorbar
axis xy
ylabel('Frequency (Hz)')
xlabel('Time (s)')
title('window size = 256,noverlap = 100')

[s,f , t] =spectrogram (channel1, 256,[], [], fs);
subplot(4,1,4)
imagesc(t,f,log(abs(s)));
colorbar
axis xy
ylabel('Frequency (Hz)')
xlabel('Time (s)')
title('window size = 256,noverlap = 0')
%% 5) signal of the channel 1 and its spectrum.
t=(1:r)/fs;
if (1)
    soundsc(channel1, fs)
    pause(0.35);
    tic;
    tm=0;
    while tm<96
        %----------------Time and Freq domain
        hold off
        figure(1)
        subplot(2,1,1)
        imagesc(f,t,log(abs(s')));
        colorbar
        axis xy
        xlabel('freauency (Hz)')
        ylabel('Time(sec)')
        hold on
        tm =toc;
        plot([0,fs/2],[tm,tm],'r','LineWidth',2)
        drawnow
        %----------------Time domain
        hold off
        subplot(2,1,2)        
        plot(t,channel1,'b')
        axis xy
        xlabel('Time(sec)')
        hold on
        tm =toc;
        plot([tm,tm],[-1,1],'r','LineWidth',2)
        drawnow
    end
end