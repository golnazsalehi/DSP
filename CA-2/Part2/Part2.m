%% CA3 - Part2
%% house.jpg
House = imread('house.jpg');
House = rgb2gray(House);
%-------------------
subplot(4,2,1)
identity = [0 0 0;
            0 1 0;
            0 0 0];
New_House = conv2(House,identity);
imshow(uint8(New_House))
title('Identity kernel')
%-------------------
subplot(4,2,2)
line_V = [-1 2 -1;
          -1 2 -1;
          -1 2 -1];
New_House = conv2(House,line_V);
imshow(uint8(abs(New_House)))  
title('line-V kernel')
%-------------------
subplot(4,2,3)
line_H = [-1 -1 -1;
          2 2 2;
         -1 -1 -1];
New_House = conv2(House,line_H);
imshow(uint8(abs(New_House)))    
title('line-H kernel')
%-------------------
subplot(4,2,4)     
avg_moving = [0.111 0.111 0.111;
              0.111 0.111 0.111;
              0.111 0.111 0.111];
New_House = conv2(House,avg_moving);
imshow(uint8(abs(New_House)))    
title('avg-moving kernel')
%-------------------
subplot(4,2,5)                    
gauss = [0.0113 0.0838 0.0113;
         0.0838 0.6193 0.0838;
         0.0113 0.0838 0.0113];
New_House = conv2(House,gauss);
imshow(uint8(New_House)) 
title('gauss kernel')
%-------------------
subplot(4,2,6)     
outline = [-1 -1 -1;
           -1 8 -1;
           -1 -1 -1];
New_House = conv2(House,outline);
imshow(uint8(abs(New_House)))    
title('outline kernel')
%-------------------       
subplot(4,2,7)         
blur = [0.0625 0.125 0.0625;
        0.125 0.25 0.125;
        0.0625 0.125 0.0625];
New_House = conv2(House,blur);
imshow(uint8(New_House)) 
title('blur kernel')
%-------------------  
subplot(4,2,8) 
sharpen = [0 -1 0; 
           -1 5 -1;
           0 -1 0];
New_House = conv2(House,sharpen);
imshow(uint8(abs(New_House)))    
title('sharpen kernel')
%% kobe.jpg
Kobe = imread('kobe.jpeg');
Kobe = rgb2gray(Kobe);
Kobe_resize1 = imresize(Kobe,0.2);
Kobe_resize2 = imresize(Kobe_resize1,5,'nearest');
figure(1)
imshow(Kobe)
figure(2)
imshow(Kobe_resize1)
figure(3)
imshow(Kobe_resize2)
%-------------------
figure(4)
subplot(3,1,1)  
imshow(Kobe_resize2)
title('Resized pic')

subplot(3,1,2)                    
gauss = [0.0113 0.0838 0.0113;
         0.0838 0.6193 0.0838;
         0.0113 0.0838 0.0113];
New_Kobe = conv2(Kobe_resize2,gauss);
imshow(uint8(New_Kobe)) 
title('gauss kernel')

subplot(3,1,3)     
avg_moving = [0.111 0.111 0.111;
              0.111 0.111 0.111;
              0.111 0.111 0.111];
New_Kobe = conv2(Kobe_resize2,avg_moving);
imshow(uint8(New_Kobe))       
title('avg-moving kernel')
%% Emtiazi
RealPage = imread('page.jpg');
Page = rgb2gray(RealPage);
CamScanner(Page,RealPage)
