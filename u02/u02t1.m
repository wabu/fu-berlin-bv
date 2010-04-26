
printf('-- u02 task1 - FFT\n');

I_in = loadimageprompt();

I_trans = fft(fft(double(I_in))');


imshow(uint8(real(I_trans)));


