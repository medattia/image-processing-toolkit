function RGB=NTSCTORGB(mat)
Y=mat(:,:,1);
I=mat(:,:,2);
Q=mat(:,:,3);
R=1*Y+0.9469*I+0.6236*Q;
G=1*Y-0.2748*I-0.6357*Q;
B=1*Y-1.1*I+1.7*Q;
RGB(:,:,1)=(R);
RGB(:,:,2)=(G);
RGB(:,:,3)=(B);
end
%RGB(:,:,1)=uint8(R*255);
%RGB(:,:,2)=uint8(G*255);
%RGB(:,:,3)=uint8(B*255);
