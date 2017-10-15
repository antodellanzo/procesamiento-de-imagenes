function [] = ej6()
lena = double(imread('lena.png'))/255.0;
kernel = lineas512x512();

conv = conv2(lena, kernel,'full');
fourierDeConv = fft2(conv);

figure,
%subplot(1, 2, 1), 
imshow(fftshift(fourierDeConv));

fourierLena = fft2(lena);
fourierKernel = fft2(kernel);
mult = fourierLena .* fourierKernel;

figure,
%subplot(1, 2, 2), 
imshow(fftshift((mult)));
end