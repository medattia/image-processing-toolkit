function I1I2I3=RGBTOI1I2I3(mat)
R=(mat(:,:,1));
G=(mat(:,:,2));
B=(mat(:,:,3));
I1=(R+G+B)/3;
I2=(R-B)/2;
I3=(-R+2*G-B)/4;
I1I2I3(:,:,1)=(I1);
I1I2I3(:,:,2)=(I2);
I1I2I3(:,:,3)=(I3);
end

