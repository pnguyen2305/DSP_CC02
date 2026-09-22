n = -5:5;
msignal = bool2s (n>=0);
signal = msignal.*n;
plot2d3(n,signal);
title("Unit Ramp Signal u_r(n)", "fontsize", 4);
xlabel("Time index (n)", "fontsize", 3);
ylabel("Amplitude", "fontsize", 3);
