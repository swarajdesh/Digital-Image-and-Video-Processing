%Perform image restoration

%CODE
clc;
clear all;
close all;
i=imread('C:\Users\SuRaj\Desktop\rgb.jpg');
i=im2double(i);
subplot(2,2,1);
imshow(i);
title('original image');
LEN=21;
THETA=11;
PSF=fspecial('motion',LEN,THETA);
blurred=imfilter(i,PSF,'conv','circular')
noise_mean=0;
noise_var=0.0001;
blurred_noisy=imnoise(blurred,'gaussian',noise_mean,noise_var);
subplot(2,2,2);
imshow(blurred_noisy)
title('blur & noisy image');
estimated_nsr=0;
wnr2=deconvwnr(blurred_noisy,PSF,estimated_nsr);
subplot(2,2,3);
imshow(wnr2)
title('restored img using NSR=0');
estimated_nsr=noise_var/var(i(:));
wnr3=deconvwnr(blurred_noisy,PSF,estimated_nsr);
subplot(2,2,4);
imshow(wnr3);
title('restored img using estimated NSR');