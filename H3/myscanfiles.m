    
% script per obrir tots els arxius jpg d'una carpeta
close all
a = dir('.\Chuletons\*.bmp');
nf = size(a);
figure
for i = 1:nf 
filename = horzcat(a(i).folder,'/',a(i).name);
I = imread(filename);
imshow(I);
drawnow
end
