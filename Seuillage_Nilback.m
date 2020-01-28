
clear all
close all
[Image, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Image 1 n''a été désigné !')
end
alpha = 0.2;
mat = imread(Image);
I   = mat ;
I   = im2uint8(I(:)); % ecrire la matrice comme un vect
imageNilback = zeros(size(mat));
[counts,N]=imhist(I); % histogramme de I, N= indice, counts = effctifs de N
Somcum = cumsum(counts);
mu     = sum(N.*counts)/Somcum(end);% mu(end) = mu(255)=mu(lenght(mu)
ecartType = std(I);

% ====== Détermination du seuil avec la methode de Nilback ==========%
 
seuil        = mu + alpha*ecartType;
% ------------------------ BINARISATION ----------------------------- %
imageNilback( mat > seuil ) = 1;

%----------------------- Visualisation ------------------------------
subplot(121)
imshow(mat);
title('image initial ');
subplot(122) %image Finale
imshow(imageNilback);
