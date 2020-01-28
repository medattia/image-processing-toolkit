%Histogramme sur une image en niveau de gris

clear all;
close all;
clear figure
[image, chemin] = uigetfile('*.jpg','Choisir l''image ‡ transformer:');  %l'utilisateur choisit l'image ‡ transformer
if ~image
   error('Aucun fichier n''a √©t√© d√©sign√© !')
end
mat=uint8(imread(image));
image_i=rgb2gray(mat); %fonction rgb to gray de MATLAB

%CrÈation du tableau Histogramme

histo= zeros(256,1);

for i=1:size(image_i,1)
    for j=1:size(image_i,2)
        histo(image_i(i,j)+1)=histo(image_i(i,j)+1)+1;
    end
end

%Mon histogramme
subplot(1,2,1)
imhist(image_i,256);
title('Histogramme Matlab')

subplot(1,2,2)
hist(histo);
title('Notre Histogramme')



