t = 0:0.00005:0.015;
xa = 3 * cos(600 * %pi * t) + 2 * cos(1800 * %pi * t);

//Sampling
Fs = 1000;
Ts = 1 / Fs;
n_sample = 0:15;
t_sample = n_sample * Ts;
xn = 3 * cos(600 * %pi * t_sample) + 2 * cos(1800 * %pi * t_sample);

// Quantization
L = 1024; 
xmax = 5; 
xmin = -5;
delta = (xmax - xmin) / (L - 1); 
xq = round((xn - xmin) / delta) * delta + xmin; 

plot(t, xa, 'b-');
plot(t_sample, xq, 'ro');
title("Problem 1.10: A/D Conversion (Fs = 1000 Hz, L = 1024)", "fontsize", 4);
xlabel("Time (s)", "fontsize", 3); ylabel("Amplitude", "fontsize", 3);
legend("Analog Signal x_a(t)", "Quantized Digital Samples x_q(n)");
xgrid();
