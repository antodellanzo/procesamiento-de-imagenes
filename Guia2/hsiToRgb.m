function [nuevaImagen] = hsiToRgb(imagen)
    [filas, columnas, s] = size(imagen);
    nuevaImagen = double(zeros(filas, columnas));
    for fila = 1 : 1 : filas
        for columna = 1 : 1 : columnas
            H = double(imagen(fila, columna, 1))*(2 * pi);
            S = double(imagen(fila, columna, 2));
            I = double(imagen(fila, columna, 3));
            nuevaImagen(fila, columna, 1) = getR(H, S, I);
            nuevaImagen(fila, columna, 2) = getG(H, S, I);
            nuevaImagen(fila, columna, 3) = getB(H, S, I);
        end
    end
    figure;
    subplot(2, 2, 1), imshow(nuevaImagen), title('imagen en rgb');
    subplot(2, 2, 2), imshow(nuevaImagen(:, :, 1)), title('r');
    subplot(2, 2, 3), imshow(nuevaImagen(:, :, 2)), title('g');
    subplot(2, 2, 4), imshow(nuevaImagen(:, :, 3)), title('b');
end

function [r] = getR(H, S, I)
    if H >= 0 && H < (2 / 3)*pi
        r = I * ( 1 + ( ( S * cos(H) ) / cos ( (pi/3) - H ) ) );
    else
        if H >= (2 / 3)*pi && H < (4 / 3)*pi
            r = I * ( 1 - S );
        else
            G = I * (1 - S);
            B = I * ( 1 + ( ( S * cos( H - ( (4 / 3)*pi ) ) ) / cos( ( pi / 3 ) - ( H - ( (4 / 3)*pi) )  ) ) );
            r = (3*I) - (G + B);
        end
    end
end

function [g] = getG(H, S, I)
    if H >= 0 && H < (2 / 3)*pi
        R = I * ( 1 + ( ( S * cos(H) ) / cos ( (pi/3) - H ) ) );
        B = I * (1 - S);
        g = (3*I) - (R + B);
    else
        if H >= (2 / 3)*pi && H < (4 / 3)*pi
            g = I * ( 1 + ( ( S * cos( H - ((2/3)*pi) ) ) / cos( (pi/3) - (H - ( (2/3)*pi) ) ) ) );
        else
            g = I * (1 - S);
        end
    end
end

function [b] = getB(H, S, I)
    if H >= 0 && H < (2 / 3)*pi
        b = I * (1 - S);
    else
        if H >= (2 / 3)*pi && H < (4 / 3)*pi
            g = I * ( 1 + ( ( S * cos( H - ((2/3)*pi) ) ) / cos( (pi/3) - (H - ( (2/3)*pi) ) ) ) );
            r = I*(1 - S);
            b = (3*I) - (r + g);
        else
            b = I * ( 1 + ( ( S * cos( H - ( (4 / 3)*pi ) ) ) / cos( ( pi / 3 ) - ( H - ( (4 / 3)*pi) )  ) ) );
        end
    end
end