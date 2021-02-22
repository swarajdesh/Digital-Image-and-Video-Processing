%To perform conversion between colour spaces

% RGB TO HSI CONVERSION
clc;
close all;
clear all;
A=imread('C:\Users\SuRaj\Desktop\rgb.jpg');
figure,imshow(A);
title('ORIGINAL RGB Image');
%Find the red green and blue component and display
r=A;
r(:,:,2) = 0;
r(:,:,3) = 0;
figure,imshow(r);
title('red component');
g=A;
g(:,:,1) = 0;
g(:,:,3) = 0;
figure,imshow(g);
title('green component');
b=A;
b(:,:,1) = 0;
b(:,:,2) = 0;
figure,imshow(b);
title('blue component');
%Represent the RGB image in [0 1] range
I=double(A)/255;
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%Hue
numi=1/2*((R-G)+(R-B));
denom=((R-G).^2+((R-B).*(G-B))).^0.5;
%To avoid divide by zero exception add a small number in the denominator
H=acosd(numi./(denom+0.000001));
%If B>G then H= 360-Theta
H(B>G)=360-H(B>G);
%Normalize to the range [0 1]
H=H/360;
%Saturation
S=1- (3./(sum(I,3)+0.000001)).*min(I,[],3);
%Intensity
I=sum(I,3)./3;
figure,imshow(H);
title('HUE components')
figure,imshow(S);
title('SATURATION components')
figure,imshow(I);
title('INTENSITY components')
%HSI
HSI=zeros(size(A));
HSI(:,:,1)=H;
HSI(:,:,2)=S;
HSI(:,:,3)=I;
%show the output hsi image
figure,imshow(HSI);
title('RGB TO HSI Image');
%*****************************************************
% HSI TO RGB CONVERSION
H1=HSI(:,:,1);
S1=HSI(:,:,2);
I1=HSI(:,:,3);
%Multiply Hue by 360 to represent in the range [0 360]
H1=H1*360;
%Preallocate the R,G and B components
R1=zeros(size(H1));
G1=zeros(size(H1));
B1=zeros(size(H1));
RGB1=zeros([size(H1),3]);
%RG Sector(0<=H<120)
%When H is in the above sector, the RGB components equations are
B1(H1<120)=I1(H1<120).*(1-S1(H1<120));
R1(H1<120)=I1(H1<120).*(1+((S1(H1<120).*cosd(H1(H1<120)))./cosd(60-H1(H1<120))));
G1(H1<120)=3.*I1(H1<120)-(R1(H1<120)+B1(H1<120));
%GB Sector(120<=H<240)
%When H is in the above sector, the RGB components equations are
%Subtract 120 from Hue
H2=H1-120;
R1(H1>=120&H1<240)=I1(H1>=120&H1<240).*(1-S1(H1>=120&H1<240));
G1(H1>=120&H1<240)=I1(H1>=120&H1<240).*(1+((S1(H1>=120&H1<240).*cosd(H2(H1>=120&H1<240)))./cosd(60-H2(H1>=120&H1<240))));
B1(H1>=120&H1<240)=3.*I1(H1>=120&H1<240)-(R1(H1>=120&H1<240)+G1(H1>=120&H1<240));
%BR Sector(240<=H<=360)
%When H is in the above sector, the RGB components equations are
%Subtract 240 from Hue
H2=H1-240;
G1(H1>=240&H1<=360)=I1(H1>=240&H1<=360).*(1-S1(H1>=240&H1<=360));
B1(H1>=240&H1<=360)=I1(H1>=240&H1<=360).*(1+((S1(H1>=240&H1<=360).*cosd(H2(H1>=240&H1<=360)))./cosd(60-H2(H1>=240&H1<=360))));
R1(H1>=240&H1<=360)=3.*I1(H1>=240&H1<=360)-(G1(H1>=240&H1<=360)+B1(H1>=240&H1<=360));
%Form RGB Image
RGB1(:,:,1)=R1;
RGB1(:,:,2)=G1;
RGB1(:,:,3)=B1;
%Represent the image in the range [0 255]
RGB1=im2uint8(RGB1);
figure,imshow(RGB1);
title('HSI TO RGB Image');