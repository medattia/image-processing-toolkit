%Fonction qui transforme une image RGB en une image RGB normalisée
function RGBTONrgb2()
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%Lecture de l'image
M = imread(fichier);
R = double(M(:,:,1)/255); 
G = double(M(:,:,2)/255); 
B = double(M(:,:,3)/255); 

%Calcul % ============ NRGB2 (RGB noralisee 2) c1+c2+c3=1 ================
c1 = 0.3; c2 = 0.3; c3=0.4;

SOM_RGB = double(R + G + B);
g = double(G./SOM_RGB);
b = double(B./SOM_RGB);

Y = double(c1.*R + c2.*G + c3.*B);
T1 = g;
T2 = b;

    Normal_RGB2(:,:,1)=Y*255;
    Normal_RGB2(:,:,2)=T1*255;
    Normal_RGB2(:,:,3)=T2*255;
    

%Visualisation
subplot(1,2,1)
imshow(M);
title('image initiele');
subplot(1,2,2);
imshow(Normal_RGB2);
title('image normalisee 2');
end 

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
function NRGB1=RGBTONRGB(mat)
R=double(mat(:,:,1))/255;
G=double(mat(:,:,2))/255;
B=double(mat(:,:,3))/255;

r=R/(R+G+B);
g=G/(R+B+G);
b=B/(R+G+B);

NRGB1=uint8(zeros(size(mat)));

NRGB(:,:,1)=uint8((r*R+g*G+b*B)*255);
NRGB(:,:,2)=uint8((R/(R+G+B))*255);
NRGB(:,:,3)=uint8((G/(R+G+B))*255);

end
