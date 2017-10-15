function [] = ej5()
lena = imread('lena.png');
figure;
lenaConLineas = double(lena)/255.0 + lineas512x512();
subplot(1, 2, 1), imshow(lenaConLineas), title('Lena con lineas');
lenaFourier = fftshift(fft2(lenaConLineas));
fourier = log10(abs(lenaFourier));
subplot(1, 2, 2), imagesc(fourier), title('Fourier de lena con lineas');

lenaFourier(257, fourier(257, :) > 2.0) = 0;
figure;
imshow(ifft2(fftshift(lenaFourier)), []);
end