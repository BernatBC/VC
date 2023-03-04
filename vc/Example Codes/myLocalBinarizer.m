RGB = imread('microscopy_cell_counting_780x520.jpg');
I = rgb2gray(RGB);
F = double(medfilt2(I,[3 3]));
M = colfilt(F, [8 8],'sliding', @mean);
BW = M - F > 16;
[f, c] = size(I);
RGBM = RGB; 
RGBM(:,:,1) = RGBM(:,:,1) + 255 * uint8(BW);
montage({I,BW,RGBM});