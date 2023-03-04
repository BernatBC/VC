%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% soroll
I = rgb2gray(imread('bigben.png'));
N = imnoise(I,'salt & pepper', 0.1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filtres integratius, suvaitzat i no lineals
% h = [1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
% h = h/sum(h, 'all'); % suma = 1
% h = fspecial('average', 10);
% h = fspecial('gaussian',10, 10/5);
% F = imfilter(N,h);
% F = medfilt2(N,[5 5]);
% F = nlfilter(N,[3 3], @myfunction);
% F = stdfilt(N);
% F = F/max(F,[],'all'); % re-escalat entre 0 i 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% derivatius
h = [1 0 -1; 2 0 -2; 1 0 -1];
GH = abs(imfilter(I,h));
h = h';
GV = abs(imfilter(I,h));
GH = double(GH)/double(max(GH,[],'all')); % re-escalat entre 0 i 1
GV = double(GV)/double(max(GV,[],'all')); % re-escalat entre 0 i 1
montage({I,GH,GV, GV+GH});


