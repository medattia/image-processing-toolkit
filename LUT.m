function LUT(image)
## Produce histogram counts of image @var{I}.
##
## The second argument can either be @var{n}, a scalar that specifies the number
## of bins; or @var{cmap}, a colormap in which case @var{X} is expected to be
## an indexed image. If not specified, @var{n} defaults to 2 for binary images,
## and 256 for grayscale images.
seuil_bas=input('Seuil bas :');
seuil_haut=input('Seuil haut :');
mat=imread(image);
lut_bin=zeros(256,256);
  for i=1:256
    for j=1:256
  	  if seuil_haut<mat(i,j);
        lut_bin(i,j)=255;
      end
	  end
  end
figure;imshow(lut_bin);
end