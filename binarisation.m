function b=binarisation(mat)
b=zeros(size(mat,1),size(mat,2));
for i=1:size(mat,1);
   for j=1:size(mat,2);
     if mat(i,j)>150;
       b(i,j)=1;
     else b(i,j)=0;
     end;
   end;
end;
end;