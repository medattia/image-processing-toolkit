function IM=Seul_Manuel()

[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
eps = input('Entrez le seuil: '); 

M = imread(fichier);
IM = rgb2gray(M);
ImF = zeros(size(IM));
%---------- biniarisation des valeur ----------------
ImF(IM(:,:)>eps)= 255;
%----------------------------------------------------
subplot(1,2,1)
image_initiale=imshow(M);
title('image initial ')
%subplot(1,3,2)
%image_NB=imshow(IM);
subplot(1,2,2)
image_Finale=imshow(ImF);
title('image noir en blanc');