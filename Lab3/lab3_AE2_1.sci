function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
endfunction

function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;
endfunction

function plot_signal(n_arr, origin, pos, title_str, p_style)
    nx = (1:length(n_arr)) - origin;
    subplot(3, 1, pos);
    plot2d3(nx, n_arr); 
    plot(nx, n_arr, p_style);
    title(title_str, "fontsize", 4); 
    xlabel("n", "fontsize", 3);
    xgrid();
endfunction

xn = [0, 1/3, 2/3, 1, 1, 1, 1];
xorigin = 4;

[v1, v1_orig] = fold(xn, xorigin);
[y1, y1_orig] = delay(v1, v1_orig, 4);

[v2, v2_orig] = delay(xn, xorigin, 4);
[y2, y2_orig] = fold(v2, v2_orig);

scf(7);
plot_signal(xn, xorigin, 1, "(a) Original Signal x(n)", 'ro');
plot_signal(y1, y1_orig, 2, "(b.1) Fold then Delay: y_1(n) = x(-n+4)", 'bo');
plot_signal(y2, y2_orig, 3, "(b.2) Delay then Fold: y_2(n) = x(-n-4)", 'mo');
