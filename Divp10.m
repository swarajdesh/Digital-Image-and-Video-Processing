%Apply morphological operators on an image

%CODE
close all;
clear all;
clc;
i=imread('C:\Users\SuRaj\Desktop\morp.png');
subplot(131)
imshow(i);
title('Original Image')
%dilation of image
sed=strel('disk',5);
id=imdilate(i,sed);
subplot(132)
imshow(id);
title('Dilated Image');
%Erosion of image
see=strel('disk',2);
ie=imerode(i,see);
subplot(133)
imshow(ie);
title('Eroded Image');