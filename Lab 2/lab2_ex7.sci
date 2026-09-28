// Exercise 7: Multiplication of two signals
n = -1:3; 

// Zero-padding
x1 = [0, 0, 1, 3, -2]; 
x2 = [0, 1, 2, 3, 0];

y = x1 .* x2; 

subplot(3, 1, 1);
plot2d3(n, x1); plot(n, x1, 'ro');
title("Signal x_1(n)", "fontsize", 4); xlabel("n", "fontsize", 3); ylabel("Amplitude", "fontsize", 3);

subplot(3, 1, 2);
plot2d3(n, x2); plot(n, x2, 'go');
title("Signal x_2(n)", "fontsize", 4); xlabel("n", "fontsize", 3); ylabel("Amplitude", "fontsize", 3);

subplot(3, 1, 3);
plot2d3(n, y); plot(n, y, 'mo');
title("Product Signal y(n) = x_1(n) . x_2(n)", "fontsize", 4); xlabel("n", "fontsize", 3); ylabel("Amplitude", "fontsize", 3);
