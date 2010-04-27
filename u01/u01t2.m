# octave script to apply fourier transformation on 
# quadratic image with isize 2**p

printf('-- u01/task2 - fourier transformation\n\n');

# load image into matrix
I_in = loadimageprompt();

[rows, cols] = size(I_in);

if rows != cols && mod(rows,2) != 0
    printf('image size [%d x %d] is not supported', cols, rows);
    return;
end

F = fourier(rows);
# inverted F is conjugated F, just flip
F_conj = [F(1,:); flipud(F(2:end,:))];

I_trans =F*double(I_in)*F;
I_trans = reduce(I_trans,0.2);
I_out = uint8(real(F_conj*I_trans*F_conj));

I_con = uint8([I_in, I_in - I_out , I_out]);

imshow(I_con);
imwrite(I_con, "u01/f_out.png");
