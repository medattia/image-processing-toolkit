%Fonction qui transforme une image RGB en Nuance de gris NG avec trois pondérations différentes 
%semblables à celles de matlab
function RGBTOGRAY3()
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%Lecture de l'image
Mat=imread(fichier);
R = Mat(:,:,1);
G = Mat(:,:,2);
B = Mat(:,:,3);
%Calcul
NG=0.299*R+0.587*G+0.114*B;
%Visualisation
subplot(1,2,1)
imshow(Mat);
title('Image initiale ');
subplot(1,2,2)
imshow(NG);
title('Image en nuances de gris');
end 
