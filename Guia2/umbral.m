function [y] = umbral(imagenOriginal, umbral)
if size(imagenOriginal) > 2
    imagen = imagenOriginal(:, :, 1);
else
    imagen = imagenOriginal;
end

L = 256;
if umbral > L - 1
    error('El umbral debe estar dentro del rango de grises de 8 bits');
end

[filas, columnas] = size(imagen);
y = false(filas, columnas);
posicionesDeElementosMayoresAlUmbral = find ( imagen >= umbral);
y(posicionesDeElementosMayoresAlUmbral) = 1;

figure;
imshow(y);
end