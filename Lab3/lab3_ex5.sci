// EXERCISE 5
function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    
    len = n_max - n_min + 1;
    yorigin = 1 - n_min; 
    
    y1 = zeros(1, len);
    y2 = zeros(1, len);
    y1(n1 - n_min + 1) = x1n;
    y2(n2 - n_min + 1) = x2n;
    
    yn = y1 .* y2;
endfunction

x1n = [0, 1, 3, -2];  x1origin = 1;
x2n = [1, 1, 2, 3];   x2origin = 2;

[yn, yorigin] = multi(x1n, x1origin, x2n, x2origin);

disp("--- Kết quả Exercise 5 ---");
disp("yn = "); disp(yn);
disp("yorigin = "); disp(yorigin);

scf(5); 
n1 = (1:length(x1n)) - x1origin;
n2 = (1:length(x2n)) - x2origin;
ny = (1:length(yn)) - yorigin;

subplot(3, 1, 1);
plot2d3(n1, x1n); plot(n1, x1n, 'ro');
title("Signal x_1(n)", "fontsize", 4); xgrid();

subplot(3, 1, 2);
plot2d3(n2, x2n); plot(n2, x2n, 'go');
title("Signal x_2(n)", "fontsize", 4); xgrid();

subplot(3, 1, 3);
plot2d3(ny, yn); plot(ny, yn, 'mo');
title("Multiplied Signal y(n) = x_1(n) .* x_2(n)", "fontsize", 4);
xlabel("n", "fontsize", 3); xgrid();
