% Descripteur à couleur dominante
function de=Desc_Couleur_Dominante(mat,NBC)
[nl nc]=size(mat);
%Clustering avec k-means
for i=1:nl
	for j=1:nc
		indice_l=i/pas_L
		indice_c=j/pas_C
		indice=in*dice_l+indice_c*QL
		moy(1,indice+1)=moy(1,indice+1)+mat(i,j)
	end
end

moy=moy/(pas_l*pas_c)
end
