%Histogramme  d'une image en niveau de gris
function Histogramme()
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%Lecture de l'image
mat=uint8(imread(fichier));
NG=rgb2gray(mat); %fonction rgb to gray de MATLAB

%Création du tableau Histogramme
h=zeros(1,256);
for i=1:size(NG,1)
  for j=1:size(NG,2)
    val=NG(i,j);
    h(val+1)=h(val+1)+1;
	end
end

%Affichage
figure;bar(h);colormap("gray"),axis([0 256]),legend('Histogramme');



