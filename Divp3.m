%To perform histogram equalization

clc;
clear all;
close all;
%take a input image
i=imread('C:\Users\SuRaj\Desktop\New folder\DIP TEST Images\DIP TEST Images\CAM.BMP');
subplot(2,2,1);
imshow(i);
title('original im');
subplot(2,2,2);
imhist(i);
title('histogram of original im');
a=double(i);
[row,col]=size(a);
h=zeros(1,256);
for n=1:1:row
for m=1:1:col
if a(n,m)==0
a(n,m)=1;
end ;
end;
end;
for n=1:1:row
for m=1:1:col
t=a(n,m);
h(t)=h(t)+1;
end;
end;
h=h/(row*col);
%CDF
cdf(1)=h(1);
l=256;
for n=2:1:l
cdf(n)=h(n)+cdf(n-1);
end;
for m=1:1:l
cdfr(m)=round(cdf(m)*(l-1));
end;
%histogram equilisation
for i=1:1:row
for j=1:1:col
tmp=a(i,j);
b(i,j)=cdfr(tmp);
end;
end
subplot(2,2,3);
imshow(uint8(b));
title('equilizedim');
x=1:1:256;
y=b(x);
subplot(2,2,4);
bar(x,y)
title('histogram of equilizedim');