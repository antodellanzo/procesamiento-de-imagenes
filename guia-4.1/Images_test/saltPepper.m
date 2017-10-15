function [] = saltPepper(imagen, intensidad)
cuantoQuitarDeIntensidad = floor(intensidad * 255.0);
P_p = cuantoQuitarDeIntensidad;
P_s = 255 - cuantoQuitarDeIntensidad;
[filas, columnas, canales] = size(imagen);
matrizSalYPimienta = randi( 255, filas, columnas );
imagenConRuido = imagen;
imagenConRuido( matrizSalYPimienta <= P_p ) = 0;
imagenConRuido( matrizSalYPimienta >= P_s ) = 255;
figure,
subplot(1, 2, 1), imshow(imagenConRuido, []), title('Imagen con ruido Salt & Pepper');
subplot(1, 2, 2), imshow(medianFilter( imagenConRuido, 3, false ), []), title('Imagen luego de aplicar filtro de mediana de 3x3');
end