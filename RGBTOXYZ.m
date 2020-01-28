function XYZ=RGBTOXYZ(mat)
## Transform a colormap or image from sRGB to CIE XYZ color space.
## A color in the CIE XYZ color space consists of three values X, Y and Z.
## Those values are designed to be colorimetric, meaning that their values
## do not depend on the display device hardware.
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
X=0.4124*R+0.3576*G+0.1805*B;
Y=0.2126*R+0.7152*G+0.0722*B;
Z=0.0193*R+0.1192*G+0.9505*B;
XYZ(:,:,1)=(X);
XYZ(:,:,2)=(Y);
XYZ(:,:,3)=(Z);
end

