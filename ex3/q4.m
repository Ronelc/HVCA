function q4
    im = double(imread('cross.tif'));
    [Ix, Iy] = ImageDerivatives(im);
    [L] = Deriv2Laplace(Ix, Iy);
    imshow(L);

    % after threshold
    threshold = 5;
    L = abs(L);
    L_threshold = L >= threshold;
    imshow(L_threshold);

end

