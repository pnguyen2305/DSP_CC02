//1.
t = 0:0.0001:0.1;
xa = 3 * sin(100 * %pi * t);
subplot(3,1,1);
plot(t, xa);
xtitle("Analog Signal x_a(t)", "t (s)", "Amplitude");

//2.
n = 0:30;
xn = 3 * sin((%pi / 3) * n);
subplot(3,1,2);
plot2d3(n, xn);
plot(n, xn, 'ro');
xtitle("Discrete-time Signal x(n)", "n (samples)", "Amplitude");

//3.
delta = 0.1;
xq = floor(xn / delta) * delta;
subplot(3,1,3);
plot2d3(n, xq);
plot(n, xq, 'bo');
xtitle("Quantized Signal x_q(n)", "n (samples)", "Amplitude");
