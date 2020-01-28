function convertionBit()

[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
Mat= imread(fichier);

R=uint16(Mat(:,:,1));
G=uint16(Mat(:,:,2));
B=uint16(Mat(:,:,3));

NG=uint8((R+G+B)/3);

subplot(2,2,1);
imshow(Mat)
title('image initiale ')
%-----------------------------------------------------------
subplot(2,2,2);
imshow(NG);
title('image bineaire 1: => (R+G+B)/3')
%-----------------------------------------------------------
NG1 = uint8( 0.299*R + 0.527*G + 0.114*B);
subplot(2,2,3);
imshow(NG1);
title('image bineaire 2: => 0.299*R + 0.527*G + 0.114*B')
%-----------------------------------------------------------
NG2= uint8(0.2125*R + 0.7154*G + 0.0721*B);
subplot(2,2,4);
imshow(NG2)
title('image bineaire 3: => 0.2125*R + 0.7154*G + 0.0721*B')
end 

% traitement avec RGB

%plot((NG,NG1,NG2));