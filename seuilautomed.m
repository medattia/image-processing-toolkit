function im=seuilautomed(mat)
R=uint16(mat(:,:,1));
G=uint16(mat(:,:,2));
B=uint16(mat(:,:,3));
%for i=1..size(R,1)
 % for j=1..size(R,2)
  %    if R<=50
   %     R=0
    %  else R=255
     % endif
 % end
%end
im=uint8(0.299*R+0.537*G+0.0114*B);
if im<=200
  im=0
  else
  im=255
end