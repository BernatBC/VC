%% reconeixem les imatges de test usant la xarxa 

  clear all
  close all
%  

load('trainedNetwork_animals.mat');

imagefiles = dir('./test_animals/test*.jpg');      
nfiles = length(imagefiles);    % Number of files found


for i = 1:nfiles
    filename = ['./test_animals/' imagefiles(i).name];
    im = imread(filename);
    im=imresize(im,[224 224]);
    [YPred,probs] = classify(trainedNetwork_animals,im);
    imshow(im)
    title(string(YPred) + ", " + num2str(100*max(probs),3) + "%");
    i
    pause
end
disp('se acabo')


