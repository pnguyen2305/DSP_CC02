// Exercise 8: Signal Manipulations
n = -6:6; 

x = zeros(1, 13);
x(5:8) = [1, -2, 3, 6]; 

// a) y1(n) = x(-n)
y1 = x($:-1:1);

// b) y2(n) = x(n+3)
y2 = zeros(1, 13);
y2(1:10) = x(4:13); 

// c) y3(n) = 2x(-n-2): 
y3 = zeros(1, 13);
y3(1:11) = 2 * y1(3:13); 

//x(n) và y1(n)
scf(1); 
subplot(2, 1, 1);
plot2d3(n, x); plot(n, x, 'ro'); title("Original Signal x(n)", "fontsize", 4);
subplot(2, 1, 2);
plot2d3(n, y1); plot(n, y1, 'bo'); title("y_1(n) = x(-n)", "fontsize", 4);

//x(n) và y2(n)
scf(2); 
subplot(2, 1, 1);
plot2d3(n, x); plot(n, x, 'ro'); title("Original Signal x(n)", "fontsize", 4);
subplot(2, 1, 2);
plot2d3(n, y2); plot(n, y2, 'go'); title("y_2(n) = x(n+3)", "fontsize", 4);

//x(n) và y3(n)
scf(3); 
subplot(2, 1, 1);
plot2d3(n, x); plot(n, x, 'ro'); title("Original Signal x(n)", "fontsize", 4);
subplot(2, 1, 2);
plot2d3(n, y3); plot(n, y3, 'mo'); title("y_3(n) = 2x(-n-2)", "fontsize", 4);
