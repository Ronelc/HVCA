
function [Ix, Iy, It] = ImageDerivatives(im1, im2)
    % Computes the derivatives of two images across the X dimension, the Y dimension, and time.
    
    Ky = 0.25*[-1,-1 ; 1,1];
    Kx = 0.25*[1,-1 ; 1,-1];
    Kt = 0.25*[1,1 ; 1,1];
    
    % Compute the spatial derivatives using a Sobel filter
    Ix = conv2(im1, Kx, 'same') + conv2(im2, Kx, 'same');
    Iy = conv2(im1, Ky, 'same') + conv2(im2, Ky, 'same');
    It = conv2(im2, Kt, 'same') - conv2(im1, Kt, 'same');
end












