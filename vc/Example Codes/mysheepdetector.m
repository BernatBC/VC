close all
S = imread('sheeps.jpg');
Im = rgb2gray(S);
imshow(Im);
r = getrect
I = Im(r(2):r(2)+r(4), r(1):r(1)+r(3));
% imshow(I);
D = mydescriptor(I);
step = 10;
h = round(r(4)/2-step/2);
w = round(r(3)/2-step/2);
blk = [h,w];
R = blkproc (Im,[step step], blk, @mycompareimage, D);
R = imresize(R,size(Im));
B = imoverlay(S,R,'y');
imshow(B);