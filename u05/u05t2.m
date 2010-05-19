printf('-- u04 task2 - Wavelet transformation\n');

I = loadimageprompt();

[rows,cols] = size(I);

if rows != cols && mod(cols,2)!=0
    printf('unsupported image size [%d,%d]\n',rows, cols);
    return;
end
n = rows;

Wi = cwavem(rows);
W  = Wi^-1;

trans = W*(W*(double(I)).').';
trans(n/2+1:n, 1:n) = 0;
trans(1:n, n/2+1:n) = 0;

trans(n/4+1:n, n/4+1:n) = trans(n/4+1:n, n/4+1:n)/4;
out = Wi*(Wi*(trans).').';

imwrite([I, uint8(128+trans), uint8(out)], "u05/task2.png");



