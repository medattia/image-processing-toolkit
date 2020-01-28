function  HSV2RGB()

[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

M= imread(fichier);
HSV = rgb2hsv(fichier);
[m,n,t] = size(HSV);
RGB = zeros(m,n,t);
% --------------Allocation des tableau de meme 
R = zeros(m,n);
G = zeros(m,n);
B = zeros(m,n);

H = HSV(:,:,1);
S = HSV(:,:,2);
V = HSV(:,:,3);
for i=1:m
    for j = 1:n
       % if ((0<= H(i,j) & H(i,j)< 360) & (0<= S(i,j) & S(i,j)<=1) & (0<= V(i,j) & V(i,j)<= 1))
            C =double(V(i,j)*S(i,j));
            X = double(C*(1 - abs(mod(double(H(i,j)/60),2) -1)));
            m = double(V(i,j) - C);
        
       if ((0<=H(i,j))& (H(i,j)<60))
            r = C;
            g = X;
            b = 0;
        elseif ((60 <=H(i,j))& (H(i,j)<120))
            r = X;
            g = C;
            b = 0;
        elseif ((120<=H(i,j))& (H(i,j)<180))
            r = 0;
            g = C;
            b = X;
       elseif ((180 <=H(i,j))& (H(i,j)<240))
            r = 0;
            g = X;
            b = C;
       elseif ((240 <=H(i,j))& (H(i,j)<300))
            r = X;
            g = 0;
            b = C;
        else %((300 <=H(i,j))& (H(i,j)<360))
            r = C;
            g = 0;
            b = X;
            
 R(i,j) = (r+m)*255;
 G(i,j) = (g+m)*255;
 B(i,j) = (b+m)*255;
        end
    end
    RGB(:,:,1) = R;
    RGB(:,:,2) = G;
    RGB(:,:,3) = B;
 
 subplot(1,3,1)
 imshow(M);
 title('image original')
 subplot(1,3,2)
imshow(HSV);
title('image RGB to HSV')
subplot(1,3,3)
imshow(uint8(RGB));
title('image HSV to RGB')
end
 