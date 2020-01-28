function M = YUV2RGB()

[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

%RGB= imread('IM.jpg');
%YCBCR = rgb2ycbcr(RGB);

 YUV = rgb_to_yuv(fichier);
 Y=YUV(:,:,1);
 U=YUV(:,:,2);
 V=YUV(:,:,3);

    R = Y + 1.13983*V;
    G = Y - 0.39465*U - 0.58060*V;
    B = Y + 2.03211*U ;
    
    RGB(:,:,1)=R;
    RGB(:,:,2)=G;
    RGB(:,:,3)=B;
    
subplot(1,2,1);
imshow(YUV);

subplot(1,2,2);
imshow(RGB);

end