%Fonction qui transforme une image HSV en une image HSV indexée
function QNHSV = Ind_HSV(Mat,QH,QS,QV)

%lecture de l'image si elle n'est pas passée en argument
if ~exist('Mat','var')
    [fichier, chemin] = uigetfile('*.*','Choisir l''image:');
    if ~fichier
    error('Aucun fichier n''a été désigné !')
    end
    Mat = imread(fichier);
end

%lecture des nombres de quantification s'il ne sont pas définis
if  ~exist('QH','var') 
    QH=input('Nombre de quantification Hue?');
end
if  ~exist('QS','var')
    QS=input('Nombre de quantification Saturation?');
end
if  ~exist('QV','var')
    QV=input('Nombre de quantification Value?');
end

%Initialisation
[nl,nc,p]= size(Mat);
HSV = rgb2hsv(Mat);

%Séparation des plans
H=(HSV(:,:,1));
S=(HSV(:,:,2));
V=(HSV(:,:,3));

%initialisation des trois couleurs indexés
ind_h=zeros(size(H));
ind_s=zeros(size(S));
ind_v=zeros(size(V));

% pas de quantification
pas_h=360/QH;
pas_s=1/QS;
pas_v=1/QV;

indexe_HSV=zeros(nl,nc,p);
    for i=1:nl
        for j=1:nc
            ind_h(i,j)=int16(H(i,j)/pas_h);
            ind_s(i,j)=int16(S(i,j)/pas_s);
            ind_v(i,j)=int16(V(i,j)/pas_v);
            indice=ind_h(i,j)+ind_s(i,j)*QH+ind_v(i,j)*QH*QS;
            indexe_HSV(i,j)=indice;
   %Constitution de l'image indexée
        H(i,j)=uint8(ind_h(i,j)*pas_h);
        S(i,j)=uint8(ind_s(i,j)*pas_s);
        V(i,j)=uint8(ind_v(i,j)*pas_v);
        end
    end 

QNHSV(:,:,1)=H;
QNHSV(:,:,2)=S;
QNHSV(:,:,3)=V;
%Visualisation
%subplot(1,2,1)
%imshow(HSV);
%title('Image HSV ');
%subplot(1,2,2)
%imshow(indexee);
%title('Image Indexée');

end
