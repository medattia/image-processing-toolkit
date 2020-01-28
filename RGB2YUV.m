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