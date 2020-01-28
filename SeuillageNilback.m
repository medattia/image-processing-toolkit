%Fonction qui transforme une image en RGB ou  en Nuances de gris en une image binaire
%avec un seuil calculé par la méthode de Nilback
function SeuillageNilback(Mat)
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%Lecture de l'image
M         = imread(fichier);
I         = M;
if length(size(I))==3
    I = rgb2gray(I);
end

alpha       = 0.2;
ImNilback = zeros(size(I)); % allocation

I = im2uint8(I(:)); % ecrire la matrice comme un vect
[counts,N]=imhist(I); % histogramme de I, N= indice, counts = effctifs de N
Somcum = cumsum(counts);
mu     = sum(N.*counts)/Somcum(end);% mu(end) = mu(255)=mu(lenght(mu)
ecartType = std(I);


% D�termination du seuil %
 
seuil        = mu + alpha*ecartType;
% BINARISATION %
ImNilback( I > seuil ) = 1;

%Visualisation
subplot(1,2,1)
image_initiale=imshow(M);
title('Image de depart');
subplot(1,2,2)
imshow(ImNilback);
title('Image Nir Blanc par mathode Nilback');
