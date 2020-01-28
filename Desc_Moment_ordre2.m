% descripteur moment ordre 2  : sixième descripteur (variance)
function var=Desc_Moment_ordre2(mat,QL,QC)
[nl nc]=size(mat);
pas_L=nl/QL;
pas_C=nc/QC;
moy=Desc_Moment_ordre1(mat,QL,QC)
var=zeros(1,QL*QC);
for i=1:nl
	for j=1:nc
		indice_l=i/pas_L
		indice_c=j/pas_C
		indice=indice_l+indice_c*QL
		var(1,indice+1)=var(1,indice)+(mat(i,j)-moy(1,indice+1))*(mat(i,j)-moy(1,indice+1))
	end
end
moy=moy/(pas_l*pas_c)
end
