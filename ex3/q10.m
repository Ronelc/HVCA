function q10
    
    load('runner.mat');
    figure;
    imshow(im1, [0 1])
    title('org image')

    figure;
    T = 0.05:0.02:0.15;
    for i = 1:6
        [R, L] = do_retinex(im1, T(i));
        subplot(2,3,i);
        str = sprintf('R, T=%.2f', T(i));
        imshow(R, [0 2]);
        title(str);
    end  

end

