close all;
I = rgb2gray(imread('cellsegmentationcompetition.png'));
MARC = I > 250;
MARC = imdilate(MARC, strel('disk',2));
I(MARC) = 0;
% filtrat morfo.
OI = imopen(I, strel('disk',3));
CI = imclose(I, strel('disk',3));
%figure; montage({I,OI,CI});
FG = OI > 15;
FG = bwareaopen(FG,300); % eliminacio estruct. petites per area
BK = not(FG);
RGB = imoverlay(I,BK,'red');
%watershed
DT = bwdist(BK,'euclidean');
DT = imcomplement(DT);
DT1 = imopen(DT, strel('disk',7));
DT2 = imclose(DT, strel('disk',7));
DT1(BK) = -Inf;
L1 = watershed(DT1);
DT2(BK) = -Inf;
L2 = watershed(DT2);
% figure;imshow(L1,[]);
% figure;imshow(L2,[]); % la bona

BR = L2 == 0;
BR = imdilate(BR, strel('disk',2));

RGB = imoverlay(I,BR,'yellow');
figure;imshow(RGB);





