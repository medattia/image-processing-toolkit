function YIQ=RGBTOYIQ(mat)
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
Y=0.299*R+0.587*G+0.114*B;
I=0.596*R-0.274*G-0.322*B;
Q=0.211*R-0.523*G+0.312*B;
YIQ(:,:,1)=(Y);
YIQ(:,:,2)=(I);
YIQ(:,:,3)=(Q);

end
%R=uint16(mat(:,:,1))/255;
%G=uint16(mat(:,:,2))/255;
%B=uint16(mat(:,:,3))/255;
%R=double(mat(:,:,1))/255;
%G=double(mat(:,:,2))/255;
%B=double(mat(:,:,3))/255;

%YIQ=uint8(zeros(size(mat)));
%YIQ(:,:,1)=uint8(Y*255);
%YIQ(:,:,2)=uint8(I*255);
%YIQ(:,:,3)=uint8(Q*255);

%R = 1-R;
%G = 1-G;
%B = 1-B;
%YIQ=uint8([Y*255;I*255;Q*255]*255);
