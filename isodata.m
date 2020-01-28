function seuil=isodata()
[Image, chemin] = uigetfile('*.jpg','Choisir l''image noir en blanc à binariser :');
if ~Image
   error('Aucun fichier n''a été désigné !')
end

I         = imread(Image);
M         = I;
if length(size(I))==3
    I = rgb2gray(I);
end
Iso =I;
I = im2uint8(I(:)); % ecrire la matrice comme un vect

%====// Etape1//:(Initialisation de T par un seul choisit au hasard) ======
%dans notre cas on choisit d'initialiser T par intensité moyenne de l'image I(noir en blanc)

[counts,N]=imhist(I); % histogramme de I, N= indice, counts = effctifs de N
i=1;
mu=cumsum(counts);
T(i)=(sum(N.*counts))/mu(end); % mu(end) = mu(255)=mu(lenght(mu))
T(i)=round(T(i)); % arrondi de T(i)

%==// Etape2 //: mu_l (Moyenne au-dessus de T(i)) et mu_u (Moyenne au-dessous de T(i))
Somcum_l = cumsum(counts(1:T(i)));
mu_l     = sum(N(1:T(i)).*counts(1:T(i)))/Somcum_l(end);

Somcum_u = cumsum(counts(T(i):end));
mu_u     = sum(N(T(i):end).*counts(T(i):end))/Somcum_u(end);
i=i+1;

%=== affectation a Ti a sa valeur: T(i) = (mu_l+mu_u)/2 (moyen de 2 val ====
T(i)=round((mu_l+mu_u)/2);

%===// Etape 3 //: Test au i eme rang: => si abs(T(i)-T(i-1)) ~ eps on arret le test.
while abs(T(i)-T(i-1))>=1   % eps =1 
    Somcum_l = cumsum(counts(1:T(i)));
    mu_l     = sum(N(1:T(i)).*counts(1:T(i)))/Somcum_l(end);

    Somcum_u = cumsum(counts(T(i):end));
    mu_u     = sum(N(T(i):end).*counts(T(i):end))/Somcum_u(end);
    i=i+1;
    T(i)=round((mu_l+mu_u)/2);
    seuil=T(i);
end


Seuil = seuil
Iso(Iso>seuil)=1;
subplot(1,2,1)
image_initiale=imshow(M);
title('Image initial ')
subplot(1,2,2)
image_Finale=imshow(Iso);
title('image Isodata')



