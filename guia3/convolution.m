function [nuevaImagen] = convolution(imagen, kernel)
[filas, columnas, canales] = size(imagen);
[m, n] = size(kernel);
nuevaImagen = zeros(filas, columnas);
a = uint8( (m-1)/2 );
b = uint8( (n-1)/2 );
for fila = 1 : filas
    for columna = 1 : columnas
        for s = 1 : m
            ss = m - s + 1;
            for t = 1 : n
                tt = n - t + 1;
                i = fila + ( s - a );
                j = columna + ( t - b );
                if i > 1 && i <= filas && j > 1 && j <= columnas
                    nuevaImagen(fila,columna) = nuevaImagen(fila,columna) + ( imagen(i,j)*kernel(ss,tt) );
                end
            end
        end
    end
end
end