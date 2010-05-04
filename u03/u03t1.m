printf('-- u02 task2 - Conv\n');

I = loadimageprompt();

n = length(I);
k = [0.4,0.2,0.1,zeros(1,n-5),0.1,0.2];
K = k' * k;
% create kernels
% 1) Gauss - Sigma 3
% 2) Gauss - Sigma 10
% 3) Sobel_x
Sobel_x = [1 0 -1; 2 0 -2; 1 0 -1];
% 4) Sobel_y
+ flap...
Sobel_y = Sobel_x'
% 5) uniform (5x5)

% If = conv(K, double(I));

imshow(uint8(real(If)));
% imwrite(uint8(real(If)), 'u02/c_out.png');


