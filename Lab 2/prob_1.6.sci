n_seq = 0:40;
x_periodic = cos(2 * %pi * (1/6) * n_seq);
subplot(2, 1, 1);
plot2d3(n_seq, x_periodic); plot(n_seq, x_periodic, 'ro');
title("1.6: Periodic Sampled Signal (Rational T/Tp = 1/6)", "fontsize", 4);

x_nonperiodic = cos(2 * %pi * (1/%pi) * n_seq);
subplot(2, 1, 2);
plot2d3(n_seq, x_nonperiodic); plot(n_seq, x_nonperiodic, 'bo');
title("1.6: Non-periodic Sampled Signal (Irrational T/Tp = 1/pi)", "fontsize", 4);
