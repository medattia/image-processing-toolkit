%Fonction qui transforme une image HSV en une image HSV indexée
function indexe_HSV = QNHSV(M,QH,,QS,QV)

%Lecture de l'image
M = imread(fichier);

%Initialisation
[nl,nc,p]= size(M);
HSV = zeros(m,n,t);

H=(Mat(:,:,1));
S=(Mat(:,:,2));
V=(Mat(:,:,3));

pas_h=360/QH;
pas_s=1/QS;
pas_v=1/QV;

indexe_hsv=zeros(nl,nc);
for i=1:nl
	for j=1:nc
    ind_h(i,j)=int16(H(i,j)/pas_h);
    ind_s(i,j)=int16(S(i,j)/pas_s);
    ind_v(i,j)=int16(V(i,j)/pas_v);
    indice(i,j)=ind_h(i,j)+ind_s(i,j)*QH+ind_v(i,j)*QH*QS;
    indexe_hsv(i,j)=indice;
	end
end 
end
