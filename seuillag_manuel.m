clear all
close all
[Image, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Image 1 n''a été désigné !')
end
 Mat=imread(Image); % couloir 90,100,95 femme 125

S= input('Entrez le seuil: '); 
result = zeros(size(Mat));

%--------- binearisation de l'image ---------------
result( Mat > S ) = 1;
% --------------- affichage graphe ---------------
subplot(1,3,1)
image_initiale=imshow(Mat);
subplot(1,3,3)
image_Finale=imshow(result);

function im=seuilmanuel(mat)
R=uint16(mat(:,:,1));
G=uint16(mat(:,:,2));
B=uint16(mat(:,:,3));
im=uint8((R+G+B)/3);

for i=1..size(im,1)
  for j=1..size(im,2)
if im<=50
  im=0
  else
  im=255
     endif
  end
end

end

%Fonction qui transforme une image en RGB ou  en Nuances de gris en une image binaire
%avec un seuil choisi par l'utilisateur
function SeuillageManuel(Mat)
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
seuil = input('Entrez le seuil: '); 
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

function IM=Seul_Manuel()

[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
eps = input('Entrez le seuil: '); 

M = imread(fichier);
IM = rgb2gray(M);
ImF = zeros(size(IM));
%---------- biniarisation des valeur ----------------
ImF(IM(:,:)>eps)= 255;
%----------------------------------------------------
subplot(1,2,1)
image_initiale=imshow(M);
title('image initial ')
%subplot(1,3,2)
%image_NB=imshow(IM);
subplot(1,2,2)
image_Finale=imshow(ImF);
title('image noir en blanc');


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
