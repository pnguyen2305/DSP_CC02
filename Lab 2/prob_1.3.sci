n = 0:32;
x13 = cos(%pi*n/2) - sin(%pi*n/8) + 3*cos(%pi*n/4 + %pi/3);

scf(1);
plot2d3(n, x13); plot(n, x13, 'ro');
title("Problem 1.3(e): Periodic Signal with N = 16", "fontsize", 4);
xlabel("n", "fontsize", 3); ylabel("Amplitude", "fontsize", 3);
xgrid();
