function [squelette,radius]=build_squelette_morphomath(picture,radius_disk)
%function [squelette,radius]=build_squelette_morphomath(picture,radius_disk)

k=1;
squelette=zeros(size(picture));
radius = zeros(size(picture));
while(sum(picture(:))~=0)
 O = opening_morpho_2D(picture,radius_disk);
 residu = picture-O;
 squelette = squelette+residu;
 radius = radius+residu*k;
 picture = erosion_morpho_2D(picture,radius_disk);
 imagesc(squelette);
 axis square
 pause(0.01);
 k=k+1;
end
squelette = (squelette>=1);



for(k=1:max(radius_2(:)))
image_temp = double((radius_2<=k) .* (radius_2>k-1));
rebuilt = rebuilt + dilatation(image_temp,k);
end
rebuilt = (rebuilt>0);