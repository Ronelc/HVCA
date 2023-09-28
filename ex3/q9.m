function q9
    
    load('checkerShadow.mat');
    figure;
    imshow(im1,[0 1])
    title('org image')

    % Verify that indeed the two checks have exactly the same intensity
    disp('Intensities at (y1,x1), (y2,x2):');
    disp([im1(y1,x1) im1(y2,x2)])
    

    T_lst = [0.02, 0.07, 0.2];
    for i = 1:length(T_lst)
        T = T_lst(i);
        %T =  0.07;
        [R, L] = do_retinex(im1,T);
        disp('calculated reflectance of the two checks, T is:');
        disp(T)
        disp([R(y1,x1) R(y2,x2)])
        figure;
        imshow(R)
        title_str = sprintf('R, T= %.2f' ,T);
        title(title_str);

    end

end

