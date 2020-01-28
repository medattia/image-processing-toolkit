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