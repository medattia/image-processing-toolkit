function c=complement(mat)
c=zeros(size(mat,1),size(mat,2));
for i=1:size(mat,1);
   for j=1:size(mat,2);
     if mat(i,j)==1;
       c(i,j)=0;
     else c(i,j)=1;
     end;
   end;
 end;
end;