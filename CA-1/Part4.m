%% Part4
%% 1)Plotting the selected signals
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
%% 2) Defining the frequency domain of neural signals
Delta = [0.5 4];
Theta = [4 8];
Alpha = [8 13];
Beta = [13 35];
Gamma = 35;
%% 3)For Signal1, figuring out if it is Delta, Theta, Alpha, Beta, or Gamma
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
legend('Signal3','Elicited Gamma frequencies')
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