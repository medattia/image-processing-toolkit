[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

M = imread(fichier);
Mat = M;
[m,n,t] = size(M);

R = M(:,:,1);
G = M(:,:,2);
B = M(:,:,3);

% --------------Allocation des tableau de meme 
nIter = max(m,n)
if nIter<256
    nIter = 256;
end

pas = input('donne le pas : ');
SegtIm = zeros(nIter,1);

k = mod(m,pas);

for i=1:m
    for j =1:m
        Binf = 
       if (SegtIm(i)<= 63)
        SegtIm(i)= 63;
       elseif (63< SegtIm(i) & SegtIm(i)<=127)
               SegtIm(i)= 127;
       elseif (127< SegtIm(i) & SegtIm(i)<=191)
               SegtIm(i)= 191;
       else
               SegtIm(i)= 255;
       end
end

for j=1:m
    for k=1:n
        R(j,k)= SegtIm(R(j,k)+1);
        G(j,k)= SegtIm(G(j,k)+1);
        B(j,k)= SegtIm(B(j,k)+1);
    end
end
    R = M(:,:,1);
    G = M(:,:,2) ;
    B = M(:,:,3);
 
 subplot(1,2,1)
 imshow(Mat)
 title('image original')
 subplot(1,2,2)
imshow(M)
title('image segmentee sur 3 intervale')
end
 