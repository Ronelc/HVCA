function v = Full_LK_alg(im1, im2,lamda, mask, num_iterations)
    blured_im1 = blur_downsample(im1);
    blured_im2 = blur_downsample(im2);
    new_mask = mask(1:2:end, 1:2:end);
    v_initial = [0 0]';
    v_blurred = LK_alg(blured_im1, blured_im2 , lamda, new_mask, v_initial, 1);
    v = LK_alg(im1, im2 , lamda, mask, 2*v_blurred, num_iterations);
    v = v';
end