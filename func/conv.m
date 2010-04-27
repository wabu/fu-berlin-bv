function Y = conv(K, I) 
    K_ = fft2d(K);
    I_ = fft2d(I);
    Y_ = K_.*I_;
    Y = ffc2d(Y_)/length(I)**2;
end
