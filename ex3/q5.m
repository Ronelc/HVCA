function q5
    im = double(imread('kofka_ring.tif'));
    [Ix, Iy] = ImageDerivatives(im);
    [L] = Deriv2Laplace(Ix, Iy);
    %imshow(L);

    % after threshold
    threshold = 20;
    L = abs(L);
    L_threshold = L >= threshold;
    imshow(L_threshold);

end



