%Fonction qui transforme une image RGB en une image Indexée
function ImageIndexee(Mat)
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%Lecture de l'image
Mat = imread(fichier);
R=(Mat(:,:,1));
G=(Mat(:,:,2));
B=(Mat(:,:,3));

%Calcul
ind_r=zeros(size(R));
ind_g=zeros(size(G));
ind_b=zeros(size(B));

nbq=input("Nombre de quantification?");
pas=255/nbq
for i=1:size(R,1);
	for j=1:size(R,2);
    ind_r(i,j)=int16((R(i,j)-mod(R(i,j),pas))/pas);
    ind_g(i,j)=int16((G(i,j)-mod(G(i,j),pas))/pas);
    ind_b(i,j)=int16((B(i,j)-mod(B(i,j),pas))/pas);
    indice(i,j)=ind_r(i,j)+ind_g(i,j)*nbq+ind_b(i,j)*nbq*nbq;
    ind(i,j)=uint16((ind_r(i,j)*pas+ind_g(i,j)*pas+ind_b(i,j)*pas)/3);
    R(i,j)=uint8(ind_r(i,j)*pas);
    G(i,j)=uint8(ind_g(i,j)*pas);
    B(i,j)=uint8(ind_b(i,j)*pas);
	end
end 
indexee(:,:,1)=R;
indexee(:,:,2)=G;
indexee(:,:,3)=B;

%Visualisation
subplot(1,2,1)
imshow(Mat);
title('Image RGB ');
subplot(1,2,2)
imshow(indexee);
title('Image Indexée');
end 

%Fonction qui transforme une image RGB en une image Indexée
function QNRGB = Ind_RGB(Mat,QR,QG,QB)

%lecture de l'image sielle n'est pas passée en argument
if ~exist('Mat','var')
    [fichier, chemin] = uigetfile('*.*','Choisir l''image:');
    if ~fichier
    error('Aucun fichier n''a été désigné !')
    end
    Mat = imread(fichier);
end

%lecture des nombres de quantification s'il ne sont pas définis
if  ~exist('QR','var') 
    QR=input('Nombre de quantification rouge?');
end
if  ~exist('QG','var')
    QG=input('Nombre de quantification vert?');
end
if  ~exist('QB','var')
    QB=input('Nombre de quantification bleu?');
end

%Séparation des couleurs
R=(Mat(:,:,1));
G=(Mat(:,:,2));
B=(Mat(:,:,3));

%initialisation des trois couleurs indexés
[nl,nc,p]= size(Mat);
ind_r=zeros(nl,nc);
ind_g=zeros(nl,nc);
ind_b=zeros(nl,nc);

% pas de quantification
pas_r=256/QR;
pas_g=256/QG;
pas_b=256/QB;

% traitement
for i=1:nl
	for j=1:nc
        %chaque couleur prend sa valeur indexée entière
        ind_r(i,j)=int16(R(i,j)/pas_r);
    	ind_g(i,j)=int16(G(i,j)/pas_g);
        ind_b(i,j)=int16(B(i,j)/pas_b);
        %on revient au valeur comprise entre 0 et 255
        R(i,j)=uint8(ind_r(i,j)*pas_r);
        G(i,j)=uint8(ind_g(i,j)*pas_g);
        B(i,j)=uint8(ind_b(i,j)*pas_b);
	end
end 

%recontruction de l'image en couleur indexée
indexee(:,:,1)=R;
indexee(:,:,2)=G;
indexee(:,:,3)=B;

%Visualisation
subplot(1,2,1)
imshow(Mat);
title('Image RGB ');
subplot(1,2,2)
imshow(indexee);
title('Image Indexée');
end 

[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

M = imread(fichier);
Mat = M;
[m,n,t] = size(M);

R = M(:,:,1);
G = M(:,:,2);
B = M(:,:,3);

% --------------Allocation des tableau de meme 
nIter = max(m,n)
if nIter<256
    nIter = 256;
end

pas = input('donne le pas : ');
SegtIm = zeros(nIter,1);

k = mod(m,pas);

for i=1:m
    for j =1:m
        Binf = 
       if (SegtIm(i)<= 63)
        SegtIm(i)= 63;
       elseif (63< SegtIm(i) & SegtIm(i)<=127)
               SegtIm(i)= 127;
       elseif (127< SegtIm(i) & SegtIm(i)<=191)
               SegtIm(i)= 191;
       else
               SegtIm(i)= 255;
       end
end

for j=1:m
    for k=1:n
        R(j,k)= SegtIm(R(j,k)+1);
        G(j,k)= SegtIm(G(j,k)+1);
        B(j,k)= SegtIm(B(j,k)+1);
    end
end
    R = M(:,:,1);
    G = M(:,:,2) ;
    B = M(:,:,3);
 
 subplot(1,2,1)
 imshow(Mat)
 title('image original')
 subplot(1,2,2)
imshow(M)
title('image segmentee sur 3 intervale')
end
