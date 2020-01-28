% descripteur moment ordre 1  : cinquième descripteur
function moy=Desc_Moment_ordre1(mat,QL,QC)
[nl nc]=size(mat);
pas_L=nl/QL;
pas_C=nc/QC;
moy=zeros(1,QL*QC)
for i=1:nl
	for j=1:nc
		indice_l=i/pas_L
		indice_c=j/pas_C
		indice=indice_l+indice_c*QL
		moy(1,indice+1)=moy(1,indice+1)+mat(i,j)
	end
end
moy=moy/(pas_l*pas_c)
end
