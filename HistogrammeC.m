function Histogramme(image)
## Produce histogram counts of image @var{I}.
##
## The second argument can either be @var{n}, a scalar that specifies the number
## of bins; or @var{cmap}, a colormap in which case @var{X} is expected to be
## an indexed image. If not specified, @var{n} defaults to 2 for binary images,
## and 256 for grayscale images.
mat=imread(image);
h=zeros(1,256);
  for i=1:size(mat,1)
    for j=1:size(mat,2)
      val=mat(i,j);
      h(val+1)=h(val+1)+1;
    end
  end
hc=zeros(1,256);
hc(1)=h(1);
  for i=2:256
      hc(i)=h(i)+hc(i-1);
  end
end