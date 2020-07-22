
function Seuil_Moy_Med()
[Image, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Aucun fichier n''a été désigné !')
end

Mat = imread(Image);
M = Mat;
if length(size(Mat))==3
    Mat = rgb2gray(Mat);
end
Moy  = Mat; 
Med = Mat;
seuil_moy = mean(mean(Moy));
seuil_med = median(median(Med));
%--------------binearisation ---------------------
Moy(Moy<seuil_moy)   = 1;
Med(Med<seuil_med) = 1;
%-------------------------------------------------
subplot (1,3,1)
imshow(M); title ('image originale ');
subplot (1,3,2)
imshow(Moy); title ('image niveau de gris moyenne ');
subplot (1,3,3)
imshow(Med);  title ('image niveau de gris Medianne');

function s=seuillagemed(mat)
s=zeros(size(mat,1),size(mat,2));
seuil=median(mat)
for i=1:size(mat,1);
   for j=1:size(mat,2);
     if mat(i,j)>seuil;
       s(i,j)=1;
     else s(i,j)=0;
     end;
   end;
end;

function s=seuillagemoy(mat)
s=zeros(size(mat,1),size(mat,2));
seuil=median(mat)
for i=1:size(mat,1);
   for j=1:size(mat,2);
     if mat(i,j)>seuil;
       s(i,j)=1;
     else s(i,j)=0;
     end;
   end;
end;
end
function im=seuilautomoy(mat)
R=uint16(mat(:,:,1));
G=uint16(mat(:,:,2));
B=uint16(mat(:,:,3));
%for i=1..size(R,1)
 % for j=1..size(R,2)
  %    if R<=50
   %     R=0
    %  else R=255
     % endif
 % end
%end
im=uint8(0.299*R+0.537*G+0.0114*B);
if im<=200
  im=0
  else
  im=255
end
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
