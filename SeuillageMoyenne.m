%Fonction qui transforme une image en RGB ou  en Nuances de gris en une image binaire
%avec la moyenne comme seuil
function SeuillageMoyenne(Mat)
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
Moy=zeros(size(Mat,1),size(Mat,2));
seuil=mean(Mat);
for i=1:size(Mat,1);
   for j=1:size(Mat,2);
     if Mat(i,j)>seuil;
       Moy(i,j)=1;
     else Moy(i,j)=0;
     end;
   end;
end

%Visualisation
subplot(1,2,1)
imshow(Mat);
title('Image Originale ');
subplot(1,2,2)
imshow(Moy); title ('image binaire moyenne') 
end 
