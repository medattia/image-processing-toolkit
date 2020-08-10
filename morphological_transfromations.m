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
%========== // Histogramme de l'image //===================
for i = 1:m
    for j = 1:n
            histo(Mat(i,j)+1) = histo(Mat(i,j)+1) + 1 ;
    end
end


%S= input('Entrez le seuil: '); 
%---------------------- binarisation avec un seuiil moyen ------------
seuil = mean(mean(Mat));
Dilat = Dilat >= seuil-25;
Mat = Dilat;
% ==============/ creation de l'element de structure ( Cruciforme) /======
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

% =============== Affichage Graphique ====================
histog = bar(histo);
figure(1)
subplot(221)
bar(histo);
title('Historgrmme avec LUT ');
subplot(222)
imshow(Mat);
title('image bineaire')
subplot(223)
imhist(Mat);
title('Historgrmme Matlab ');
subplot(2,2,4)
imshow(Dilat)

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
% ===== // benearisation de l'image //======
seuil = mean(mean(Mat));
Dilat = Dilat >= seuil-25;
Mat = Dilat;
Bin = Dilat;

for t = 1:10 % boucle sur le sucsetion de delatation erosion 
Mat = Dilat;
%------------------------- Dilatation ---------------------------------
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
%----------------------- erosion ---------------------
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
% ------------- fin de boucle sur dilatation erosion --------------
end

% ======= representation graphique des resulats =============
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



%{
La dilatation de l'opérateur morphologique agit comme un opérateur maximum 
local. L'érosion agit comme un opérateur local minimum. Vous pouvez les
utiliser ensemble pour calculer quelque chose appelé le gradient morphologique
%=========== dilatation  = maximisation celon un stricture donnee ===
%---------------------------------------------------------------------
 La forme de base de la dilatation de l'image en niveaux de gris calcule,
pour chaque pixel d'image, la valeur maximale de ses pixels voisins. 
Le voisinage est défini par l'élément structurant. Par exemple, cet élément structurant:
%--------------------- élément structurant: matlab ----------------------------------
%}
se1 = strel([1 1 1]) % un vecteur elt stru on peut chosit n importe quel type de vect ou matrice ou objet struct
se1 = strel([0 1 0;1 1 1;0 1 0]) % encore la crusiforme
%--------------- Fonction maximisant matlab : imdilate--------------------------
d1 = imdilate(m5, se1) % m5 est un matrice 

%====== eronsion  = minimisation de l'image  celon un stricture donnee ===
e1 = imerode(m5, se1)
%----------------------------------------
%{
 ================ Gradiant morphologic = derivee ===============
On a 3 formes dradiant :
 . dilated_image - eroded_image   % point milieu : centree
 . original_image - eroded_image  % decentee avant 
 . dilated_image - original_image % decentré arrier
%}

% Read in circuit board image, crop it so it's not too big for the blog
% page, and convert it to grayscale:

rgb = imread('board.tif');
I = rgb2gray(rgb(1:256,1:256,:));

se = strel(ones(3,3));
basic_gradient = imdilate(I, se) - imerode(I, se);

subplot(1,2,1), imshow(I), %imcredit('Image courtesy of Alexander V. Panasyuk')

subplot(1,2,2), imshow(basic_gradient, [])

%------------------- gradiant 2 (demi-gradient) ------------------------
% La seconde forme est appelée demi-gradient par érosion ou gradien interne

internal_gradient = I - imerode(I, se);

subplot(1,2,2), imshow(internal_gradient, [])

seh = strel([1 1 1]);
sev = strel([1;1;1]);

%---------------------  Gradiant 3 (gradiant directionnel) -----------------------------
horizontal_gradient = imdilate(I,seh) - imerode(I,seh);
vertical_gradient = imdilate(I,sev) - imerode(I,sev);

subplot(1,2,1)
imshow(horizontal_gradient, []), title('Horizontal gradient')

subplot(1,2,2)
imshow(vertical_gradient, []), title('Vertical gradient')

clear all
close all
[fichier, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

 Mat=imread(fichier); % couloir 90,100,95 femme 125
 I = im2bw(Mat);
 suBplot(2,2,[1 3])
 imshow(Mat);
 title('Image de depart ')
 suBplot(2,2,2)
imshow(I);
title('image bineaire ')
BW= bwmorph(I,'skel',Inf);
subplot(224)
 imshow(BW);
 title('Squellette de image ')
 
function [squelette,radius]=build_squelette_morphomath(picture,radius_disk)
%function [squelette,radius]=build_squelette_morphomath(picture,radius_disk)

k=1;
squelette=zeros(size(picture));
radius = zeros(size(picture));
while(sum(picture(:))~=0)
 O = opening_morpho_2D(picture,radius_disk);
 residu = picture-O;
 squelette = squelette+residu;
 radius = radius+residu*k;
 picture = erosion_morpho_2D(picture,radius_disk);
 imagesc(squelette);
 axis square
 pause(0.01);
 k=k+1;
end
squelette = (squelette>=1);



for(k=1:max(radius_2(:)))
image_temp = double((radius_2<=k) .* (radius_2>k-1));
rebuilt = rebuilt + dilatation(image_temp,k);
end
rebuilt = (rebuilt>0);


function e=dilatation(Mat)
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

%}
%t= choix*2
%[max indice] = max(histo);

histog = bar(histo);
figure(1)
subplot(221)
bar(histo);
title('Historgrmme avec LUT ');
subplot(222)
imshow(Mat);
title('image bineaire')
subplot(223)
imhist(Mat);
title('Historgrmme Matlab ');
subplot(2,2,4)
imshow(Dilat)



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

