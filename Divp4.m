%High pass filtering
clc;
close all;
clear all;
%read input image
a=imread('C:\Users\Public\Pictures\Sample Pictures\Hydrangeas.jpg');
b=rgb2gray(a);
subplot(3,3,1)
imshow(b);
title('original images');
%add noise
p=imnoise(b,'gaussian');
subplot(3,3,2);
imshow(p);
title('noise image');
[row col]=size(p);
%applying mask
w=[-1 -1 -1;-1 8 -1;-1 -1 -1];
for x=2:1:row-1
for y=2:1:col-1
z(x,y)=(w(1)*b(x-1,y-1))+(w(2)*b(x-1,y))+(w(3)*b(x-1,y+1))+(w(4)*b(x,y-1))+(w(5)*b(x,y))+(w(6)*b(x,y+1))+(w(7)*b(x+1,y-1))+(w(8)*b(x+1,y))+(w(9)*b(x+1,y+1));
end
end
subplot(3,3,3);
imshow(z);
title('filter output by HPF in spatial domain');