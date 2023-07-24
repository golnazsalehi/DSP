%%Part3
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
subplot(2,3,2)
image(QuarterBW)
axis equal tight
subplot(2,3,3)
image(o8BW)
colormap(gray)
axis equal tight
%------------------------------------FFT2 of the Squares above
figure(1)
Y = fft2(HalfBW);
subplot(2,3,4)
Ylog = abs(fftshift(Y));
imshow(Ylog)
axis equal tight
colorbar

Y = fft2(QuarterBW);
subplot(2,3,5)
Ylog = abs(fftshift(Y));
imshow(Ylog)
axis equal tight
colorbar

Y = fft2(o8BW);
subplot(2,3,6)
Ylog = abs(fftshift(Y));
imshow(Ylog)
axis equal tight
colorbar
%% ------------------------ Compressing the Tiger
figure(2)
tiger = imread('tiger.jpg');
subplot(2,2,1)
imshow(tiger)
title('The original')
tigerFFt = fft2(tiger);
tigreSort = sort(abs(tigerFFt(:)));
counter = 2;
compresed = [0.95 0.5];
for keep = [0.046,0.004]
    subplot(2,2,counter)
    thresh = tigreSort(floor((1-keep)*length(tigreSort)));
    index = abs(tigerFFt)>thresh;
    newTigrefft = tigerFFt.*index;
    newTigre =uint8(ifft2(newTigrefft));
    imshow(newTigre)
    title(['',num2str(100*compresed(counter-1)),'% compressed'],'FontSize',10)
    imwrite(newTigre,sprintf('%d compresed.jpg',100*compresed(counter-1)))
    counter=counter+1;
end