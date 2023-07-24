%% Part1
%% 1
%--------------------------ploting channels in time domain
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
%% 2
%----------------------------FFt of the channels
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
%----------------------------PSD of the channels
figure(3)
PSD_of_channel1 = abs(c1).^2;
plot(f,PSD_of_channel1)
xlabel('Frequency (Hz)')
title('PSD of channel 1')
%% 3
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
%% 4
t=(1:r)/fs;
if (1)
    soundsc(channel1, fs)
    pause(0.35);
    tic;
    tm=0;
    while tm<96
        %----------------Time and Freq domain
        hold off
        figure(2)
        subplot(2,1,1)
        imagesc(f,t,log(abs(s')));
        colorbar
        axis xy
        xlabel('freauency (Hz)')
        ylabel('Time(sec)')
        hold on
        tm =toc;
        plot([0,fs/2],[tm,tm],'r','LineWidth',1.5)
        drawnow
        %----------------Time domain
        hold off
        subplot(2,1,2)        
        plot(t,channel1,'b')
        axis xy
        xlabel('Time(sec)')
        hold on
        tm =toc;
        plot([tm,tm],[-1,1],'r','LineWidth',1.5)
        drawnow
    end
end
%% Part 2
[num,fs] = audioread('phone_number.wav');
Phone= zeros(1,8);
for i=0:7
    Phone(i+1) = dtmf(num(i*2800+1:i*2800+1+2400),fs);
end
%Phone = 82084180
%% Part3
%1-------------------------------------Drawing the Squares
HalfBW=[ones(256,128)*256,ones(256,128)];
s64 = ones(64,64)*256;
QuarterBW = [s64,s64,s64,s64;s64,s64/256,s64/256,s64;s64,s64/256,s64/256,s64;s64,s64,s64,s64];

DiagonalBW1 = ones(64,64);
for i =1:64
    for j =1:64
        if j<=i
            DiagonalBW1(i,j)=256;
        end
    end
end
DiagonalBW2 = ones(64,64);
for i =1:64
    for j =1:64
        if j>=i
            DiagonalBW2(i,j)=256;
        end
    end
end
DiagonalBW3=flip(DiagonalBW2,1);
DiagonalBW4=flip(DiagonalBW1,1);
o8BW = [s64,s64,s64,s64;s64,DiagonalBW4,DiagonalBW2,s64;s64,DiagonalBW1,DiagonalBW3,s64;s64,s64,s64,s64];

figure(1)
subplot(2,3,1)
image(HalfBW)
axis equal tight
title('Shape 1')
subplot(2,3,2)
image(QuarterBW)
axis equal tight
title('Shape 2')
subplot(2,3,3)
image(o8BW)
colormap(gray)
axis equal tight
title('Shape 3')
%------------------------------------FFT2 of the Squares above
figure(1)
Y = fft2(HalfBW);
subplot(2,3,4)
Ylog = log(abs(fftshift(Y))+1);
imshow(Ylog)
axis equal tight
title('fft2 of Shape 1')
colorbar

Y = fft2(QuarterBW);
subplot(2,3,5)
Ylog = log(abs(fftshift(Y))+1);
imshow(Ylog)
axis equal tight
title('fft2 of Shape 2')
colorbar

Y = fft2(o8BW);
subplot(2,3,6)
Ylog = log(abs(fftshift(Y))+1);
imshow(Ylog)
axis equal tight
title('fft2 of Shape 3')
colorbar
%------------------------ Compressing the Tiger
figure(2)
tiger = imread('tiger.jpg');
tigerFFt = fft2(tiger);
tigreSort = sort(tigerFFt(:));
counter = 1;
for keep = [0.95, 0.5, 0.007 ,0.00002]
    subplot(2,2,counter)
    thresh = tigreSort(floor((1-keep)*length(tigreSort)));
    index = abs(tigerFFt)>thresh;
    newTigrefft = tigerFFt.*index;
    newTigre =uint8(ifft2(newTigrefft));
    imshow(256-newTigre)
    title(['',num2str(100*keep),'% Compressed'],'FontSize',10)
    counter=counter+1;
end
%% Part4
v1 = load('v1.mat');
v2 = load('v2.mat');
v3 = load('v3.mat');
Signal1 = v1.val(3,:);
Signal2 = v2.val(44,:);
Signal3 = v3.val(55,:);
[r,c] = size(Signal1);
% 1600/10 = 160 Hz
fs = 160;
t = (1:c)/fs;
f=linspace(-fs/2,fs/2,c);
figure(1)
%--------------First Signal
subplot(3,2,1)
plot(t,Signal1)
xlabel('Time(sec)')
title('Signal1')
subplot(3,2,2)
FFTSignal1 = fftshift(fft(Signal1));
plot(f,abs(FFTSignal1))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Signal1')
%--------------Second Signal
subplot(3,2,3)
plot(t,Signal2)
xlabel('Time(sec)')
title('Signal2')
subplot(3,2,4)
FFTSignal2 = fftshift(fft(Signal2));
plot(f,abs(FFTSignal2))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Signal2')
%--------------Third Signal
subplot(3,2,5)
plot(t,Signal3)
xlabel('Time(sec)')
title('Signal3')
subplot(3,2,6)
FFTSignal3 = fftshift(fft(Signal3));
plot(f,abs(FFTSignal3))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Signal3')
%%
Delta = [0.5 4];
Theta = [4 8];
Alpha = [8 13];
Beta = [13 35];
Gamma = 35;
%% For Signal1, figuring out if it is Delta, Theta, Alpha, Beta, or Gamma
figure(2)
%Delta
Newf = abs(f)>Delta(1) & abs(f)<Delta(2);
newFreq = Newf.*FFTSignal1;
DSignal = ifft(ifftshift(newFreq));
subplot(5,1,1)
plot(t,Signal1,'b')
hold on
plot(t,DSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal1','Elicited Delta frequencies')
%Theta
Newf = abs(f)>Theta(1) & abs(f)<Theta(2);
newFreq = Newf.*FFTSignal1;
TSignal = ifft(ifftshift(newFreq));
subplot(5,1,2)
plot(t,Signal1,'b')
hold on
plot(t,TSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal1','Elicited Theta frequencies')
%Alpha
Newf = abs(f)>Alpha(1) & abs(f)<Alpha(2);
newFreq = Newf.*FFTSignal1;
ASignal = ifft(ifftshift(newFreq));
subplot(5,1,3)
plot(t,Signal1,'b')
hold on
plot(t,ASignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal1','Elicited Alpha frequencies')
%Beta
Newf = abs(f)>Beta(1) & abs(f)<Beta(2);
newFreq = Newf.*FFTSignal1;
BSignal = ifft(ifftshift(newFreq));
subplot(5,1,4)
plot(t,Signal1,'b')
hold on
plot(t,BSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal1','Elicited Beta frequencies')
%Gamma
Newf = abs(f)>Gamma;
newFreq = Newf.*FFTSignal1;
GSignal = ifft(ifftshift(newFreq));
subplot(5,1,5)
plot(t,Signal1,'b')
hold on
plot(t,GSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal1','Elicited Gamma frequencies')
%% For Signal2, figuring out if it is Delta, Theta, Alpha, Beta, or Gamma
figure(3)
%Delta
Newf = abs(f)>Delta(1) & abs(f)<Delta(2);
newFreq = Newf.*FFTSignal2;
DSignal = ifft(ifftshift(newFreq));
subplot(5,1,1)
plot(t,Signal2,'b')
hold on
plot(t,DSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal2','Elicited Delta frequencies')
%Theta
Newf = abs(f)>Theta(1) & abs(f)<Theta(2);
newFreq = Newf.*FFTSignal2;
TSignal = ifft(ifftshift(newFreq));
subplot(5,1,2)
plot(t,Signal2,'b')
hold on
plot(t,TSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal2','Elicited Theta frequencies')
%Alpha
Newf = abs(f)>Alpha(1) & abs(f)<Alpha(2);
newFreq = Newf.*FFTSignal2;
ASignal = ifft(ifftshift(newFreq));
subplot(5,1,3)
plot(t,Signal2,'b')
hold on
plot(t,ASignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal2','Elicited Alpha frequencies')
%Beta
Newf = abs(f)>Beta(1) & abs(f)<Beta(2);
newFreq = Newf.*FFTSignal2;
BSignal = ifft(ifftshift(newFreq));
subplot(5,1,4)
plot(t,Signal2,'b')
hold on
plot(t,BSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal2','Elicited Beta frequencies')
%Gamma
Newf = abs(f)>Gamma;
newFreq = Newf.*FFTSignal2;
GSignal = ifft(ifftshift(newFreq));
subplot(5,1,5)
plot(t,Signal2,'b')
hold on
plot(t,GSignal,'r','LineWidth',2)
xlabel('Time(sec)')
%% For Signal3, figuring out if it is Delta, Theta, Alpha, Beta, or Gamma
figure(4)
%Delta
Newf = abs(f)>Delta(1) & abs(f)<Delta(2);
newFreq = Newf.*FFTSignal3;
DSignal = ifft(ifftshift(newFreq));
subplot(5,1,1)
plot(t,Signal3,'b')
hold on
plot(t,DSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal3','Elicited Delta frequencies')
%Theta
Newf = abs(f)>Theta(1) & abs(f)<Theta(2);
newFreq = Newf.*FFTSignal3;
TSignal = ifft(ifftshift(newFreq));
subplot(5,1,2)
plot(t,Signal3,'b')
hold on
plot(t,TSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal3','Elicited Theta frequencies')
%Alpha
Newf = abs(f)>Alpha(1) & abs(f)<Alpha(2);
newFreq = Newf.*FFTSignal3;
ASignal = ifft(ifftshift(newFreq));
subplot(5,1,3)
plot(t,Signal3,'b')
hold on
plot(t,ASignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal3','Elicited Alpha frequencies')
%Beta
Newf = abs(f)>Beta(1) & abs(f)<Beta(2);
newFreq = Newf.*FFTSignal3;
BSignal = ifft(ifftshift(newFreq));
subplot(5,1,4)
plot(t,Signal3,'b')
hold on
plot(t,BSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal3','Elicited Beta frequencies')
%Gamma
Newf = abs(f)>Gamma;
newFreq = Newf.*FFTSignal3;
GSignal = ifft(ifftshift(newFreq));
subplot(5,1,5)
plot(t,Signal3,'b')
hold on
plot(t,GSignal,'r','LineWidth',2)
xlabel('Time(sec)')
legend('Signal3','Elicited Gamma frequencies')
%% Part5
v1 = load('v1.mat');
v2 = load('v2.mat');
v3 = load('v3.mat');
Signal1 = v1.val(3,:);
Signal2 = v2.val(44,:);
Signal3 = v3.val(55,:);
[r,c] = size(Signal1);
% 1600/10 = 160 Hz
fs = 160;
t = (1:c)/fs;
f=linspace(-fs/2,fs/2,c);
S1cepstrum = cepstrum(Signal1);
S2cepstrum = cepstrum(Signal2);
S3cepstrum = cepstrum(Signal3);
quefrency = (1:c);
subplot(3,1,1)
plot(quefrency(5:1590),S1cepstrum(5:1590))
xlabel('quefrency')
title('cepstrum of Signal1')

subplot(3,1,2)
plot(quefrency(5:1590),S2cepstrum(5:1590))
xlabel('quefrency')
title('cepstrum of Signal2')

subplot(3,1,3)
plot(quefrency(5:1590),S3cepstrum(5:1590))
xlabel('quefrency')
title('cepstrum of Signal3')