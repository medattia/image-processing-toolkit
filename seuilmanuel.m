clear all
close all
[Image, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Image 1 n''a été désigné !')
end
 Mat=imread(Image); % couloir 90,100,95 femme 125

S= input('Entrez le seuil: '); 
result = zeros(size(Mat));

%--------- binearisation de l'image ---------------
result( Mat > S ) = 1;
% --------------- affichage graphe ---------------
subplot(1,3,1)
image_initiale=imshow(Mat);
subplot(1,3,3)
image_Finale=imshow(result);

function im=seuilmanuel(mat)
R=uint16(mat(:,:,1));
G=uint16(mat(:,:,2));
B=uint16(mat(:,:,3));
im=uint8((R+G+B)/3);

for i=1..size(im,1)
  for j=1..size(im,2)
if im<=50
  im=0
  else
  im=255
     endif
  end
end

end
