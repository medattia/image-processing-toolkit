function yiq=RGB2I()

[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

IM = imread(fichier);

R = IM(:,:,1)/255;
G = IM(:,:,2)/255;
B = IM(:,:,3)/255;

% ------------ les pas des fonctions -------------------
I1 = (R + G +B)/3;
I2 = (R-B)/2;
I3 = (2*G - R - B)/4;

yiq(:,:,1)=I1*255;
yiq(:,:,2)=I2*255;
yiq(:,:,3)=I3*255;

subplot(1,2,1);
imshow(yiq);

subplot(1,2,2);
imshow(uint8(IM));
end