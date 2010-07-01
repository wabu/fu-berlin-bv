
I1 = loadimage('banana.jpg');
I2 = loadimage('banana2.jpg');
I3 = loadimage('lena512color.tiff');

[Y1,U1,V1] = rgb2yuv(I1);
[Y2,U2,V2] = rgb2yuv(I2);
[Y3,U3,V3] = rgb2yuv(I3);

hU1 = hist(U1,256);
hU2 = hist(U2,256);
hU3 = hist(U3,356);
hV1 = hist(V1,256);
hV2 = hist(V2,256);
hV3 = hist(V3,256);

plot(hU1, '1');
hold on
plot(hU2, '2');
plot(hU3, '3');
hold off

plot(hV1, '1');
hold on
plot(hV2, '2');
plot(hV3, '3');
hold off

eu = euklid(hU1,hU2)
ev = euklid(hV1,hV2)
ex = euklid(hV3,hV1)

ku = kvdiv(hU1,hU2)
kv = kvdiv(hV1,hV2)
kx  = kvdiv(hV3,hV1)


