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
