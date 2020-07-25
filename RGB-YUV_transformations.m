function YUV=RGBTOYUV(mat)
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
Y=(R+G+B)/3;
U=(R-B)/2;
V=(-R+2*G-B)/4;
YUV(:,:,1)=(Y);
YUV(:,:,2)=(U);
YUV(:,:,3)=(V);
end
%R=uint16(mat(:,:,1)/255);
%G=uint16(mat(:,:,2)/255);
%B=uint16(mat(:,:,3)/255);
%I1=(R+G+B)/3;
%I2=(R-B)/2;
%I3=(-R+2*G-B)/4;
%YIQ=uint8([Y*255;I*255;Q*255]*255);
%YUV(:,:,1)=uint8(I1*255);
%YUV(:,:,2)=uint8(I2*255);
%YUV(:,:,3)=uint8(I3*255);


function YUV = RGB2YUV(Image)

Mat=imread(Image);

%Mat=double(Mat)
M = imresize(Mat,[256,256]); % redimensionnee de la matrice image
R = Mat(:,:,1); 
G = Mat(:,:,2); 
B = Mat(:,:,3); 

%A=[0.299 0.587 0.114; -0.14713 -0.28886  0.436; 0.615 -0.51498 -0.10001];
    Y = 0.299*R + 0.587*G + 0.114*B;
    U = - 0.14713*R - 0.28886*G + 0.436*B;
    V = 0.615*R - 0.51498*G - 0.10001*B;
    
YUV(:,:,1) = Y;  
YUV(:,:,2) = U;  
YUV(:,:,3) = V; 

subplot(1,2,1);
imshow(M);

subplot(1,2,2);
imshow(YUV);

end


function RGB=YUVTORGB(mat)
Y=mat(:,:,1);
U=mat(:,:,2);
V=mat(:,:,3);
R=Y+U-2*V/3;
G=Y+4*V/3;
B=Y-U-2*V/3;
RGB(:,:,1)=(R);
RGB(:,:,2)=(G);
RGB(:,:,3)=(B);
end
%R=0.33*Y+0.33*U+0.33*V;
%G=0.5*Y-0.5*V;
%B=0.25*Y+0.5*U-0.25*V;


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
