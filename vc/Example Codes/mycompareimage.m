function [b] = mycompareimage(I,D)
DI = mydescriptor(I);
dist = sum(abs(DI-D));
[f c] = size(I);

b = dist < 800;
end

