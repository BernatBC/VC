I = rgb2gray(imread('coins.jpg'));
J = blkproc(I, [1 1], [10 10], @myfun, 16);
imshow(J,[]);