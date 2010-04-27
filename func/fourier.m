function matrix = fourier(N)
    w = rootOfUnity(N);
    matrix = zeros(N);
    for i=0:N-1
        for j=0:N-1
            matrix(i+1,j+1) = w**(i*j);
        end
    end
    matrix = matrix/sqrt(N);
end

function w = rootOfUnity(N)
    w = e**(2*pi*i/N);
end

