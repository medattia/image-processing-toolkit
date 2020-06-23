
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
NG=uint8(0.2125*R+0.7159*G+0.0721*B);
%Visualisation
subplot(1,2,1)
imshow(Mat);
title('Image initiale ');
subplot(1,2,2)
imshow(NG);
title('Image en nuances de gris');
end

%Fonction qui transforme une image RGB en Nuance de gris NG comme moyenne des trois intensités
function RGBTOGRAY1()
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
NG=(R+G+B)/3;
%Visualisation
subplot(1,2,1)
imshow(Mat);
title('Image initiale ');
subplot(1,2,2)
imshow(NG);
title('Image en nuances de gris');
end 


%Fonction qui transforme une image RGB en Nuance de gris NG avec trois pondérations différentes
function RGBTOGRAY2()
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
NG=0.212*R+0.716*G+0.072*B;
%Visualisation
subplot(1,2,1)
imshow(Mat);
title('Image initiale ');
subplot(1,2,2)
imshow(NG);
title('Image en nuances de gris');
end 

