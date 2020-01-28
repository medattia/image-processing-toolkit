MAIN_DIR = 'http://www.vision.caltech.edu/feifeili/101_ObjectCategories';
CLASSES = {'dolphin','Faces'};
FILE_BASE_NAME = 'image_';
FILE_EXTENSION = '.jpg';
NUM_OF_PICTURES = 100;
NUM_OF_CLASSES = length(CLASSES);

figure(1); clf;
% Essentially, we first iterate over the classes, then iterate over
% the elements in each class.
for i = 1:NUM_OF_CLASSES
for j = 1:NUM_OF_PICTURES
% Generate the name of each file dynamically (first trim off any
% trailing spaces!).
class = CLASSES{i};
file_name = [MAIN_DIR '/' class '/' FILE_BASE_NAME num2str(j,'%.4d') FILE_EXTENSION];
the_image = imread(file_name);
% Split the figure window into 10 rows, 3 columns.
%subplot(10, 3, i);
% Include titles over each column.
title(class);
% Display images.
%subplot(10, 3, 3*(j - 1) + i);
imagesc(the_image); pause(0.1)
%colormap(gray);
% Make it look all pretty by removing the ugly, unnecessary tick
% marks.
axis off;
axis image;
end
end
