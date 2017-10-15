function [] = ej4(imagen1, imagen2)
imagen1Transformada = fft2(double(imagen1)/255.0);
imagen2Transformada = fft2(double(imagen2)/255.0);
moduloImagen1Transformada = abs(imagen1Transformada);
moduloImagen2Transformada = abs(imagen2Transformada);
faseImagen1Transformada = angle(imagen1Transformada);
faseImagen2Transformada = angle(imagen2Transformada);
figure;
imagenNueva1 = ifft2(moduloImagen1Transformada.*exp( -1i*faseImagen2Transformada ));
imagenNueva2 = ifft2(moduloImagen2Transformada.*exp( -1i*faseImagen1Transformada ));
subplot(1, 4, 1), imshow(imagen1);
subplot(1, 4, 2), imshow(imagen2);
subplot(1, 4, 3), imshow(imagenNueva1,[]), title('abs imagen 1 con fase imagen 2');
subplot(1, 4, 4), imshow(imagenNueva2, []), title('abs imagen 2 con fase imagen 1');
end