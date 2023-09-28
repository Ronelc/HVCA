function  q8

    [im] = twoSquares(1);
    show(im,[0 2])
    
    T = 0.07;
    [R1, L1] = do_retinex(im,T);
    d1 = diag(R1);
    imshow(R1)
    imshow(L1)
    plot(d1)


    [im] = twoSquares(2);
    show(im,[0 2])
    
    T = 0.07;
    [R2, L2] = do_retinex(im,T);
    d2 = diag(R2);
    plot(d2)
    imshow(R2)
    imshow(L2)

end

