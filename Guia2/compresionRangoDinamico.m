function [y] = compresionRangoDinamico(imagenOriginal)
if size(imagenOriginal) > 2
    imagen = imagenOriginal(:, :, 1);
else
    imagen = imagenOriginal;
end

R = double( max ( max (imagen) ) );
L = 255;
c = double(L - 1) / log (1 + R);
y = uint8( c .* log ( 1 + double(imagen) ) );
imshow(y);
end