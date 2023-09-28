function tester
    % twoSquares
    [im]=twoSquares(1);
    [R,L]=do_retinex(im,0.07);
    fprintf('R1 = %3.2f R2=%3.2f \n',R(15,15),R(35,35));
    [R,L]=do_retinex(im,1);
    fprintf('R3 = %3.2f R4=%3.2f \n',R(15,15),R(35,35));
    % checker shadow
    load checkerShadow.mat;
    [R,L]=do_retinex(im1,0.07);
    fprintf('R5 = %3.2f R6=%3.2f \n',R(y1,x1),R(y2,x2));
    [R,L]=do_retinex(im1,0);
    fprintf('R7 = %3.2f R8=%3.2f \n',R(y1,x1),R(y2,x2));
end

