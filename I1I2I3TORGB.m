function RGB=I1I2I3TORGB(mat)
%RGB to I1I2I3
I1=mat(:,:,1);
I2=mat(:,:,2);
I3=mat(:,:,3);
R=I1+I2-2*I3/3;
G=I1+4*I3/3;
B=I1-I2-2*I3/3;
RGB(:,:,1)=(R);
RGB(:,:,2)=(G);
RGB(:,:,3)=(B);
end

