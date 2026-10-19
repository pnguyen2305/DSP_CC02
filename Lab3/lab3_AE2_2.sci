function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn; yorigin = xorigin - k;
endfunction

function [yn, yorigin] = advance(xn, xorigin, k)
    yn = xn; yorigin = xorigin + k;
endfunction

function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1); yorigin = length(xn) - xorigin + 1;
endfunction

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin; n2 = (1:length(x2n)) - x2origin;
    n_min = min(min(n1), min(n2)); n_max = max(max(n1), max(n2));
    len = n_max - n_min + 1; yorigin = 1 - n_min; 
    y1 = zeros(1, len); y2 = zeros(1, len);
    y1(n1 - n_min + 1) = x1n; y2(n2 - n_min + 1) = x2n;
    yn = y1 + y2;
endfunction

function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin; n2 = (1:length(x2n)) - x2origin;
    n_min = min(min(n1), min(n2)); n_max = max(max(n1), max(n2));
    len = n_max - n_min + 1; yorigin = 1 - n_min; 
    y1 = zeros(1, len); y2 = zeros(1, len);
    y1(n1 - n_min + 1) = x1n; y2(n2 - n_min + 1) = x2n;
    yn = y1 .* y2;
endfunction

function [yn, yorigin] = scale_sq(xn, xorigin)
    nx = (1:length(xn)) - xorigin;
    max_nx = max(nx);
    if max_nx < 0 then max_nx = 0; end
    limit = floor(sqrt(max_nx));
    n_new = -limit:limit;
    yn = zeros(1, length(n_new));
    yorigin = limit + 1; 
    for i = 1:length(n_new)
        sq_val = n_new(i)^2;
        idx = find(nx == sq_val);
        if ~isempty(idx) then
            yn(i) = xn(idx(1));
        end
    end
endfunction

function plot_signal(n_arr, origin, pos, title_str, p_style)
    nx = (1:length(n_arr)) - origin;
    subplot(4, 2, pos);
    plot2d3(nx, n_arr); plot(nx, n_arr, p_style);
    title(title_str, "fontsize", 4); 
    a = gca(); a.x_location = "origin"; 
endfunction

xn = [1, 1, 1, 1, 0.5, 0.5];
xorigin = 2;

dn = [1]; dorigin = 1;
un = ones(1, 15); uorigin = 1; 

[ya, yao] = delay(xn, xorigin, 2);

[v_b, vo_b] = fold(xn, xorigin);
[yb, ybo] = delay(v_b, vo_b, 4);

[yc, yco] = advance(xn, xorigin, 2);

[u_fold, uo_fold] = fold(un, uorigin);
[u_2_minus_n, uo_2_minus_n] = delay(u_fold, uo_fold, 2);
[yd, ydo] = multi(xn, xorigin, u_2_minus_n, uo_2_minus_n);

[x_n_minus_1, xo_n_minus_1] = delay(xn, xorigin, 1);
[d_n_minus_3, do_n_minus_3] = delay(dn, dorigin, 3);
[ye, yeo] = multi(x_n_minus_1, xo_n_minus_1, d_n_minus_3, do_n_minus_3);

[yf, yfo] = scale_sq(xn, xorigin);

[x_fold, xo_fold] = fold(xn, xorigin);
[x_add, xo_add] = add(xn, xorigin, x_fold, xo_fold);
yg = 0.5 * x_add; ygo = xo_add;

x_fold_neg = -1 * x_fold; 
[x_sub, xo_sub] = add(xn, xorigin, x_fold_neg, xo_fold);
yh = 0.5 * x_sub; yho = xo_sub;

scf(8);
plot_signal(ya, yao, 1, "(a) x(n-2)", 'ro');
plot_signal(yb, ybo, 2, "(b) x(4-n)", 'bo');
plot_signal(yc, yco, 3, "(c) x(n+2)", 'go');
plot_signal(yd, ydo, 4, "(d) x(n)u(2-n)", 'mo');
plot_signal(ye, yeo, 5, "(e) x(n-1) δ (n-3)", 'co');
plot_signal(yf, yfo, 6, "(f) x(n^2)", 'ro');
plot_signal(yg, ygo, 7, "(g) Even part of x(n)", 'bo');
plot_signal(yh, yho, 8, "(h) Odd part of x(n)", 'mo');
