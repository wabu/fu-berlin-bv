printf('-- u05 task3 - EM deconv (lucy)\n');

I = loadimageprompt();

[rows,cols] = size(I);

if rows != cols && mod(cols,2)!=0
    printf('unsupported image size [%d,%d]\n',rows, cols);
    return;
end
n = rows;

K_uni = zeros(rows);
K_uni(1:5,1:5) = 0.04;
K_uni = shift(shift(K_uni,-2), -2,2);

If = real(conv(K_uni, double(I)));

H = If;
W = ones(rows,cols);

for i=1:5
    W = W.*conv(K_uni, H./conv(K_uni, W));
end

imwrite([I, uint8(real(If)), uint8(real(W))], "u05/task3.png");

