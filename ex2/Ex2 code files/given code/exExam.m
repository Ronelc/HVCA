
function exExam
    % Gaussian spot
    im1=GausSpot(64,5,[0 0]);
    im2=GausSpot(64,5,[2 3]);
    v=LK_alg(im1,im2, 0, ones(64), [0 0]', 5);
    fprintf('vx1 = %3.2f vy1 = %3.2f \n',v(1),v(2));
    
    % flower graden
    i1 = double(imread('flower-i1.tif'));
    i2 = double(imread('flower-i2.tif')); 
    
    mask = zeros(120, 180); 
    mask(100:120, 40:60) = 1; 
    v=Full_LK_alg(i1, i2, 0, mask, 5);
    fprintf('vx2 = %3.2f vy2 = %3.2f \n',v(1),v(2));
    
    % high contrast rhobmus
    [im1,im2]=rhombusMovie(0,1);
    v=Full_LK_alg(im1, im2, 0.5, ones(128) , 5);
     fprintf('vx3 = %3.2f vy3 = %3.2f \n',v(1),v(2));
    % low contrast rhobmus
    [im1,im2]=rhombusMovie(0,0.1);
    v=Full_LK_alg(im1, im2, 0.5, ones(128) , 5);
    fprintf('vx4 = %3.2f vy4 = %3.2f \n',v(1),v(2));
    
end
