printf('-- u04 task2 - Wavelet transformation\n');

I = loadimageprompt();

[rows,cols] = size(I);

if rows != cols && mod(cols,2)!=0
    printf('unsupported image size [%d,%d]\n',rows, cols);
    return;
end

Wi = cwavem(rows);
W  = Wi^-1;

Trans = W*(W*double(I)).';

Output = Trans+64*ones(rows);

Inv = Wi*(Wi*Trans).';

imwrite([I uint8(Output), uint8(Inv)], "u04/task2.png");

R = reduce(Trans, 5);
ROut = R+64*ones(rows);
InvR = Wi*(Wi*R).';

imwrite([I uint8(ROut), uint8(InvR)], "u04/task3.png");



