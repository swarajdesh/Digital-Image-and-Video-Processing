%To perform basic operation on image
clc;
clear all;
close all;
%read the input images
a=imread('C:\DIP images\DIP TEST Images\DIP TEST Images\CAMERA.BMP');
subplot(2,4,1)
imshow(a)
title('original image1');
b=imread('C:\DIP images\DIP TEST Images\DIP TEST Images\FPG.BMP');
subplot(2,4,2)
imshow(b)
title('original image2');
%take the Addition
c=imadd(a,b);
subplot(2,4,3)
imshow(c)
title('add image');
%take the subtraction
d=imsubtract(a,b);
subplot(2,4,4)
imshow(d)
title('subtract image');
%take the multiplication
e=immultiply(a,b);
subplot(2,4,5)
imshow(e)
title('multiply image');
%take the division
f=imdivide(a,b);
subplot(2,4,6)
imshow(f)
title('divide image');