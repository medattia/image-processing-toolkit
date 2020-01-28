function Seuil_Moy_Med()
[Image, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Aucun fichier n''a été désigné !')
end

Mat = imread(Image);
M = Mat;
if length(size(Mat))==3
    Mat = rgb2gray(Mat);
end
Moy  = Mat; 
Med = Mat;
seuil_moy = mean(mean(Moy));
seuil_med = median(median(Med));
%--------------binearisation ---------------------
Moy(Moy<seuil_moy)   = 1;
Med(Med<seuil_med) = 1;
%-------------------------------------------------
subplot (1,3,1)
imshow(M); title ('image originale ');
subplot (1,3,2)
imshow(Moy); title ('image niveau de gris moyenne ');
subplot (1,3,3)
imshow(Med);  title ('image niveau de gris Medianne');