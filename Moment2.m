%Descripteur Moment Ordre 2  (Variance)
function var=Moment2(Mat,QL,QC)
[nl nc]=size(Mat);
pas_L=nl/QL;
pas_C=nc/QC;
moy=Desc_Moment_Ordre1(Mat,QL,QC)
var=zeros(1,QL*QC);
    for i=1:nl
        for j=1:nc
        	indice_l=i/pas_L
            indice_c=j/pas_C
            indice=indice_l+indice_c*QL
            var(1,indice+1)=var(1,indice)+(Mat(i,j)-moy(1,indice+1))*(Mat(i,j)-moy(1,indice+1))
        end
    end
end
