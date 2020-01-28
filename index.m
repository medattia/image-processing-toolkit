close all
clear all
[Image, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Aucun fichier n''a été désigné !')
end;
mat = imread(Image);
nbq=input("Pas?");

R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));

pas=256/nbq;
for i=1:size(R,1)
	for j=1:size(R,2)
		R(i,j)=quorem(R(i,j),pas) 
	end
end
