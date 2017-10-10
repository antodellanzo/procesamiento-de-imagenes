function [] = ej5()
lena = imread('lena.png');
figure;
lenaConLineas = double(lena)/255.0 + lineas512x512();
subplot(2, 4, 1), imshow(lenaConLineas), title('Lena con lineas');
lenaFourier = fftshift(fft2(lenaConLineas));
subplot(2, 4, 2), imshow(lenaFourier), title('Fourier de lena con lineas');
moduloFourier = abs(lenaFourier);
[m, n, canales] = size(lenaConLineas);
for fila = 1 : m
    for columna = 1 : n
        if moduloFourier(fila, columna) > 100000
            lenaFourier(fila, columna) = 0;
        end
    end
end
subplot(2, 4, 3), imshow(lenaFourier), title('Fourier final');
lena = ifft2(fftshift(lenaFourier));
subplot(2, 4, 4), imshow(lena), title('Lena sin lineas');
end