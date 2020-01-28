function NTSC=RGBTONTSC(mat)
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
Y=0.30*R+0.587*G+0.11*B;
I=0.599*R-0.2773*G-0.3217*B;
Q=0.213*R-0.5251*G+0.3121*B;
NTSC(:,:,1)=(Y);
NTSC(:,:,2)=(I);
NTSC(:,:,3)=(Q);
end
%R=uint16(mat(:,:,1)/255);
%G=uint16(mat(:,:,2)/255);
%B=uint16(mat(:,:,3)/255);
%NTSC(:,:,1)=uint8(Y*255);
%NTSC(:,:,2)=uint8(I*255);
%NTSC(:,:,3)=uint8(Q*255);
