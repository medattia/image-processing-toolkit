function RGB=YUVTORGB(mat)
Y=mat(:,:,1);
U=mat(:,:,2);
V=mat(:,:,3);
R=Y+U-2*V/3;
G=Y+4*V/3;
B=Y-U-2*V/3;
RGB(:,:,1)=(R);
RGB(:,:,2)=(G);
RGB(:,:,3)=(B);
end
%R=0.33*Y+0.33*U+0.33*V;
%G=0.5*Y-0.5*V;
%B=0.25*Y+0.5*U-0.25*V;