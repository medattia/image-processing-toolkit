function s=seuillagemed(mat)
s=zeros(size(mat,1),size(mat,2));
seuil=median(mat)
for i=1:size(mat,1);
   for j=1:size(mat,2);
     if mat(i,j)>seuil;
       s(i,j)=1;
     else s(i,j)=0;
     end;
   end;
end;
end
