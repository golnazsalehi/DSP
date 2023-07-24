% Part 2
[num,fs] = audioread('phone_number.wav');
Phone= zeros(1,8);
for i=0:7
    Phone(i+1) = dtmf(num(i*2800+1:i*2800+1+2400),fs);
end
%Phone = 82084180