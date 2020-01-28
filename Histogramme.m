function Histogramme()
## Produce histogram counts of image @var{I}.
##
## The second argument can either be @var{n}, a scalar that specifies the number
## of bins; or @var{cmap}, a colormap in which case @var{X} is expected to be
## an indexed image. If not specified, @var{n} defaults to 2 for binary images,
## and 256 for grayscale images.
mat=imread('image.png');
b=rgb2gray(mat);
R=(mat(:,:,1));
%G=(mat(:,:,2));
%B=(mat(:,:,3));
%HISTR=zeros(1,256);
%HISTG=zeros(1,256);
%HISTB=zeros(1,256);
h=zeros(1,256);
for i=1:size(R,1)
  for j=1:size(R,2)
    %valR=R(i,j);
    %HISTR(valR+1)=HISTR(valR+1)+1;
    %valG=G(i,j);
    %HISTG(valG+1)=HISTG(valG+1)+1;
    %valB=B(i,j);
    %HISTB(valB+1)=HISTR(valB+1)+1;
    val=b(i,j);
    h(val+1)=h(val+1)+1;
	end
end
%HIST=HISTR+HISTG+HISTB;
%figure;plot(HISTR);legend('Histogramme Rouge');
%figure;plot(HISTG);legend('Histogramme Vert');
%figure;plot(HISTB);legend('Histogramme Bleu');
figure;bar(h);colormap("gray"),axis([0 256]),legend('Histogramme');
figure;hist(h,"facecolor", "r", "edgecolor", "b");colormap("gray"),legend('Histogramme');
figure;stairs(h);colormap("gray"),colorbar("SouthOutside", "xticklabel", []),axis([0 256]),legend('Histogramme');
end

