%Fonction qui transforme une image RGB en Nuance de gris NG avec trois pondérations différentes
function ng=rgbtogray2(mat)
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
ng=(0.212*R+0.716*G+0.072*B);
end
%R=uint16(mat(:,:,1));
%G=uint16(mat(:,:,2));
%B=uint16(mat(:,:,3));
%ng=uint8(0.212*R+0.716*G+0.072*B);