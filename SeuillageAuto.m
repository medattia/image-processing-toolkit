%Fonction qui transforme une image en RGB ou  en Nuances de gris en une image binaire
%avec un seuil aléatoire
function SeuillageAuto(Mat)
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%Lecture de l'image
Mat = (imread(fichier));
if length(size(Mat))==3
    Mat = rgb2gray(Mat);
end

%calcul
bin=zeros(size(Mat,1),size(Mat,2));
seuil = 255*rand;
for i=1:size(Mat,1);
   for j=1:size(Mat,2);
     if Mat(i,j)>seuil;
       bin(i,j)=1;
     else bin(i,j)=0;
     end;
   end;
end

%Visualisation
subplot(1,2,1)
imshow(Mat);
title('Image Originale ');
subplot(1,2,2)
imshow(bin); title ('image binaire') 
end 

