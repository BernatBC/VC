I = imread('rice.png');
% h = imhist(I);
% bar(h);
BW = I > 115;
EE = strel('disk',3);
BWF = imopen(BW,EE);

BW = BWF;

BBW = false(size(BW));
BBW(:,1) = true;
BBW(:,end) = true;
BBW(end,:) = true;
BBW(1,:) = true;

RI = imreconstruct(BBW,BW);
FBI = BW & not(RI);
FBI = bwmorph(FBI,'skel',Inf);
FBI = bwmorph(FBI,'spur',5);
montage({BW,FBI});
