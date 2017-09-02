function [nuevaImagen] = rgbToHsi(imagen)
    [filas, columnas, s] = size(imagen);
    nuevaImagen = double(zeros(filas, columnas));
    for fila = 1 : 1 : filas
        for columna = 1 : 1 : columnas
            R = double(imagen(fila, columna, 1)) / 255.0;
            G = double(imagen(fila, columna, 2)) / 255.0;
            B = double(imagen(fila, columna, 3)) / 255.0;
            nuevaImagen(fila, columna, 1) = getH(R, G, B) / (2*pi);
            nuevaImagen(fila, columna, 2) = getS(R, G, B);
            nuevaImagen(fila, columna, 3) = getI(R, G, B);
        end
    end
    figure;
    subplot(2, 2, 1), imshow(nuevaImagen), title('imagen en hsi');
    subplot(2, 2, 2), imshow(nuevaImagen(:, :, 1)), title('h');
    subplot(2, 2, 3), imshow(nuevaImagen(:, :, 2)), title('s');
    subplot(2, 2, 4), imshow(nuevaImagen(:, :, 3)), title('i');
end

function [x] = getH(R, G, B)
operandoArriba = 0.5 * ( R - G + R - B );
operandoAbajo = sqrt( ( R - G )*( R - G ) + ( R - B )*( G - B ) );
x = acos( operandoArriba / operandoAbajo );
if (B > G)
    x = 2*pi - x;
end
end

function [x] = getS(R, G, B)
x = 1.0 - ( ( 3.0 / (R + G + B ) )*(min(min(R, G), B)));
end

function [x] = getI(R, G, B)
x = (R + G + B) / 3;
end