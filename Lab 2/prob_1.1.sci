// a.
n_stocks = 1:30;
prices = 100 + cumsum(rand(1, 30, "normal")); 
subplot(2, 1, 1);
plot2d3(n_stocks, prices); 
plot(n_stocks, prices, 'ro');
title("1.1(a) Stock Prices (Discrete-time, Digital, 1D)", "fontsize", 4);
xlabel("Days", "fontsize", 3); ylabel("Price", "fontsize", 3);

// c.
t_steer = 0:0.01:5; 
angle = 45 * sin(%pi * t_steer / 2);
subplot(2, 1, 2);
plot(t_steer, angle, 'b-');
title("1.1(c) Steering Wheel Angle (Continuous-time, Analog, 1D)", "fontsize", 4);
xlabel("Time (s)", "fontsize", 3); ylabel("Angle (degrees)", "fontsize", 3);
