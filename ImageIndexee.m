%Fonction qui transforme une image RGB en une image Indexée
function ImageIndexee(Mat)
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%Lecture de l'image
Mat = imread(fichier);
R=(Mat(:,:,1));
G=(Mat(:,:,2));
B=(Mat(:,:,3));

%Calcul
ind_r=zeros(size(R));
ind_g=zeros(size(G));
ind_b=zeros(size(B));

nbq=input("Nombre de quantification?");
pas=255/nbq
for i=1:size(R,1);
	for j=1:size(R,2);
    ind_r(i,j)=int16((R(i,j)-mod(R(i,j),pas))/pas);
    ind_g(i,j)=int16((G(i,j)-mod(G(i,j),pas))/pas);
    ind_b(i,j)=int16((B(i,j)-mod(B(i,j),pas))/pas);
    indice(i,j)=ind_r(i,j)+ind_g(i,j)*nbq+ind_b(i,j)*nbq*nbq;
    ind(i,j)=uint16((ind_r(i,j)*pas+ind_g(i,j)*pas+ind_b(i,j)*pas)/3);
    R(i,j)=uint8(ind_r(i,j)*pas);
    G(i,j)=uint8(ind_g(i,j)*pas);
    B(i,j)=uint8(ind_b(i,j)*pas);
	end
end 
indexee(:,:,1)=R;
indexee(:,:,2)=G;
indexee(:,:,3)=B;

%Visualisation
subplot(1,2,1)
imshow(Mat);
title('Image RGB ');
subplot(1,2,2)
imshow(indexee);
title('Image Indexée');
end 



