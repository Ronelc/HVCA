function [R, L] = do_retinex(I,T)

    % Take log and calculate the derivatives of the log image.
    [Ix, Iy] = ImageDerivatives(log(I));

    % Calculate the norm of the derivative at each point
    norm = sqrt(Ix.^2 + Iy.^2);

    % Set all derivatives whose norm is less than T to zero.
    Ix(norm < T) = 0;
    Iy(norm < T) = 0;

    % Use the function Deriv2Laplace to compute the Laplacian.
    Laplas = Deriv2Laplace(Ix, Iy);

    % Compute the inverse Laplacian kernel K using the provided invDel2.
    [invK] = invDel2(size(I));

    % Convolve the Laplacian with K to obtain the log reflectance
    logRef = conv2(Laplas, invK, 'same');  

    % Exponentiate the log reflectance to obtain a reflectance image.
    R = exp(logRef);
    L = I./R;

end


