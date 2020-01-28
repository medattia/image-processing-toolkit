%Fonction qui transforme une image RGB en Nuance de gris NG avec moyenne des trois intensités
function ng=rgbtogray1(mat)
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
ng=((R+G+B)/3);
end
%R=uint16(mat(:,:,1));
%G=uint16(mat(:,:,2));
%B=uint16(mat(:,:,3));
%ng=uint8((R+G+B)/3);