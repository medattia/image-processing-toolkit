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
