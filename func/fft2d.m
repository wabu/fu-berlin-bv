function y = fft2d(X)
    y = fft(fft(X)')';
end
