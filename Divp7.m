%Perform edge detection using various masks


% MATLAB CODE
clear all;
close all;
clc;
%Take a input image
i=imread('C:\Users\SuRaj\Desktop\New folder\DIP TEST Images\DIP TEST Images\A.BMP');
i1=edge(i,'sobel');
i2=edge(i,'prewitt');
i3=edge(i,'roberts');
i4=edge(i,'canny');
subplot(231)
imshow(i);
title('Original');
subplot(235)
imshow(i1);
title('Sobel Filter');
subplot(232)
imshow(i2);
title('Prewitt Filter');
subplot(233)
imshow(i3);
title('Roberts Filter');
subplot(234)
imshow(i4);
title('Canny Filter');