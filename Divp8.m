%Apply morphological operators on an image

%CODE
clc;
close all;
clear all;
i=imread('C:\Users\SuRaj\Desktop\morp.png');
subplot(3,4,1) ;
imshow(i);
title('original image')
i=im2bw(i);
subplot(3,4,2) ;
imshow(i);
title('binary image');
a=bwmorph(i,'dilate');
subplot(3,4,3) ;
imshow(a);
title('dilation image');
b=bwmorph(i,'erode');
subplot(3,4,4) ;
imshow(b);
title('erosion image');
c=bwmorph(i,'open');
subplot(3,4,5) ;
imshow(c);
title('opening image');
d=bwmorph(i,'close');
subplot(3,4,6) ;
imshow(d);
title('closing image');
e=bwmorph(i,'shrink');
subplot(3,4,7) ;
imshow(e);
title('shrinking image');
f=bwmorph(i,'thin');
subplot(3,4,8) ;
imshow(f);
title('thinning image');
g=bwmorph(i,'thicken');
subplot(3,4,9) ;
imshow(g);
title('thickning image');