clear all
close all
[fichier, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

 Mat=imread(fichier); % couloir 90,100,95 femme 125
 I = im2bw(Mat);
 suBplot(2,2,[1 3])
 imshow(Mat);
 title('Image de depart ')
 suBplot(2,2,2)
imshow(I);
title('image bineaire ')
BW= bwmorph(I,'skel',Inf);
subplot(224)
 imshow(BW);
 title('Squellette de image ')