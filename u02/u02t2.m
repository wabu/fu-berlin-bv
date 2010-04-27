printf('-- u02 task2 - Conv\n');

I = loadimageprompt();

n = length(I);
k = [0.4,0.2,0.1,zeros(1,n-5),0.1,0.2];
K = k' * k;

printf('using fft\n')
tic()
If = conv(K, double(I));
toc()

printf('using dft\n')
tic()
Id = conv_(K, double(I));
toc()

imshow(uint8(real(If)));
imwrite(uint8(real(If)), 'u02/c_out.png');


