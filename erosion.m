clear all
close all
[Image, chemin] = uigetfile('*.png','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Image 1 n''a été désigné !')
end
 Mat=imread(Image); % couloir 90,100,95 femme 125
Dim = size(Mat);
%--------- si l'image est en couleur on le converti en noir-blanc ---------
if  (length(Dim)==3)
    Mat = rgb2gray(Mat); % convertir en noir en blanc
   % Mat = im2bw(Mat);   % pour binearisation de l'image 
end
%--------------------------------------------------------------------------
 Dilat = Mat;
 [m,n]= size(Mat);
histo = zeros(256,1);    % vecteur de taille max de la matrice

%choix = menu('Couleur chercher dans Imge ', 'Noir ',' gris ',' Blanc ')
for i = 1:m
    for j = 1:n
            histo(Mat(i,j)+1) = histo(Mat(i,j)+1) + 1 ;
    end
end


%S= input('Entrez le seuil: '); 
% /---------------- binearisation --------------------/
seuil = mean(mean(Mat));
Dilat = Dilat >= seuil-25;
Mat = Dilat;
% ============== creation de l'element de structure ( Cruciforme) ========%
for k = 2:m-1
    for l = 2:n-1
        if(Dilat(k,l) == Mat(k,l))
            if (Dilat(k,l) == 1) 
                Dilat(k-1,l)   = 1;  % 0 = noir et 1 = blanc
                Dilat(k,j-1)   = 1;
                Dilat(k+1,l)   = 1;
                Dilat(k,j+1)   = 1; 
            end
        end
    end
end

%===================== Affichage =========================
histog = bar(histo);
subplot(121)
imshow(Mat);
title('image bineaire')
subplot(122)
imshow(Dilat)
title('image dilatee ')
