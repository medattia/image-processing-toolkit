function CIE2=RGBTOCIE2(mat)
% RGB to CIE (L*a*b) (or CIE Lab) 
## A color in the CIE L*a*b* (or CIE Lab) space consists of lightness L* and
## two color-opponent dimensions a* and b*. The whitepoint is taken as D65.
## The CIE L*a*b* colorspace is also a colorimetric colorspace. It is designed
## to incorporate the human perception of color differences.
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
L=0.30*R+0.587*G+0.11*B;
u=0.599*R-0.2773*G-0.3217*B;
v=0.213*R-0.5251*G+0.3121*B;
CIE2(:,:,1)=(L);
CIE2(:,:,2)=(u);
CIE2(:,:,3)=(v);
end

