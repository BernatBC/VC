%% fluorescentcellsegmentation
I = imread('flourescent_cell_780x520.jpg');
Indg = I(:,:,1);
imshow(Indg);
IF = medfilt2(Indg);
IFO = imopen(IF,strel('disk',5));
imshow(IF);
M = imregionalmax(IFO);
C = double(M).*double(IF);
CM = uint8(C/max(max(C))*255);
R = imreconstruct(CM,IF);
B = R > 64;
EB = imerode(B,strel('disk',5));
BG = not(EB);
TD = bwdist(BG,'euclidean');
TD = medfilt2(TD);
TD = -TD;
TD (BG ==1) = -Inf;
WS = watershed(TD);
F = WS == 0;
FD = imdilate(F,strel('disk',2));
RGB = I;
RGB(:,:,1) = RGB(:,:,1) + uint8(FD)*255;
RGB(:,:,2) = RGB(:,:,2) + uint8(FD)*255;
RGB(:,:,3) = RGB(:,:,3) + uint8(FD)*255;

figure;imshow(RGB,[]);

