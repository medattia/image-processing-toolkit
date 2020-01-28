function ng=seuil(mat)
%R=uint32(mat(:,:,1));
%G=uint32(mat(:,:,2));
%B=uint32(mat(:,:,3));
%ng=uint8(0.299*R+0.537*G+0.0114*B);
ng=mat;
size(ng,1)
size(ng,2)
somme=0
  for i=1:size(ng,1)
    for j=1:size(ng,2)
      somme=somme+ng[ij];
    end
  end
  somme=somme/(size(ng,1)*size(ng,2))
end