function h=histo(mat,N)
## Produce histogram counts of image
mat=rgb2gray(imread('image.png'));
[nl nc]=size(mat);

h=zeros(1,256);
for i=1:nl
  for j=1:nc
    h(1,mat(i,j)+1)=h(1,mat(i,j)+1)+1;
	end
end
figure;bar(h);colormap("gray"),axis([0 256]),legend('Histogramme');
end

