I = rgb2gray(imread('coins.jpg'));
imshow(I);
h = imhist(I);
ha = cumsum(h); % histograma acumulat
[f c] = size(I);
mida = f*c;
Area = 0.27 * mida; % tan per cent de la imatge a blanc
b = ha > Area;
llindar = find(b,1); % busca el primer element a 1
B = I < llindar;
ee = strel ('disk', 4);
BC = imclose(B, ee);


C = bwconncomp(BC);

npixels = cellfun(@numel,C.PixelIdxList);
[v,i] = max(npixels);
J = BC;
J(C.PixelIdxList{i}) = 0;
montage({BC,J});


