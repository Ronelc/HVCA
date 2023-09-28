function q11

    load('couch.mat');
    figure;
    imshow(im1, [0 1])
    title('org image')
    
    figure;
    T = 0.01:0.01:0.04;
    for i = 1:4
        [R, L] = do_retinex(im1, T(i));
        subplot(2,2,i);
        str = sprintf('R, T=%.2f', T(i));
        imshow(R, [0 1]);
        title(str);
    end
    
end