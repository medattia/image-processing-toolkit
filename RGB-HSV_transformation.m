%Fonction qui transforme une image RGB en une image H
function HSV = RGBTOHSV(fichier)
[fichier, chemin] = uigetfile('*.*','Choisir l''image:');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

%Lecture de l'image
M = imread(fichier);

%Initialisation
[m,n,t]= size(M);
HSV = zeros(m,n,t);

%Calcul
for i=1:m 
    for j=1:n 
        R = double(M(i,j,1)) / 255; 
        G = double(M(i,j,2)) / 255; 
        B = double(M(i,j,3)) / 255; 
        
      Cmax = max([R,G,B]);
      Cmin= min([R,G,B]);
         delta = Cmax - Cmin;
      V = Cmax;
% ========= Calcul des elements de S => S(i,j,1)
    if (Cmax == 0)
        S = 0;
    else
        S = double(delta /Cmax);
    end
% ========= Calcul des elements de H => H(i,j,1)
    if (Cmax == Cmin)
        H = 0;
    else
        switch(Cmax) % Cmax prend des valeur qui peut etre = R, G ,B ou autre
            case R % dans  le cas ou Cmax dans le switch = R
                H = double(mod(double((G - B)/delta),6))*60;
            case G  % cas ou Cmax =G
                H = (double((B - R)/delta) + 2.0)*60;
            case B  % Cas ou Cmax = B
                H = (double((R - G)/delta) + 4.0)*60;
        end
    end
    HSV(i,j,1) = H;
    HSV(i,j,2) = S;
    HSV(i,j,3) = V;
    end % fin pour j
end % fin pour i

subplot(1,2,1)
imshow(M);
subplot(1,2,2)
imshow(HSV);


end

function  HSV2RGB()

[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end

M= imread(fichier);
HSV = rgb2hsv(fichier);
[m,n,t] = size(HSV);
RGB = zeros(m,n,t);
% --------------Allocation des tableau de meme 
R = zeros(m,n);
G = zeros(m,n);
B = zeros(m,n);

H = HSV(:,:,1);
S = HSV(:,:,2);
V = HSV(:,:,3);
for i=1:m
    for j = 1:n
       % if ((0<= H(i,j) & H(i,j)< 360) & (0<= S(i,j) & S(i,j)<=1) & (0<= V(i,j) & V(i,j)<= 1))
            C =double(V(i,j)*S(i,j));
            X = double(C*(1 - abs(mod(double(H(i,j)/60),2) -1)));
            m = double(V(i,j) - C);
        
       if ((0<=H(i,j))& (H(i,j)<60))
            r = C;
            g = X;
            b = 0;
        elseif ((60 <=H(i,j))& (H(i,j)<120))
            r = X;
            g = C;
            b = 0;
        elseif ((120<=H(i,j))& (H(i,j)<180))
            r = 0;
            g = C;
            b = X;
       elseif ((180 <=H(i,j))& (H(i,j)<240))
            r = 0;
            g = X;
            b = C;
       elseif ((240 <=H(i,j))& (H(i,j)<300))
            r = X;
            g = 0;
            b = C;
        else %((300 <=H(i,j))& (H(i,j)<360))
            r = C;
            g = 0;
            b = X;
            
 R(i,j) = (r+m)*255;
 G(i,j) = (g+m)*255;
 B(i,j) = (b+m)*255;
        end
    end
    RGB(:,:,1) = R;
    RGB(:,:,2) = G;
    RGB(:,:,3) = B;
 
 subplot(1,3,1)
 imshow(M);
 title('image original')
 subplot(1,3,2)
imshow(HSV);
title('image RGB to HSV')
subplot(1,3,3)
imshow(uint8(RGB));
title('image HSV to RGB')
end
 
%Fonction qui transforme une image HSV en une image HSV indexée
function QNHSV = Ind_HSV(Mat,QH,QS,QV)

%lecture de l'image si elle n'est pas passée en argument
if ~exist('Mat','var')
    [fichier, chemin] = uigetfile('*.*','Choisir l''image:');
    if ~fichier
    error('Aucun fichier n''a été désigné !')
    end
    Mat = imread(fichier);
end

%lecture des nombres de quantification s'il ne sont pas définis
if  ~exist('QH','var') 
    QH=input('Nombre de quantification Hue?');
end
if  ~exist('QS','var')
    QS=input('Nombre de quantification Saturation?');
end
if  ~exist('QV','var')
    QV=input('Nombre de quantification Value?');
end

%Initialisation
[nl,nc,p]= size(Mat);
HSV = rgb2hsv(Mat);

%Séparation des plans
H=(HSV(:,:,1));
S=(HSV(:,:,2));
V=(HSV(:,:,3));

%initialisation des trois couleurs indexés
ind_h=zeros(size(H));
ind_s=zeros(size(S));
ind_v=zeros(size(V));

% pas de quantification
pas_h=360/QH;
pas_s=1/QS;
pas_v=1/QV;

indexe_HSV=zeros(nl,nc,p);
    for i=1:nl
        for j=1:nc
            ind_h(i,j)=int16(H(i,j)/pas_h);
            ind_s(i,j)=int16(S(i,j)/pas_s);
            ind_v(i,j)=int16(V(i,j)/pas_v);
            indice=ind_h(i,j)+ind_s(i,j)*QH+ind_v(i,j)*QH*QS;
            indexe_HSV(i,j)=indice;
   %Constitution de l'image indexée
        H(i,j)=uint8(ind_h(i,j)*pas_h);
        S(i,j)=uint8(ind_s(i,j)*pas_s);
        V(i,j)=uint8(ind_v(i,j)*pas_v);
        end
    end 

QNHSV(:,:,1)=H;
QNHSV(:,:,2)=S;
QNHSV(:,:,3)=V;
%Visualisation
%subplot(1,2,1)
%imshow(HSV);
%title('Image HSV ');
%subplot(1,2,2)
%imshow(indexee);
%title('Image Indexée');

end


function HSV = RGB2HSV(fichier)
%{
[fichier, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~fichier
   error('Aucun fichier n''a été désigné !')
end
%}
M = imread(fichier);

[m,n,t]= size(M);
HSV = zeros(m,n,t);
for i=1:m 
    for j=1:n 
        R = double(M(i,j,1) / 255); 
        G = double(M(i,j,2) / 255); 
        B = double(M(i,j,3) / 255); 
        
      Cmax = max([R,G,B]);
      Cmin= min([R,G,B]);
         delta = Cmax - Cmin;
      V = Cmax;
% ========= Calcul des elements de S => S(i,j,1)
    if (Cmax == 0)
        S = 0;
    else
        S = double(delta /Cmax);
    end

    if (Cmax == Cmin)
        H = 0;
    else
        switch(Cmax) % Cmax prend des valeur qui peut etre = R, G ,B ou autre
            case R % dans  le cas ou Cmax dans le switch = R
                H = mod(double((G - B)/delta),6)*60;
            case G  % cas ou Cmax =G
                H = (double((B - R)/delta) + 2)*60;
            case B  % Cas ou Cmax = B
                H = (double((R - G)/delta) + 4)*60;
        end
    end
    HSV(i,j,1) = H;
    HSV(i,j,2) = S;
    HSV(i,j,3) = V;
    end % fin pour j
end % fin pour i

subplot(1,2,1)
imshow(M);
subplot(1,2,2)
imshow(HSV);
%subplot(1,2,1)
%imshow(uint8(HSV))
end
