I = imread('flor.png');
I = imresize(I, 0.2);
imshow(I);
HSV = rgb2hsv(I);
Hy = sin(HSV(:,:,1)*2*pi);
Hx = cos(HSV(:,:,1)*2*pi);
S = HSV(:,:,2);
V = HSV(:,:,3);
O = double([Hx(:) Hy(:) S(:) V(:)]);
[C, CEN] = kmeans(O,16);

[f c p] = size(I);
S = reshape(C,[f c]);
HSVC = zeros(f,c,p);
for i = 1: f
 for j = 1: c
     chxysv = CEN(S(i,j),:);
     a = atan2(chxysv(2),chxysv(1));
     if a < 0
         a = pi-a;
     end
     h = a /(2*pi);
     HSVC(i,j,1) = h;
     HSVC(i,j,2) = chxysv(3);
     HSVC(i,j,3) = chxysv(4);     
 end
end

RGB = hsv2rgb(HSVC);
montage({I,RGB});

    

