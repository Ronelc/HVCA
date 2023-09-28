function v = LK_alg(I1, I2, lamda, mask, v_initial, num_iterations)

    % Initialize the velocity
    v_prev = v_initial;
    new_mask = mask;
    
    % Iterate for num_iterations
    for i = 1:num_iterations
        % Warp I2 using the current velocity estimate
        [Iw2, warpMask] = warp(I2, v_prev);
        
        % Apply mask to the warpMask
        new_mask = new_mask .* warpMask;
    
        
        % Compute the image gradient
        [Ix, Iy, It] = ImageDerivatives(I1, Iw2);
        Ixt = Ix .* new_mask;
        Iyt = Iy .* new_mask;
        Itt = It .* new_mask;
    
        xx = sum(sum(Ixt .^ 2)) + lamda;
        yx = sum(sum(Ixt .* Iyt));
        yy = sum(sum(Iyt .^ 2)) + lamda;
        A = [xx, yx; yx, yy];
    
    
        xt = sum(sum(Ixt .* Itt));
        yt = sum(sum(Iyt .* Itt));
        B = -([xt; yt]);
    
        
        invA = inv(A);
        v_prev = v_prev + (invA * B);
    end
    v = v_prev;
end
