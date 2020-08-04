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


% descripteur H3C : deuxième descripteur
function H3C=histoRGB(im)

HR=histo(im(:,:,1),256)
HG=histo(im(:,:,2),256)
HB=histo(im(:,:,3),256)
H3C=[HR HG HB] %il faut avoir un seul vecteur par concaténation

% descripteur rgb indexe : troisième descripteur
function HRGB=histoIndexeRGB(im,QR,QG,QB)
im_indexe=QNRGB(im,QR,QG,QB)
HRGB=histo(im_indexe,QR*QG*QB)

endclear all
clc 
[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
Mat= imread(fichier);

R=Mat(:,:,1);
G=Mat(:,:,2);
B=Mat(:,:,3);

subplot(1,2,1);
imshow(Mat)
title('image initiale ')

%Création du tableau Histogramme

%R= zeros(256,1);
%G= zeros(256,1);
%B= zeros(256,1);
m = max(size(Mat,1),size(Mat,2));
Index = zeros(m,1);

for i=1:m
        if ( (i-1)*5 <= Index(i) & Index(i)<= i*5 )
        Index(i) = (i-1) + 2 ;        
        end
end
%========= Image indexee =========================
size(Mat)
size(Mat,1)
size(Mat,2)

for j = 1:size(Mat,1);
    for k = 1:size(Mat,2);
        if ( (i-1)*5 <= R(j,k) & R(j,k)<= i*5 )
        R(j,k) = j + (i*5 - (i-1)*5)/2;
    end
    end
end

for j = 1:size(Mat,1);
    for k = 1:size(Mat,2);
        if ( (i-1)*5 <= G(j,k) & G(j,k)<= i*5 )
        G(j,k) = j + (i*5 - (i-1)*5)/2;
    end
    end
end

for j = 1:size(Mat,1);
    for k = 1:size(Mat,2);
        if ( (i-1)*5 <= B(j,k) & B(j,k)<= i*5 )
        B(j,k) = j + (i*5 - (i-1)*5)/2;
    end
    end
end

Mat(:,:,1) = R;
Mat(:,:,2) = G;
Mat(:,:,3) = B;
subplot(1,2,2);
imshow(Mat)
