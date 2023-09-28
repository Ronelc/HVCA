function [L] = Deriv2Laplace(Ix, Iy)
    Kx = [0.5 -0.5];
    Ky = [-0.5; 0.5];
    L = conv2(Ix, Kx, 'same') + conv2(Iy, Ky, 'same');
end

