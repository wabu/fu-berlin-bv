I = loadimage("goal.jpg");
H = rgb2hsv(I);

plot3(I(:,:,1), I(:,:,2), I(:,:,3), '.');
plot3(H(:,:,1), H(:,:,2), H(:,:,3), '.');

