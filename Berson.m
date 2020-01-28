close all
clear all
[Image, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Aucun fichier n''a été désigné !')
end
;
I         = imread(Image);
mat   = I;
if length(size(I))==3
    I = rgb2gray(I);
end
ImBerson = zeros(size(I)); % allocation

Imin = min(min(I));
Imax = max(max(I));
%----------// Calcul du seuil par la methode de Berson //-----------------
Seuil = (Imin+Imax)/2;

ImBerson( I > Seuil ) = 1;

%Visualisation
subplot(1,2,1)
imshow(mat);
title('Image initiale ');
subplot(1,2,2)
imshow(ImBerson);
title('image noir blanc par methode de Berson');