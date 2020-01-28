function CIE1=RGBTOCIE1(mat)
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
L=0.30*R+0.587*G+0.11*B;
u=0.599*R-0.2773*G-0.3217*B;
v=0.213*R-0.5251*G+0.3121*B;
CIE1(:,:,1)=(L);
CIE1(:,:,2)=(u);
CIE1(:,:,3)=(v);
end

