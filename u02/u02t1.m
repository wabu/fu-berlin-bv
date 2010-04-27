
printf('-- u02 task1 - FFT\n');

I_in = loadimageprompt();

I_trans = fft2d(double(I_in));

imshow(uint8(real(I_trans)));
imwrite(uint8(real(I_trans)), 'u02/f_out.png');


