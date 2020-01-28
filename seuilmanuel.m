function im=seuilmanuel(mat)
R=uint16(mat(:,:,1));
G=uint16(mat(:,:,2));
B=uint16(mat(:,:,3));
im=uint8((R+G+B)/3);

for i=1..size(im,1)
  for j=1..size(im,2)
if im<=50
  im=0
  else
  im=255
     endif
  end
end

end