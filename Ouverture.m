clear all
close all
[Image, chemin] = uigetfile('*.png','Choisir l''image noir en blanc � binariser :');
if ~Image
   error('Image 1 n''a �t� d�sign� !')
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
seuil = mean(mean(Mat));
Dilat = Dilat >= seuil-25;
Mat = Dilat;
Bin = Dilat

for t = 1:10 % boucle sur la sucsetion d'erosion et dilatation 
 %================= Erosion de l'image ==================================
% creation de l'element de structure ( Cruciforme) %
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

Mat = Dilat; % mise a jour de tableau 
% ============ dilatation d'image obtenue par erosion =====================
% creation de l'element de structure ( Cruciforme) %
for k = 2:m-1
    for l = 2:n-1
        if(Dilat(k,l) == Mat(k,l))
            if (Dilat(k,l) == 0) 
                Dilat(k-1,l)   = 0;  % 0 = noir et 1 = blanc
                Dilat(k,j-1)   = 0;
                Dilat(k+1,l)   = 0;
                Dilat(k,j+1)   = 0; 
            end
        end
    end
end

end

%--------------------- Affichage Graphique --------------------------------
histog = bar(histo);
figure(1)
subplot(221)
bar(histo);
title('Historgrmme avec LUT ');
subplot(222)
imshow(Bin);
title('image bineaire')
subplot(223)
imhist(Mat);
title('Historgrmme Matlab ');
subplot(2,2,4)
imshow(Dilat)
title('Dilatation image  apres n iteration')