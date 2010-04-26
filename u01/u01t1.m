# octave script to apply hadamard transformation on 
# quadratic image with isize 2**p

printf('-- u01/task1 - hadamard transformation\n\n');


# load image into matrix
I_in = loadimageprompt();

[rows, cols] = size(I_in);

if rows != cols && mod(rows,2) != 0
    printf('image size [%d x %d] is not supported', cols, rows);
    return;
end

H = hadamard(rows);
H = H/sqrt(rows);

I_trans = H*double(I_in)*H;
I_trans = reduce(I_trans,0.2);
I_out = H*I_trans*H;

I_con = [I_in, I_in - I_out , I_out];

imshow(uint8(I_con));
imwrite(uint8(I_con), "u01/h_out.png");


