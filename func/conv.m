function Y = conv(K, I) 
    K_ = fft2d(K);
    n = length(I);
    for x=1:n
        for y=1:n
            if abs(K_(x,y)) <= 0.01;
                K_(x,y) = 0.01;
            end
        end
    end
    I_ = fft2d(I);
    Y_ = K_.*I_;
    Y = ffc2d(Y_)/length(I)**2;
end
