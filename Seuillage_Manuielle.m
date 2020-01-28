
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