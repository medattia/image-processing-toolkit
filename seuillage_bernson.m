%Fonction qui transforme une image en RGB ou  en Nuances de gris en une image binaire
%avec un seuil calculé par la méthode de Bernson
function SeuillageBernson(Mat)
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%Lecture de l'image
Mat = (imread(fichier));
I=Mat;
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
imshow(Mat);
title('Image initiale ');
subplot(1,2,2)
imshow(ImBerson);
title('image binaire Bernson');
end 


function s=seuillagebernsen(mat)
s=zeros(size(mat,1),size(mat,2));
seuil=(max(mat)+min(mat))/2
for i=1:size(mat,1);
   for j=1:size(mat,2);
     if mat(i,j)>seuil;
       s(i,j)=1;
     else s(i,j)=0;
     end;
   end;
end;
end
