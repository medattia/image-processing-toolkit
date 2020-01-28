% Color Descriptors DEMO v1.3
% Code by Joost van de Weijer, Marc Masana {joost,mmasana}@cvc.uab.cat
function [out] = ColorDescriptors(im,det,descriptor)
    % ---------------------------------------------------------------------
    % Check function
    if (nargin<2 || nargin>3)
        disp('Wrong Call, use: [out] = ColorDescriptor(image, detector, descriptor)');
        return;
    end
    if (nargin<3)
        descriptor=1;
        disp('[INFO] Use Color Naming as default descriptor');
    end
    % ---------------------------------------------------------------------
    % Default Parameters
    patch_size = 21;
    scalef = 5.0;
    sigma = 21/4.0;
    num_bins = 5;
    smooth = 0;
    % ---------------------------------------------------------------------
    
    % Read the image
    im=imread(im);
    im=double(im);
    
    % Choose descriptor
    switch(descriptor)
        case 1
            % Color Naming
            load 'w2c/w2c.mat';
            [out] = mexColorNaming(im(:,:,1),im(:,:,2),im(:,:,3),det,w2c,patch_size,scalef,sigma);
        case 2
            % Discriminant Color Descriptor
             load 'w2c/DD11_w2c.mat';
            % load 'w2c/DD25_w2c.mat';
            % load 'w2c/DD50_w2c.mat';
            % load 'w2c/DD11_w2c_fast.mat';
            % load 'w2c/DD25_w2c_fast.mat';
            % load 'w2c/DD50_w2c_fast.mat';
            [out] = mexColorNaming(im(:,:,1),im(:,:,2),im(:,:,3),det,w2c,patch_size,scalef,sigma);
        case 3
            % JOSA Color Naming
            load 'w2c/LUT_JOSA.mat';
            [out] = mexColorNaming(im(:,:,1),im(:,:,2),im(:,:,3),det,w2c,patch_size,scalef,sigma);
        case 4
            % Hue Descriptor
            [out] = mexHueDescriptor(im(:,:,1),im(:,:,2),im(:,:,3),det,patch_size,scalef,sigma,num_bins,smooth);
        case 5
            % Opponent Descriptor
            [out] = mexOpponent(im(:,:,1),im(:,:,2),im(:,:,3),det,patch_size,scalef,sigma,num_bins,smooth);
    end

end
