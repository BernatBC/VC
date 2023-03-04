I = rgb2gray(imread('Wheel.bmp'));
% h = imhist(I);
% bar(h);
BW = I > 15;
BW = imfill(BW,'holes');
EE = strel('disk',8);
EI = imerode(BW,EE);
DI = imdilate(BW,EE);
OI = imopen(BW,EE);
CI = imclose(BW,EE);
RI = and(BW,not(OI));
RI = BW & not(OI);
EE = strel('disk',2);
RIF = imclose(RI,EE); 
montage({BW,EI,DI,OI,CI,RI,RIF});
bwconncomp(RI)
bwconncomp(RIF)
%imshow(BW);
