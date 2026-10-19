// EXERCISE 1
function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;                
    yorigin = xorigin - k;   
endfunction

xn = [1, -2, 3, 6];
xorigin = 3;
k = 1;

[yn, yorigin] = delay(xn, xorigin, k);

disp("--- Kết quả Exercise 1 ---");
disp("yn = "); disp(yn);
disp("yorigin = "); disp(yorigin);

scf(1);

nx = (1:length(xn)) - xorigin; 
ny = (1:length(yn)) - yorigin;

subplot(2, 1, 1);
plot2d3(nx, xn); plot(nx, xn, 'ro');
title("Original Signal x(n)", "fontsize", 4);
xlabel("n", "fontsize", 3); ylabel("Amplitude", "fontsize", 3);
xgrid();

subplot(2, 1, 2);
plot2d3(ny, yn); plot(ny, yn, 'bo');
title("Delayed Signal y(n) = x(n - 1)", "fontsize", 4);
xlabel("n", "fontsize", 3); ylabel("Amplitude", "fontsize", 3);
xgrid();
