function yiq=I2RGB()

[fichier, chemin] = uigetfile('*.JPG','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

IM = imread(fichier);

R = IM(:,:,1)/255;
G = IM(:,:,2)/255;
B = IM(:,:,3)/255;

% ------------ les pas des fonctions -------------------
I1 = uint8((R + G +B)/3);
I2 = uint8((R-B)/2);
I3 = uint8((2*G - R - B)/4);

yiq(:,:,1)= I1*255;
yiq(:,:,2)= I2*255;
yiq(:,:,3)= I3*255;
%---------------- espace inverse ---------------
R = uint8(I1 + I2 - 0.6667*I3);
G = uint8(I1 + 1.3333*I3);
B = uint8(I1 - I2 - 0.6667*I3);

IM(:,:,1)= uint8(R*255);
IM(:,:,2)= uint8(G*255);
IM(:,:,3)= uint8(B*255);

subplot(1,2,1);
imshow(uint8(yiq));

subplot(1,2,2);
imshow(uint8(IM));
end