function q3
    im = double(imread('simul_cont_squares.tif'));
    [Ix, Iy] = ImageDerivatives(im);
    [L] = Deriv2Laplace(Ix, Iy);
    imshow(L);

    % after threshold
    threshold = 10;
    L = abs(L);
    L_threshold = L >= threshold;
    imshow(L_threshold);

end

