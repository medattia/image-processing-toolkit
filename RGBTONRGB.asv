function NRGB1=RGBTONRGB(mat)
R=double(mat(:,:,1))/255;
G=double(mat(:,:,2))/255;
B=double(mat(:,:,3))/255;

r=R/(R+G+B);
g=G/(R+B+G);
b=B/(R+G+B);

NRGB1=uint8(zeros(size(mat)));

NRGB(:,:,1)=uint8((r*R+g*G+b*B)*255);
NRGB(:,:,2)=uint8((R/(R+G+B))*255);
NRGB(:,:,3)=uint8((G/(R+G+B))*255);

end