%Fonction pour calculer les distances L1 L2 L3 et L4
function [L1 L2 L3 L4 L5]=Distances(V1,V2)
    L1=sum(abs(V1-V2));
    L2=sqrt(sum((V1-V2).^2));
	L3=max(abs(V1-V2));
    L4=0;
    for i=1:256
        L4=L4+sum((V1(i)-V2(i)).^2/(V1(i)+V2(i)).^2);
    end
    L5=sum(min(V1,V2))/sum(V2);
end