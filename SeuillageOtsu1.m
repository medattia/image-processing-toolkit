%Fonction qui transforme une image en RGB ou  en Nuances de gris en une image binaire
%avec un seuil calculé par la méthode d'Otsu 1
function SeuillageOtsu1(Mat)
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%Lecture de l'image
Mat = (imread(fichier));
I=Mat
if length(size(I))==3
    I = rgb2gray(I);
end

%Initialisation
Im_NB          = I;
[counts,value] = imhist(Im_NB);
n              = length(Im_NB(:)); 

%Calcul
Proba = counts/n;
for i = 1 : 255
     
    % Calcul de la probabilité des classes
    Proba1 = Proba(1 : i);
    Proba2 = Proba(i+1 : 255);
    P1 = sum(Proba1);
    P2 = sum(Proba2);
    % Calcul de la moyenne des classes
    n1 = 0:i-1;
    n2 = i:254; 
    Moy1 = sum( n1'.*Proba1)/P1;
    Moy2 = sum( n2'.*Proba2)/P2;
    % Calcul de la variance des classes
    Var1 = sum(((n1 - Moy1).^2)'.*Proba1);
    Var2 = sum(((n2 - Moy2).^2)'.*Proba2);

    VarianceIntraClasse(i) = Var1 + Var2;     
end

% Détermination du seuil %
[Val,Indice] = min(VarianceIntraClasse(1:255));  
seuil        = Indice;

% BINARISATION %
S            = seuil;
imageOtsu1   = zeros(size(Im_NB));
imageOtsu1( Im_NB > S ) = 1;

%Visualisation
subplot(1,3,1)
image_initiale=imshow(Mat);
title('Image initial ')
subplot(1,3,2)
image_NB=imshow(Im_NB);
title('image en noir blanc');
subplot(1,3,3)
image_Finale=imshow(imageOtsu1);
title('image Otsu1')
end 





