function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;
endfunction

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin; n2 = (1:length(x2n)) - x2origin;
    n_min = min(min(n1), min(n2)); n_max = max(max(n1), max(n2));
    len = n_max - n_min + 1; yorigin = 1 - n_min; 
    y1 = zeros(1, len); y2 = zeros(1, len);
    y1(n1 - n_min + 1) = x1n; y2(n2 - n_min + 1) = x2n;
    yn = y1 + y2;
endfunction

function plot_signal(n_arr, origin, pos, title_str, p_style)
    nx = (1:length(n_arr)) - origin;
    subplot(4, 1, pos);
    plot2d3(nx, n_arr); plot(nx, n_arr, p_style);
    title(title_str, "fontsize", 4); 
    a = gca(); a.x_location = "origin"; 
endfunction

xn = [2, 3, 4, 5, 6];
xorigin = 3; 

[x_fold, xo_fold] = fold(xn, xorigin);

[x_add, xo_add] = add(xn, xorigin, x_fold, xo_fold);
xe = 0.5 * x_add;
xe_orig = xo_add;

x_fold_neg = -1 * x_fold;
[x_sub, xo_sub] = add(xn, xorigin, x_fold_neg, xo_fold);
xo = 0.5 * x_sub;
xo_orig = xo_sub;

[x_recon, xr_orig] = add(xe, xe_orig, xo, xo_orig);

scf(9);
plot_signal(xn, xorigin, 1, "Original Signal x(n)", 'ro');
plot_signal(xe, xe_orig, 2, "Even Component x_e(n)", 'bo');
plot_signal(xo, xo_orig, 3, "Odd Component x_o(n)", 'mo');
plot_signal(x_recon, xr_orig, 4, "Reconstructed Signal x_e(n) + x_o(n) = x(n)", 'go');
