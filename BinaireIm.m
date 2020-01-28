clear all
close all
[fichier, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%nb = rgb2gray('fichier');
% transformation d'image en NOIR en BLANC
%image=input('Creer un Tableau de taille 255 : ')
% Mat=imread('image'); % amtrice d'image en 2d car il en noir en blanc
 Mat=imread(fichier); % couloir 90,100,95 femme 125
 Mat1     = Mat;
 ImComplt = Mat;
lut_bin = zeros(2^8,1); % vecteur de taille 256
Complt  = zeros(2^8,1); % vecteur de taille 256
n = length(Mat1);

seuil_bas = 120;
seuil_haut = 255;
%========= construction de lut_bin et son complement Complt ===============
for k = 1:n
        if ((k <= seuil_bas) || (k >= seuil_haut))
            lut_bin(k)=0;
            Complt(k)=1;
        else
            lut_bin(k)=1;
            Complt(k)=0;
    end
end

%--------------------------------------------------------------------------
% utilisation du tableau lut_bin pour faire une mise à jour de 2 tableaux
% tableau Mat1 et Mat2 sous forme binaire (qui prend deux valeur 0 ou 255).
for i = 1:n
    for j = 1:n
            
            Mat(i,j)      =  lut_bin(Mat(i,j)+1);
            ImComplt(i,j) =  Complt(ImComplt(i,j)+1);
    end
end
% --------------------- representation graphique -------------------------
subplot(1,3,1)
imshow(Mat1)
title('Image originale')
subplot(1,3,2)
imshow(256*Mat)
title('Image finale(LUT): seuil_b = 90; seuil_h = 255;')
subplot(1,3,3)
imshow(256*ImComplt)
title('Complement de image bineaire ')

