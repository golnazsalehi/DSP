%% CA3 - Part 1
%% Making echoed noisy voice
[x,Fs] = audioread("Taylor.m4a");
h=[1 zeros(1,Fs/4) 0.8];
y=conv(x(:,1),h);
%sound(y,Fs)
wnoise =  0.009*randn(size(y));
ynoisy = y + wnoise ;
%sound(ynoisy,Fs)
audiowrite("noisy_echoed_voice.m4a",ynoisy,Fs)
%% Finding Beta using Delay_Finder function
[Delay_time,Beta,noisy_sound] = Delay_Finder(ynoisy,x,Fs,0.8);
%sound(noisy_sound,Fs)
%% FFT and time domain comparison
figure(1)
yn = fftshift(fft(ynoisy));
L = length(ynoisy);
f=Fs*((-L/2):L/2-1)/L; 
subplot(2,1,1)
plot(f,abs(yn))
title('Noisey echoed voice')
xlabel('Frequency')
ylabel('absolute value of Fourier transfer')


yn = fftshift(fft(noisy_sound));
L = length(noisy_sound);
f=Fs*((-L/2):L/2-1)/L; 
subplot(2,1,2)
plot(f,abs(yn))
title('Output of the function')
xlabel('Frequency')
ylabel('absolute value of Fourier transfer')
%-----------------------
figure(2)
L=length(x); 
dt=1/Fs; 
t=(0:dt:(L/Fs-dt));
subplot(3,1,1)
plot(t,x)
title('Original voice')
xlabel('Time(sec)')
xlim([0 10])

L=length(ynoisy); 
dt=1/Fs; 
t=(0:dt:(L/Fs-dt));
subplot(3,1,2)
plot(t,ynoisy)
title('Noisey echoed voice')
xlabel('Time(sec)')
xlim([0 10])

L=length(noisy_sound); 
dt=1/Fs; 
t=(0:dt:(L/Fs-dt));
subplot(3,1,3)
plot(t,noisy_sound)
title('Output of the function')
xlabel('Time(sec)')
xlim([0 10])
%% Applying the Filter to the noisy sound and plotting FFt of Noise, the Original voice, and the filtered voice 

yn = fftshift(fft(x));
L = length(x);
f=Fs*((-L/2):L/2-1)/L; 
subplot(3,1,1)
plot(f,abs(yn))
title('Original voice')
xlabel('Frequency')
ylabel('absolute value of FFT')

fy = filter(Hd,noisy_sound);
yn = fftshift(fft(fy));
L = length(fy);
f=Fs*((-L/2):L/2-1)/L; 
subplot(3,1,3)
plot(f,abs(yn))
title('filtered')
xlabel('Frequency')
ylabel('absolute value of FFT')
audiowrite("filtered.m4a",fy,Fs)
%sound(fy,Fs)

yn = fftshift(fft(wnoise));
L = length(wnoise);
f=Fs*((-L/2):L/2-1)/L; 
subplot(3,1,2)
plot(f,abs(yn))
title('Noise')
xlabel('Frequency')
ylabel('absolute value of FFT')
%% Plotting the Original voice, and the filtered voice in time domain

L=length(x); 
dt=1/Fs; 
t=(0:dt:(L/Fs-dt));
subplot(2,1,1)
plot(t,x)
title('Original voice')
xlabel('Time(sec)')
xlim([0 10])

L=length(fy); 
dt=1/Fs; 
t=(0:dt:(L/Fs-dt));
subplot(2,1,2)
plot(t,fy)
title('filtered voice')
xlabel('Time(sec)')
xlim([0 10])