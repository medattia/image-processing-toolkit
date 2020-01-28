% descripteur rgb indexe : troisième descripteur
function HRGB=histoIndexeRGB(im,QR,QG,QB)
im_indexe=QNRGB(im,QR,QG,QB)
HRGB=histo(im_indexe,QR*QG*QB)

end
