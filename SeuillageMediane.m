%Fonction qui transforme une image en RGB ou  en Nuances de gris en une image binaire
%avec la mediane comme seuil
function SeuillageMediane(Mat)
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
Med=zeros(size(Mat,1),size(Mat,2));
seuil=mean(Mat);
for i=1:size(Mat,1);
   for j=1:size(Mat,2);
     if Mat(i,j)>seuil;
       Med(i,j)=1;
     else Med(i,j)=0;
     end;
   end;
end

%Visualisation
subplot(1,2,1)
imshow(Mat);
title('Image Originale ');
subplot(1,2,2)
imshow(Med); title ('image binaire mediane') 
end 
