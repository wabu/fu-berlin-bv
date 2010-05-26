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

thold = 1.5;
trans = W*(W*(double(I)).').';
saved = trans(1,1);

notfoo = [2 2];

i=2;
while i<=n
    j=2;
    a = n/i;
    b = 1.5 * a;
    c = 2 * a;
    d = 2.5 * a;
    while j<=n
       a_= n/j;
       b_= 1.5 * a_;
       c_= 2 * a_;
       d_= 2.5 * a_;
       if all([i j] < notfoo)
            trans(a+1:b, a_+1:b_) = 0;
       end
       j*=2;
    end
    i*=2;
end

% trans(1:n, n/2+1:n) = 0;

% trans(n/4+1:n, n/4+1:n) = trans(n/4+1:n, n/4+1:n)/4;

trans(1,1) = saved;
out = Wi*(Wi*(trans).').';
imshow([I, uint8(abs(trans)*10), uint8(out)]);

imwrite([I, uint8(abs(trans)*10), uint8(out)], "u05/task2.png");



