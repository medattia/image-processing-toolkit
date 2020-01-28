clear all
close all
[Image, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc � binariser :');
if ~Image
   error('Image 1 n''a �t� d�sign� !')
end
 Mat=imread(Image); % couloir 90,100,95 femme 125

 Mat1=Mat; 
histo = zeros(2^8,1);    % vecteur de taille 256
n = length(Mat1);

for i = 1:n
    for j = 1:n
            
            histo(Mat(i,j)+1) = histo(Mat(i,j)+1) + 1 ;
    end
end


histog = bar(histo);
figure(1)
subplot(211)
bar(histo);
title('Historgrmme avec LUT ');
subplot(212)
imhist(Mat);

title('Historgrmme Matlab ');
