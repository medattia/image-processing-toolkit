%Fonction qui transforme une image RGB en Nuance de gris NG avec trois pondérations différentes
function ng=rgbtogray(mat)
R=uint16(mat(:,:,1));
G=uint16(mat(:,:,2));
B=uint16(mat(:,:,3));
ng=uint8(0.2125*R+0.7159*G+0.0721*B);
end

%Fonction qui transforme une image RGB en Nuance de gris NG avec moyenne des trois intensités
function ng=rgbtogray1(mat)
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
ng=((R+G+B)/3);
end

%Fonction qui transforme une image RGB en Nuance de gris NG avec trois pondérations différentes semblables à celles de matlab
function ng=rgbtogray2(mat)
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
ng=(0.299*R+0.587*G+0.114*B);
end


