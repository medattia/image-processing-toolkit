function RGB=YIQTORGB(mat)
Y=(mat(:,:,1));
I=(mat(:,:,2));
Q=(mat(:,:,3));
R=1*Y+0.9563*I+0.6210*Q;
G=1*Y-0.2721*I-0.6474*Q;
B=1*Y-1.1070*I+1.7046*Q;
RGB(:,:,1)=(R);
RGB(:,:,2)=(G);
RGB(:,:,3)=(B);
end
%Y=(mat(:,:,1))/255;
%I=(mat(:,:,2))/255;
%Q=(mat(:,:,3))/255;

%V1=[0.299;0.587;0.114];
%V2=[0.596;-0.274;-0.322];
%V3=[0.211;-0.253;0.312];
%MYIQ=[V1;V2;V3];

%MIYIQ=inv(MYIQ);
%U1=MIYIQ[1];
%U2=MIYIQ[2];
%U3=MIYIQ[3];
%RGB=uint8(zeros(size(mat)));

%RGB(:,:,1)=uint8(R*255);
%RGB(:,:,2)=uint8(G*255);
%RGB(:,:,3)=uint8(B*255);