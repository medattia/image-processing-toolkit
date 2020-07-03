% Color Descriptors
%Histogramme niveau de gris (Premier descripteur)
function HNG = histoNG(mat)

NG=rgb2gray(mat);
HNG=histo(NG,256)

end

% descripteur HSV indexe : Quatrième descripteur
function HHSV=histoHSVI(im,QH,QS,QV)
image_hsv=rgb2hsv(im);
im_indexe_hsv=QNHSV(im,QH,QS,QV)
Hhsv=histo(im_indexe_HSV,Qh*Qs*Qv)

end

% descripteur Hue  : Cinquième descripteur
function H_Hue=histohue(im)
im_hsv=rgb2hsv(im)
H_Hue=histo(image_hsv(:,:,1),360)

end


% Descripteur H3C : deuxième descripteur
function H3C=histoRGB(im)

HR=histo(im(:,:,1),256)
HG=histo(im(:,:,2),256)
HB=histo(im(:,:,3),256)
H3C=[HR HG HB] 
end


% Descripteur RGB indexée Troisième descripteur
function HRGB=histoRGBI(im,QR,QG,QB)
im_indexe=QNRGB(im,QR,QG,QB);
HRGB=histo(im_indexe,QR*QG*QB)

end

