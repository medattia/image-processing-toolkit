function ind(mat,nbq)
%lecture de l'image si elle n'est pas passée en argument
if ~exist('mat','var')
    [fichier, chemin] = uigetfile('*.*','Choisir l''image:');
    if ~fichier
    error('Aucun fichier n''a été désigné !')
    end
    mat = imread(fichier);
end
%lecture des nombres de quantification s'il ne sont pas définis
if  ~exist('nbq','var') 
    nbq=input('Nombre de quantification?');
end
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
ind_r=zeros(size(R));
ind_g=zeros(size(G));
ind_b=zeros(size(B));

pas=255/nbq
for i=1:size(R,1);
	for j=1:size(R,2);
    ind_r(i,j)=int16((R(i,j)-mod(R(i,j),pas))/pas);
    ind_g(i,j)=int16((G(i,j)-mod(G(i,j),pas))/pas);
    ind_b(i,j)=int16((B(i,j)-mod(B(i,j),pas))/pas);
    indice(i,j)=ind_r(i,j)+ind_g(i,j)*nbq+ind_b(i,j)*nbq*nbq;
    indexe(i,j)=uint16((ind_r(i,j)*pas+ind_g(i,j)*pas+ind_b(i,j)*pas)/3);
    R(i,j)=uint8(ind_r(i,j)*pas);
    G(i,j)=uint8(ind_g(i,j)*pas);
    B(i,j)=uint8(ind_b(i,j)*pas);
	end
end 
finale(:,:,1)=R;
finale(:,:,2)=G;
finale(:,:,3)=B;

imshow(finale)