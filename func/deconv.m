function Y = deconv(K, I) 
    K_ = fft2d(K);
    I_ = fft2d(I);
    Y_ = I_./K_;
    Y = ffc2d(Y_)/length(I)**2;
end
