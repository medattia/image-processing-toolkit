function seuil = Otsou2()
[Image, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Aucun fichier n''a été désigné !')
end

I         = imread(Image);
M         = I;
if length(size(I))==3
    I = rgb2gray(I);
end
Im_NB          = I;
[counts,value] = imhist(Im_NB);

n              = length(Im_NB(:)); % n = N*M

%Med            = Im_NB;
%seuil_moy = mean(Im_NB(:));
%seuil_med = median(Im_NB(:));
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
    VarianceIntraClasse(i) = abs(Moy1-Moy2)*P1*P2;     
end
% Détermination du seuil %
[Val,Indice] = max(VarianceIntraClasse(1:255));  
seuil        = Indice;
% BINARISATION %
S            = seuil;
imageOtsu1   = zeros(size(Im_NB));
imageOtsu1( Im_NB > S ) = 1;
%Visualisation
subplot(1,3,1)
image_initiale=imshow(M);
subplot(1,3,2)
image_NB=imshow(Im_NB);
subplot(1,3,3)
image_Finale=imshow(imageOtsu1);

