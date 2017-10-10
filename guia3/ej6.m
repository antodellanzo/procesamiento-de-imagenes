function [] = ej6()
lena = imread('lena.png');
kernel = lineas512x512();
conv = conv2(double(lena), double(kernel));
fourierDeConv = fft2(conv);
figure, subplot(1, 2, 1), imshow(fftshift(fourierDeConv));
fourierLena = fft2(lena);
fourierKernel = fft2(kernel);
mult = fourierLena * fourierKernel;
subplot(1, 2, 2), imshow(fftshift(mult));
end