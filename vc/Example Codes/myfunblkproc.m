function [y] = myfun(x,k)
 m  = mean(x,'all');
 [f c] = size(x);
 cf = round(f/2);
 cc = round(c/2);
 
 B = x(cf,cc) > m + k ;
 F = x(cf,cc) < m - k ;
 
 y = int8(B) - int8(F);
 
end

