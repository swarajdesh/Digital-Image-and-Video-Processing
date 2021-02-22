%Perform image compression using DCT / Wavelet transform.

%CODE
% DCT and IDCT
clc;
clear all;
close all;
%showing original image
i=imread('C:\Users\SuRaj\Desktop\rgb.jpg');
subplot(221)
imshow(i);
title('Color Original');
%Converting image in grey
i=double(i(:,:,1));
subplot(222)
imshow(uint8(i));
title('Gray Original');
%Finding DCT coefficient
d=dct2(i);
subplot(223)
imshow(uint8(d));
title('DCT coefficents');
d(abs(d)<40)=0;
id=idct2(d);
subplot(224)
imshow(id,[0 255]);
title('Lossy IDCT Output');