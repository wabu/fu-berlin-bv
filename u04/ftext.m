I = loadimageprompt();
n = length(I);

I_ = abs(fftshift(fft(fft(double(I)).').')*100/512**2);
for x = 246:266
    for y = 246:266
        I_(x,y)=0;
    end
end

[a,ir] = max(I_);
[_,ic] = max(a);

x = double(n/2 - ic);
y = double(n/2 - ir(ic));

alpha = atan(x/y)*360.0/(2.0*pi);
size = sqrt(x*x+y*y);

printf('max at %d,%d\n', x,y);
printf('please rotate by %.2f\n', alpha);
printf('line spacing is %.2fpx\n', size);

imshow([I, uint8(real(I_))]);


