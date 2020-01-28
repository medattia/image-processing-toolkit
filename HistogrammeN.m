function HistogrammeN()
## Histogramme Normalisé
mat=imread('image.png');
b=rgb2gray(mat);
h=zeros(1,256);
for i=1:size(b,1)
  for j=1:size(b,2)
    val=b(i,j);
    h(val+1)=h(val+1)+1;
	end
end
for i=2:256
  for j=1:i-1
    h(i)=h(i)+h(i-j);
	end
end
figure;bar(h);colormap("gray"),axis([0 256]),legend('Histogramme Normalisé');
end
