printf('-- u02 task2 - Conv\n');

I = loadimageprompt();

[rows,cols] = size(I);

if rows != cols && mod(cols,2)!=0
    printf('unsupported image size [%d,%d]\n',rows, cols);
    return;
end

% make the image gray
m = rows/2;
K = zeros(rows);

R = normrnd(0,1,rows);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create kernels
% 1) Gauss - Sigma 3
G_s3 = gaussmatrix(rows,3);
G_s3 = shift(shift(G_s3,-m),-m,2);

If = conv(G_s3, double(I));
Id = deconv(G_s3, (If));
Id_ = deconv(G_s3, (If+R));
imwrite(uint8(abs(real([complex(I),Id;If,Id_]))), 'u03/gauss_3.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2) Gauss - Sigma 10
G_s10 = gaussmatrix(rows,10);
G_s10 = shift(shift(G_s10,-m),-m,2);

If = conv(G_s10, double(I));
Id = deconv(G_s10, (If));
Id_ = deconv(G_s10, (If+R));
imwrite(uint8(abs(real([complex(I),Id;If,Id_]))), 'u03/gauss_10.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3) Sobel_x
Sobel_x = [1 0 -1; 
           2 0 -2; 
           1 0 -1];
K(1:3, 1:3) = Sobel_x;
K_sx = shift(shift(K,-1),-1,2);

If = conv(K_sx, double(I));
Id = deconv(K_sx, (If));
Id_ = deconv(K_sx, (If+R));
imwrite(uint8(abs(real([complex(I),Id;If,Id_]))), 'u03/sobel_x.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4) Sobel_y
K_sy = -1*K_sx';
If = conv(K_sy, double(I));
Id = deconv(K_sy, (If));
Id_ = deconv(K_sy, (If+R));
imwrite(uint8(abs(real([complex(I),Id;If,Id_]))), 'u03/sobel_y.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5) uniform (5x5)
K_uni = zeros(rows);
K_uni(1:5,1:5) = 0.04;
K_uni = shift(shift(K_uni,-2), -2,2);

If = conv(K_uni, double(I));
Id = deconv(K_uni, (If));
Id_ = deconv(K_uni, (If+R));
imwrite(uint8(abs(real([complex(I),Id;If,Id_]))), 'u03/uni.png');

% If = conv(K, double(I));

%imshow(uint8(real(If)));


