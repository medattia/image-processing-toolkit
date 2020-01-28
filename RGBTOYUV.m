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