%Histogramme niveau de gris (Premier descripteur)
function HNG = histoNG(mat)

NG=rgb2gray(mat);
HNG=histo(NG,256)

end
