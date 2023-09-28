
function blured_im = blur_downsample(im)
    % Read the Gaussian kernel from file (or define your own)
    load('GaussKernel.mat', 'GaussKernel');
    % Convolve the image with the Gaussian kernel
    blured_im = conv2(im, GaussKernel, 'same');
    % Downsample the image by taking every second pixel in both dimensions
    blured_im = blured_im(1:2:end, 1:2:end);
end
