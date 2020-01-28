
clear all
close all
[image, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~image
   error('Aucun fichier n''a été désigné !')
end

I = imread(image);

BW = im2bw(I);

figure
%imshowpair(I,BW,'montage')

imshow(BW)