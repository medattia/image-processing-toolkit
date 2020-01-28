im = double(imread('car.jpg'));
load 'w2c/w2c.mat';

det(1,:)=[70 90 2 0 0];
det(2,:)=[250 80 2 0 0];
det(3,:)=[150 180 2 0 0];

out1 = mexColorNaming(im(:,:,1), im(:,:,2), im(:,:,3), det, w2c);
out2 = mexColorNaming(im(:,:,1), im(:,:,2), im(:,:,3), det, w2c, 21);
out3 = mexColorNaming(im(:,:,1), im(:,:,2), im(:,:,3), det, w2c, 21, 5);
out4 = mexColorNaming(im(:,:,1), im(:,:,2), im(:,:,3), det, w2c, 21, 5, 21/4);

fprintf(' test 1: %d\n', min(min(out1 == out2)));
fprintf(' test 2: %d\n', min(min(out2 == out3)));
fprintf(' test 3: %d\n', min(min(out3 == out4)));

