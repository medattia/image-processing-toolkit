% descripteur Hue  : Cinquième descripteur
function H_Hue=histohue(im)
im_hsv=rgb2hsv(im)
H_Hue=histo(image_hsv(:,:,1),360)

end
