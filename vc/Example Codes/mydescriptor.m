function [D] =  mydescriptor(I)

I = imresize(I,[32,32]);
D = imhist(I);
D = extractHOGFeatures(I,'CellSize',[8 8]);
%D  = extractLBPFeatures(I,'CellSize',[16 16]);
% [D, V] = extractHOGFeatures(I,'CellSize',[8 8]);
% subplot(1, 2, 1);
% imshow(I);
% subplot(1,2,2);
% plot(V);
% drawnow
end

