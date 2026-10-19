function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn; yorigin = xorigin - k;
endfunction

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin; n2 = (1:length(x2n)) - x2origin;
    n_min = min(min(n1), min(n2)); n_max = max(max(n1), max(n2));
    len = n_max - n_min + 1; yorigin = 1 - n_min; 
    y1 = zeros(1, len); y2 = zeros(1, len);
    y1(n1 - n_min + 1) = x1n; y2(n2 - n_min + 1) = x2n;
    yn = y1 + y2;
endfunction

function [yn, yorigin] = scale_sq(xn, xorigin)
    nx = (1:length(xn)) - xorigin;
    max_nx = max(nx); if max_nx < 0 then max_nx = 0; end
    limit = floor(sqrt(max_nx));
    n_new = -limit:limit;
    yn = zeros(1, length(n_new));
    yorigin = limit + 1;
    for i = 1:length(n_new)
        idx = find(nx == (n_new(i)^2));
        if ~isempty(idx) then yn(i) = xn(idx(1)); end
    end
endfunction

function [yn, yorigin] = sys_nx(xn, xorigin)
    nx = (1:length(xn)) - xorigin;
    yn = xn .* nx;
    yorigin = xorigin;
endfunction

function plot_signal(n_arr, origin, pos, title_str, p_style)
    nx = (1:length(n_arr)) - origin;
    subplot(3, 2, pos);
    plot2d3(nx, n_arr); plot(nx, n_arr, p_style);
    title(title_str, "fontsize", 4); 
    a = gca(); a.x_location = "origin"; 
endfunction

xn = [1, 1, 1, 1]; xorigin = 1; 

[x_d2, xo_d2] = delay(xn, xorigin, 2); 

[yb, ybo] = scale_sq(xn, xorigin);
[yb_delay, ybo_delay] = delay(yb, ybo, 2); 
[yb2, ybo2] = scale_sq(x_d2, xo_d2);   

[x_d1, xo_d1] = delay(xn, xorigin, 1);
[yc, yco] = add(xn, xorigin, -x_d1, xo_d1);
[yc_delay, yco_delay] = delay(yc, yco, 2); 

[x_d3, xo_d3] = delay(x_d2, xo_d2, 1);
[yc2, yco2] = add(x_d2, xo_d2, -x_d3, xo_d3); 

[yd, ydo] = sys_nx(xn, xorigin);
[yd_delay, ydo_delay] = delay(yd, ydo, 2); 
[yd2, ydo2] = sys_nx(x_d2, xo_d2);        

scf(10);
plot_signal(yb_delay, ybo_delay, 1, "(b) System x(n^2): y(n-2)", 'ro');
plot_signal(yb2, ybo2, 2, "(b) System x(n^2): y_2(n) = T[x(n-2)]", 'bo');

plot_signal(yc_delay, yco_delay, 3, "(c) System x(n)-x(n-1): y(n-2)", 'ro');
plot_signal(yc2, yco2, 4, "(c) System x(n)-x(n-1): y_2(n) = T[x(n-2)]", 'bo');

plot_signal(yd_delay, ydo_delay, 5, "(d) System n*x(n): y(n-2)", 'ro');
plot_signal(yd2, ydo2, 6, "(d) System n*x(n): y_2(n) = T[x(n-2)]", 'bo');
