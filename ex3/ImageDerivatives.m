function [Ix, Iy] = ImageDerivatives(im)
    % x derivation
    Kx = [0.5 -0.5];
    Ix = conv2(im, Kx, 'full');
    Ix = Ix(:, 1:end-1);
    Ix = BordersToZero(Ix);
    %show(Ix)
    
    
    % y derivation
    Ky = [-0.5; 0.5];
    Iy = conv2(im, Ky, 'full');
    Iy = Iy(1:end-1, :);
    Iy = BordersToZero(Iy);
    %show(Iy)

end


function [im] = BordersToZero(im)
    im(:, [1 end]) = 0;
    im([1 end], :) = 0;
end


