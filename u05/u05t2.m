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

% 1 2  1 1 2 2
% 3 4  3 3 4 4
%
% 1 2  1 1 2 2
% 1 2  1 1 2 2
% 3 4  3 3 4 4
% 3 4  3 3 4 4


save = trans(0,0);
trans(1:n/4, 1:n/4) = 0;
trans(0,0) = save;
out = Wi*(Wi*(trans).').';

imwrite([I, uint8(128+trans), uint8(out)], "u05/task2.png");



