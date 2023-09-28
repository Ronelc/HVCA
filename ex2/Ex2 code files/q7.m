function q7

    x_axis = -100:2:100;

    for sigma = [1, 10]     % For each sigma: 1, 10
        err = [];
    
        % Set "base" Gaussian
        g_base = GausSpot(128, sigma, [0 0]);
        %show(g_base)
    
        for x = x_axis    % For each velocity
    
            % Set Gaussian after movement and calculate its velocity and error
            g_moved = GausSpot(128, sigma, [x 0]);
            v = Full_LK_alg(g_base, g_moved, 0, ones(128), 1);
            err = [err abs(v(1) - x)];
        end

        % Draw plots (sigma 1 in blue and sigma 10 in red)
        if sigma == 1
            plot(x_axis , err , 'b');
        else
            hold on
            plot(x_axis , err , 'r');
        end
    end

    % Label axis
    xlabel('True Velocity');
    ylabel('Estimation Error');
    legend('sigma = 1','sigma = 10');
end

