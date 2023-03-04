I = rgb2gray(imread('normal-blood1.jpg'));
% h = imhist(I);
% bar(h);
BW = I < 200;
BW = imfill(BW,'holes');
BBW = false(size(BW));
BBW(:,1) = true;
BBW(:,end) = true;
BBW(end,:) = true;
BBW(1,:) = true;

RI = imreconstruct(BBW,BW);
FBI = BW & not(RI);
DT = bwdist(not(FBI),'euclidean');
DTB = DT > 30;
imshow(DTB,[]);
