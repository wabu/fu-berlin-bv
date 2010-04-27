function Y = conv_(K, I) 
    F = fourier(length(I));
    K_ = F*K;
    I_ = F*I;

    Y_ = K_.*I_;
    Y = (F')*Y_/length(I)**2;
end
