%Historgamme normalisee image RGB
clear all;
close all;
clear figure
[image, chemin] = uigetfile('*.jpg','Choisir l''image à transformer:');  %l'utilisateur choisit l'image à transformer
if ~image
   error('Aucun image trouver !')
end
imageRGB=imread(image);

R = imageRGB(:,:,1);
G = imageRGB(:,:,2);
B = imageRGB(:,:,3);

M = size(imageRGB,1);
N = size(imageRGB,2);

histo1 = zeros(1,256);
histo2 = zeros(1,256);
histo3 = zeros(1,256);

for i = 1:M
    for j = 1:N
        histo1(R(i,j)+1) = histo1(R(i,j)+1)+1;
        histo2(G(i,j)+1) = histo2(G(i,j)+1)+1;
        histo3(B(i,j)+1) = histo3(B(i,j)+1)+1;
    end
end

histoNormalise = (histo1 + histo2 + histo3) / (M*N);

%AFFICHAGE DE L'histo

%subplot(1,1,1)
%bar(histoNormalise);
A = reshape(R(:),10,[]);
C = reshape(G(:),10,[]);
D = reshape(B(:),10,[]);

%for k=1:M
 %   for l = 1:N
        
 %Second x value
 %{
 Y=[histo1,histo2,histo3];
xval = 2;
h = bar3(Y,'grouped');
Xdat = get(h,'Xdata');
for ii=1:length(Xdat)
    Xdat{ii}=Xdat{ii}+(xval-1)*ones(size(Xdat{ii}));
    set(h(ii),'XData',Xdat{ii});
end
xlim([0 255]);
view(3);
title('Grouped Style')
xlabel('x');
ylabel('y');
zlabel('z');
 %}
length(R(:))
length(G(:))
length(B(:))
%bar3(A,C,D);
bar3([histo1,histo2,histo3],'grouped')
%bar3(B(:),{0:2:10 0:50:1000});
title('Histogramme normalise')

