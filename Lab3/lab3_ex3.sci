// EXERCISE 3
function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);                        
    yorigin = length(xn) - xorigin + 1;    
endfunction

xn = [1, -2, 3, 6];
xorigin = 3;

[yn, yorigin] = fold(xn, xorigin);

disp("--- Kết quả Exercise 3 ---");
disp("yn = "); disp(yn);
disp("yorigin = "); disp(yorigin);

scf(3);
nx = (1:length(xn)) - xorigin; 
ny = (1:length(yn)) - yorigin;

subplot(2, 1, 1);
plot2d3(nx, xn); plot(nx, xn, 'ro');
title("Original Signal x(n)", "fontsize", 4);
xlabel("n", "fontsize", 3); ylabel("Amplitude", "fontsize", 3);
xgrid();

subplot(2, 1, 2);
plot2d3(ny, yn); plot(ny, yn, 'mo'); 
title("Folded Signal y(n) = x(-n)", "fontsize", 4);
xlabel("n", "fontsize", 3); ylabel("Amplitude", "fontsize", 3);
xgrid();
