disp("--- EXERCISE 7 ---");

function y_circ = circ_conv_matrix(x, h, N_circ)
x_pad = [x, zeros(1, N_circ - length(x))];
h_pad = [h, zeros(1, N_circ - length(h))];
X_circ = zeros(N_circ, N_circ);
for i = 1:N_circ
X_circ(:, i) = [x_pad(N_circ-i+2:N_circ), x_pad(1:N_circ-i+1)]';
end
y_circ = X_circ * h_pad';
endfunction


x3 = [1, 1, 2, -3, 2, 1];
h3 = [1, 0, -1, -1, 1];
N_circ1 = max(length(x3), length(h3));

x4 = [1, 2, -3, 2, 1];
h4 = [1, 1, 0, -1, -1, 1];
N_circ2 = max(length(x4), length(h4));
y4_circ = circ_conv_matrix(x4, h4, N_circ2);

E_x4 = cumsum(x4.^2);

scf(2); clf;
subplot(3,1,1); plot2d3(1:length(x4), x4); title("x(n)");
subplot(3,1,2); plot2d3(1:N_circ2, y4_circ'); title("y(n) Circular Convolution");
subplot(3,1,3); plot2d3(1:length(x4), E_x4); title("Energy of x(n)");
