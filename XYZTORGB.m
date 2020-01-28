function RGB=XYZTORGB(mat)
## Transform a colormap or image from CIE XYZ to sRGB color space.
## A color in the CIE XYZ color space consists of three values X, Y and Z.
## Those values are designed to be colorimetric, meaning that their values
## do not depend on the display device hardware.
X=mat(:,:,1);
Y=mat(:,:,2);
Z=mat(:,:,3);
R=3.2406*X-1.5372*Y-0.4986*Z;
G=-0.9689*X+1.8758*Y+0.0415*Z;
B=0.0557*X-0.2040*Y+1.0570*Z;
RGB(:,:,1)=(R);
RGB(:,:,2)=(G);
RGB(:,:,3)=(B);
end
