disp("--- EXERCISE 6 ---");

x1 = [1, 1, 2, -3, 2, 1]; 
h1 = [1, 0, -1];
y1_shift = convol(x1, h1);

x2 = [1, 2, -3, 2, 1];
h2 = [1, 0, -1];
M = length(h2); N = length(x2);
L = M + N - 1;

H_mat = zeros(L, N);
for i = 1:N
    H_mat(i:i+M-1, i) = h2';
end
y2_matrix = H_mat * x2';


E_x2 = cumsum(x2.^2);

scf(1); clf;
subplot(3,1,1); plot2d3(1:N, x2); title("x(n) (Matrix method)");
subplot(3,1,2); plot2d3(1:L, y2_matrix'); title("y(n) Linear Convolution");
subplot(3,1,3); plot2d3(1:N, E_x2); title("Energy of x(n)");
