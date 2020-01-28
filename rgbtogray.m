function ng=rgbtogray(mat)
R=uint16(mat(:,:,1));
G=uint16(mat(:,:,2));
B=uint16(mat(:,:,3));
ng=uint8(0.2125*R+0.7159*G+0.0721*B);
end