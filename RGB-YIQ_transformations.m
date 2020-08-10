function yiq=RGB2YIQ()

[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
Mat=imread(fichier);

R = Mat(:,:,1)/255;
G = Mat(:,:,2)/255;
B = Mat(:,:,3)/255;

% passage a RGB => YIQ

A=[0.299 0.587 0.114; 0.596 -0.274 -0.322; 0.21 -0.253 -0.312];  % matrice de conversion
%Aout= [Y I Q];
%Acouleur=[ R G B];

% avec 0<=R <= 1 ,0<=G<=1, 0<=B<=1

%Aout=A*Acouleur

Y = (A(1,1).*R+ A(1,2)*G+ A(1,3)*B);
I = (A(2,1).*R+ A(2,2)*G+ A(2,3)*B);
Q = (A(3,1).*R+ A(3,2)*G+ A(3,3)*B);

yiq(:,:,1)=Y*255;
yiq(:,:,2)=I*255;
yiq(:,:,3)=Q*255;

subplot(1,2,1)
imshow(Mat);

subplot(1,2,2)
imshow(yiq);

end 


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
