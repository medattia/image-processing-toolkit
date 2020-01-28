function XYZ=LABTOXYZ(mat)
## Transform a colormap or image from CIE L*a*b* to CIE XYZ color space.
##
## A color in the CIE L*a*b* (or CIE Lab) space consists of lightness L* and
## two color-opponent dimensions a* and b*. The whitepoint is taken as D65.
## The CIE L*a*b* colorspace is a colorimetric colorspace, meaning that their values
## do not depend on the display device hardware. This colorspace is designed
## to incorporate the human perception of color differences.
##
## A color in the CIE XYZ color space consists of three values X, Y and Z.
## Those values are also designed to be colorimetric.
##
## Input values of class single and double are accepted.
## The shape and the class of the input are conserved.
##
## The input values of L* are normally in the inteval [0, 100]
## and the values of a* and b* in the interval [-127, 127].
lab=mat;
  ## use the whitepoint D65 (reference: en.wikipedia.org/wiki/Illuminant_D65)
  D65 = [0.95047, 1, 1.08883];
  # Matlab truncates to D65_Matlab = [0.9504, 1.0000, 1.0888];

  ## transformation Lab -> XYZ
  L = lab(:,1);
  a = lab(:,2);
  b = lab(:,3);

  L_prime = (L + 16) ./ 116;

  x = D65(1) .* f (L_prime + a./500);
  y = D65(2) .* f (L_prime);
  z = D65(3) .* f (L_prime - b./200);

XYZ(:,:,1)=(x);
XYZ(:,:,2)=(y);
XYZ(:,:,3)=(z);
end

