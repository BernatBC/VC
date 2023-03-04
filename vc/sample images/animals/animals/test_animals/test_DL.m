%% reconeixem les imatges de test usant la xarxa 

%  clear all
%  close all
%  

load('trained_network_animals.mat');

num_imatge=input("numero de imatge:");

   filename = ['test' num2str(num_imatge,'%02d') '.jpg'];
   im = imread(filename);

im=imresize(im,[224 224]);
[YPred,probs] = classify(trainedNetwork_animals,im);
imshow(im)
title(string(YPred) + ", " + num2str(100*max(probs),3) + "%");