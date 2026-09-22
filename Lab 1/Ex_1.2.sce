//1.
t = 0:0.0001:0.1;
xa = 3 * sin(100 * %pi * t);
plot(t, xa);

//2.
n = 0:30;
xn = 3 * sin((%pi / 3) * n);
plot2d3(n, xn);
plot(n, xn, 'ro');

//3.
delta = 0.1;
xq = floor(xn / delta) * delta; 
plot2d3(n, xq);
plot(n, xq, 'bo');
