%% Part5
%v1 = load('v1.mat');
%v2 = load('v2.mat');
%v3 = load('v3.mat');
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
plot(quefrency(5:1590),abs(S1cepstrum(5:1590)))
xlabel('quefrency')
title('cepstrum of Signal1')

subplot(3,1,2)
plot(quefrency(5:1590),abs(S2cepstrum(5:1590)))
xlabel('quefrency')
title('cepstrum of Signal2')

subplot(3,1,3)
plot(quefrency(5:1590),abs(S3cepstrum(5:1590)))
xlabel('quefrency')
title('cepstrum of Signal3')