I = rgb2gray(imread('Joc_de_caracters.jpg'));
imshow(I);
BW = I < 128;
CC = bwconncomp(BW);
props = regionprops('table',BW,'Area', 'Perimeter', 'BoundingBox','MaxFeretProperties','MinFeretProperties','EulerNumber');
C1 = props.Area ./ (props.Perimeter.*props.Perimeter); % mesura indep del zoom
C2 = props.Perimeter ./ props.BoundingBox(:,3); %W;
C3 = props.Perimeter ./ props.BoundingBox(:,4); %H;
C4 = props.BoundingBox(:,3) ./  props.BoundingBox(:,4); % W/H
C5 = props.MinFeretDiameter ./ props.MaxFeretDiameter;
C6 = abs(props.MinFeretAngle);
C7 = abs(props.MaxFeretAngle);
C8 =  props.Area ./(props.MaxFeretDiameter.* props.MaxFeretDiameter);
C9 =  props.Area ./(props.MinFeretDiameter .* props.MinFeretDiameter);
C10 =  props.Perimeter ./props.MaxFeretDiameter;
C11 =  props.Perimeter ./props.MinFeretDiameter;
C12 = props.EulerNumber;

X = [ C1 C2 C3 C4 C5 C6 C7 C8 C9 C10 C11 C12];
Y = ['0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; 'B'; 'C'; 'D'; 'F'; 'G'; 'H'; 'J'; 'K'; 'L'; 'M'; 'N'; 'P'; 'R'; 'S'; 'T'; 'V'; 'W'; 'X'; 'Y'; 'Z'];

Mdl = TreeBagger(100,X,Y);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


I = rgb2gray(imread('Joc_de_caracters.jpg'));
I = imresize(I,2);
BW = I < 128;
CC = bwconncomp(BW);
props = regionprops('table',BW,'Area', 'Perimeter', 'BoundingBox','MaxFeretProperties','MinFeretProperties','EulerNumber');
C1 = props.Area ./ (props.Perimeter.*props.Perimeter); % mesura indep del zoom
C2 = props.Perimeter ./ props.BoundingBox(:,3); %W;
C3 = props.Perimeter ./ props.BoundingBox(:,4); %H;
C4 = props.BoundingBox(:,3) ./  props.BoundingBox(:,4); % W/H
C5 = props.MinFeretDiameter ./ props.MaxFeretDiameter;
C6 = abs(props.MinFeretAngle);
C7 = abs(props.MaxFeretAngle);
C8 =  props.Area ./(props.MaxFeretDiameter.* props.MaxFeretDiameter);
C9 =  props.Area ./(props.MinFeretDiameter .* props.MinFeretDiameter);
C10 =  props.Perimeter ./props.MaxFeretDiameter;
C11 =  props.Perimeter ./props.MinFeretDiameter;
C12 = props.EulerNumber;

X = [ C1 C2 C3 C4 C5 C6 C7 C8 C9 C10 C11 C12];
[YP, score] = predict(Mdl,X);

PL = cell2mat(YP);
TL = cell2mat(num2cell(Y));
sum(PL == TL)
confusionchart(TL,PL);
% view(Mdl.Trees{1,50},'Mode','graph');







