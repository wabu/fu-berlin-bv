printf('-- u04 task2 - Wavelet transformation\n');

I = loadimageprompt();

[rows,cols] = size(I);

if rows != cols && mod(cols,2)!=0
    printf('unsupported image size [%d,%d]\n',rows, cols);
    return;
end

trans = cdf22(cdf22(double(I)).').';
out = cdf22i(cdf22i(trans).').';

imwrite([I, uint8(128+trans), uint8(out)], "u05/task1.png");



