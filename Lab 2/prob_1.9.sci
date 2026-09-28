t = 0:0.0001:0.01;
xa = sin(480*%pi*t) + 3*sin(720*%pi*t);
Fs = 600;
Ts = 1/Fs;
n_sample = 0:6;
t_sample = n_sample * Ts;
xn = sin(480*%pi*t_sample) + 3*sin(720*%pi*t_sample);

ya = -2 * sin(480*%pi*t); 

scf(2);
plot(t, xa, 'b-');
plot(t, ya, 'r--');
plot(t_sample, xn, 'ko');
title("Problem 1.9: Aliasing Effect (Fs = 600 Hz)", "fontsize", 4);
xlabel("Time (s)", "fontsize", 3); ylabel("Amplitude", "fontsize", 3);
legend("Original x_a(t)", "Reconstructed y_a(t)", "Samples x(n)");
xgrid();
