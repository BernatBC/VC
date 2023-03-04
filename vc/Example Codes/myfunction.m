function [y] = myfunction(ndg)
% filtre no lineal de soroll aditiu
m = mean(ndg,'all');
if ndg(2,2) > m + 16
    y = uint8(m);
else
    y = ndg(2,2);
end
end

