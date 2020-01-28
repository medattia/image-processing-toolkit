clear all
close all
[Image1, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~Image1
   error('Image 1 n''a été désigné !')
end
 Mat1=imread(Image1); % couloir 90,100,95 femme 125
[Image2, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~Image2
   error('Image 2 n''a été désigné !')
end
n = 256; %length(Mat1);
Mat2=imread(Image2); % couloir 90,100,95 femme 125
UnionIm = Mat1;
InterIm = Mat1;
%--------------------------------------------------------------------------
seuil_bas = 120;
seuil_haut = 255;
%================== construction de lut_bin et son complement Complt ======
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
% Mat1 et Mat2 sous forme binaire (qui prend deux valeur 0 ou 255).
for i = 1:n
    for j = 1:n
            
            Mat1(i,j)  =  lut_bin(Mat1(i,j)+1);
            Mat2(i,j)  =  lut_bin(Mat2(i,j)+1);
    end
end

%----------------- l'Union et Intersection de deux image --------------------------
for l = 1:n
    for m = 1:n
            if ((Mat1(l,m)== 0) & (Mat2(l,m)==0))
                UnionIm(l,m) = 0;
                InterIm(l,m) = 0;
            else if ((Mat1(l,m)==1) & (Mat2(l,m)==0)) || ((Mat1(l,m)==0) & (Mat2(l,m)==1))
                UnionIm(l,m)  = 0;
                IterIm(l,m)   = 1;
            else 
                UnionIm(l,m) = 1;
                InterIm(l,m) = 1;
                end
            end
    end
end



subplot(221)
imshow(256*Mat1)
title('Image max 2')
subplot(222)
imshow(256*Mat2)
title('Image 2')
subplot(224)
imshow(256*UnionIm)
title('Union de 2 image ')
subplot(223)
imshow(256*InterIm)
title('Intersection de 2 Images ')
