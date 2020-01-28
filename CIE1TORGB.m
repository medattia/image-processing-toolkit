function RGB=CIETORGB(mat)
L=mat(:,:,1);
u=mat(:,:,2);
v=mat(:,:,3);
R=1*Y+0.9469*I+0.6236*Q;
G=1*Y-0.2748*I-0.6357*Q;
B=1*Y-1.1*I+1.7*Q;
RGB(:,:,1)=(R);
RGB(:,:,2)=(G);
RGB(:,:,3)=(B);
end

