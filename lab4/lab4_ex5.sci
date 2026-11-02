img = imread("D:\Download\testing.jpg"); 
gray_img = rgb2gray(img);
eq_img = imhistequal(gray_img)

scf(3);
subplot(1,2,1); imshow(gray_img); title("Original Grayscale");
subplot(1,2,2); imshow(eq_img); title("Equalized Image");
