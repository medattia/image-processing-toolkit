clear all
clc 
[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
Mat= imread(fichier);

R=Mat(:,:,1);
G=Mat(:,:,2);
B=Mat(:,:,3);

subplot(1,2,1);
imshow(Mat)
title('image initiale ')

%Création du tableau Histogramme

%R= zeros(256,1);
%G= zeros(256,1);
%B= zeros(256,1);
m = max(size(Mat,1),size(Mat,2));
Index = zeros(m,1);

for i=1:m
        if ( (i-1)*5 <= Index(i) & Index(i)<= i*5 )
        Index(i) = (i-1) + 2 ;        
        end
end
%========= Image indexee =========================
size(Mat)
size(Mat,1)
size(Mat,2)

for j = 1:size(Mat,1);
    for k = 1:size(Mat,2);
        if ( (i-1)*5 <= R(j,k) & R(j,k)<= i*5 )
        R(j,k) = j + (i*5 - (i-1)*5)/2;
    end
    end
end

for j = 1:size(Mat,1);
    for k = 1:size(Mat,2);
        if ( (i-1)*5 <= G(j,k) & G(j,k)<= i*5 )
        G(j,k) = j + (i*5 - (i-1)*5)/2;
    end
    end
end

for j = 1:size(Mat,1);
    for k = 1:size(Mat,2);
        if ( (i-1)*5 <= B(j,k) & B(j,k)<= i*5 )
        B(j,k) = j + (i*5 - (i-1)*5)/2;
    end
    end
end

Mat(:,:,1) = R;
Mat(:,:,2) = G;
Mat(:,:,3) = B;
subplot(1,2,2);
imshow(Mat)

    
