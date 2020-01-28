function Normalzed_RGB()

[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

Mat = imread(fichier);
%Mat=double(Mat)
M=Mat;
% ============ NRGB1 (RGB noralisee 1) ================
R = double(M(:,:,1)/255); 
G = double(M(:,:,2)/255); 
B = double(M(:,:,3)/255); 
 SOM_RGB = double(R + G + B);
r = double(R./SOM_RGB);
g = double(G./SOM_RGB);
b = double(B./SOM_RGB);

    Normal_RGB(:,:,1)=r*255;
    Normal_RGB(:,:,2)=g*255;
    Normal_RGB(:,:,3)=b*255;
    
subplot(2,2,1);
imshow(Mat);
title('image initiele');
subplot(2,2,2);
imshow(Normal_RGB);
title('image normalisee 1');

% ============ NRGB2 (RGB noralisee 2) c1+c2+c3=1 ================
c1 = 0.3; c2 = 0.3; c3=0.4;

Y = double(c1.*R + c2.*G + c3.*B);
T1 = g;
T2 = b;

    Normal_RGB2(:,:,1)=Y*255;
    Normal_RGB2(:,:,2)=T1*255;
    Normal_RGB2(:,:,3)=T2*255;
    
subplot(2,2,3:4);
imshow(uint8(Normal_RGB2))
title('noralisee 2:=> c1+c2+c3=1')
end
