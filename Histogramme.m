clear all
close all
[Image, chemin] = uigetfile('*.pgm','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Image 1 n''a été désigné !')
end
 Mat=imread(Image); % couloir 90,100,95 femme 125

 Mat1=Mat; 
histo = zeros(2^8,1);    % vecteur de taille 256
n = length(Mat1);


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


histog = bar(histo);
figure(1)
subplot(211)
bar(histo);
title('Historgrmme avec LUT ');
subplot(212)
imhist(Mat);

title('Historgrmme Matlab ');


