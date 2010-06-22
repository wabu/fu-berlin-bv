function [Y,U,V] = rgb2yuv(X)
    T = [0.299      0.587       0.114
        -0.14713   -0.28886     0.436
         0.615     -0.51499    -0.100001];


    R = double(X(:,:,1));
    G = double(X(:,:,2));
    B = double(X(:,:,3));

    Y = uint8(T(1,1) * R + T(1,2) * G + T(1,3) * B);
    U = uint8(T(2,1) * R + T(2,2) * G + T(2,3) * B);
    V = uint8(T(3,1) * R + T(3,2) * G + T(3,3) * B);
end
