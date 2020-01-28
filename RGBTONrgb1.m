%Fonction qui transforme une image RGB en une image RGB normalisée
function RGBTONrgb1()
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%Lecture de l'image
M = imread(fichier);

R = double(M(:,:,1)/255); 
G = double(M(:,:,2)/255); 
B = double(M(:,:,3)/255); 

%Calcul NRGB1 (RGB noralisee 1) ================
SOM_RGB = double(R + G + B);
r = double(R./SOM_RGB);
g = double(G./SOM_RGB);
b = double(B./SOM_RGB);

    Normal_RGB(:,:,1)=r*255;
    Normal_RGB(:,:,2)=g*255;
    Normal_RGB(:,:,3)=b*255;
    

%Visualisation
subplot(1,2,1)
imshow(M);
title('image initiele');
subplot(1,2,2);
imshow(Normal_RGB);
title('image normalisee 1');
end 
