function q6
    % flower garden 
    im1 = double(imread('flower-i1.tif'));
    im2 = double(imread('flower-i2.tif')); 
    [M] = mymovie(im1, im2, 0);

    lamda = 0;

    %create subimages
    subimage1 = im1(1:end, 1:90);
    subimage2 = im1(1:end, 91:end);
    mask = ones(120,90);

    show(subimage1);
    show(subimage2);
    
    for num_iterations = [10, 100, 200]
        disp("num of iterations:")
        disp(num_iterations)
        v = Full_LK_alg(subimage1, subimage2,lamda, mask,num_iterations);
    end
end

