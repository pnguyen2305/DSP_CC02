// EXERCISE 6
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = convol(xn, hn);

    yorigin = xorigin + horigin - 1;
endfunction

xn = [1, 2, -1]; xorigin = 2;
hn = [1, 1, 1];  horigin = 1;

[yn, yorigin] = convolution(xn, xorigin, hn, horigin);

disp("--- Kết quả Exercise 6 ---");
disp("yn = "); disp(yn);
disp("yorigin = "); disp(yorigin);

scf(6); 
nx = (1:length(xn)) - xorigin;
nh = (1:length(hn)) - horigin;
ny = (1:length(yn)) - yorigin;

subplot(3, 1, 1);
plot2d3(nx, xn); plot(nx, xn, 'ro');
title("Input Signal x(n)", "fontsize", 4); xgrid();

subplot(3, 1, 2);
plot2d3(nh, hn); plot(nh, hn, 'go');
title("Impulse Response h(n)", "fontsize", 4); xgrid();

subplot(3, 1, 3);
plot2d3(ny, yn); plot(ny, yn, 'bo');
title("Convolution y(n) = x(n) * h(n)", "fontsize", 4);
xlabel("n", "fontsize", 3); xgrid();
