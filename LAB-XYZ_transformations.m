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

function LAB=XYZTOLAB(mat)
## Transform a colormap or image from CIE XYZ to CIE L*a*b* color space.
##
## A color in the CIE XYZ color space consists of three values X, Y and Z.
## Those values are designed to be colorimetric, meaning that their values
## do not depend on the display device hardware.
##
## A color in the CIE L*a*b* (or CIE Lab) space consists of lightness L* and
## two color-opponent dimensions a* and b*. The whitepoint is taken as D65.
## The CIE L*a*b* colorspace is also a colorimetric colorspace. It is designed
## to incorporate the human perception of color differences.
##
## The return values of L* are normally in the inteval [0, 100]
## and the values of a* and b* in the interval [-127, 127]
##
%X=mat(:,:,1);
%Y=mat(:,:,2);
%Z=mat(:,:,3);
  ## normalize with the whitepoint D65
  ## (reference: en.wikipedia.org/wiki/Illuminant_D65)
  D65 = [0.95047, 1, 1.08883];
  xyz_D65 = mat ./ D65;
  # Matlab truncates to D65_Matlab = [0.9504, 1.0000, 1.0888];

  ## transformation xyz -> xyz'
  epsilon = (6/29)^3;
  kappa = 1/116 * (29/3)^3;
  xyz_prime = xyz_D65;
  mask = xyz_D65 <= epsilon;
  xyz_prime(mask) = kappa .* xyz_D65(mask) + 16/116;
  xyz_prime(! mask) = xyz_D65(! mask) .^(1/3);
  x_prime = xyz_prime(:,1);
  y_prime = xyz_prime(:,2);
  z_prime = xyz_prime(:,3);

L = 116 .* y_prime - 16;
a = 500 .* (x_prime - y_prime);
b = 200 .* (y_prime -  z_prime);
LAB(:,:,1)=(L);
LAB(:,:,2)=(a);
LAB(:,:,3)=(b);
end
