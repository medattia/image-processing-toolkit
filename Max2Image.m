clear all
close all
[Image1, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~Image1
   error('Image 1 n''a été désigné !')
end
 Mat1=imread(Image1); % couloir 90,100,95 femme 125
[Image2, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~Image2
   error('Image 2 n''a été désigné !')
end

 Mat2=imread(Image2); % couloir 90,100,95 femme 125
 M = size(Mat1);
 N = size(Mat2);
 m = min(M(1),N(1));
 n = min(M(2),N(2));
 
%----------------- Max de l'image ------------------
for i = 1:m
    for j = 1:n
    ImMax(i,j) = max(Mat1(i,j),Mat2(i,j));
    end 
end
% -------------------  affiche graphique ------------------------
subplot(1,3,1)
imshow(Mat1)
title('Image max 1')
subplot(1,3,2)
imshow(Mat2)
title('Image 2')
subplot(1,3,3)
 imshow(ImMax)
title('Image max de 2 image ')
