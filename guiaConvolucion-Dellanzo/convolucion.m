function [imagenConv] = convolucion(imagenOriginal, kernelOriginal)
imagen = double(imagenOriginal)/255.0;
kernel = double(kernelOriginal);
[filas, columnas, canales] = size(imagen);
[f, c] = size(kernel);
%if f ~= c
    %error( 'El kernel debe ser cuadrado' );
imagenConv = zeros(filas, columnas, 'double');
centro = ceil(double(f)/2.0);
for fila = 1 : filas
    for columna = 1 : columnas
        acum = 0;
        a = floor(double( f - 1 )/2.0);
        elementoFinal = a;
        %Si el tamaño del kernel es un numero par, el centro va a estar
        %defasado por un elemento menos, luego debo pedir que itere un
        %elemento mas que si fuese impar, ya que cuando es impar el centro
        %es un elemento en exactamente el medio
        if mod(f, 2) == 0
            elementoFinal = a + 1;
        end
        for s = -a : elementoFinal
            for t = -a : elementoFinal
                filaActual = fila - s;
                columnaActual = columna - t;
                if filaActual > 0 && filaActual <= filas && columnaActual > 0 && columnaActual <= columnas
                    acum = acum + ( imagen(filaActual, columnaActual) * kernel( centro + s, centro + t ) );
                end
            end
        end
        imagenConv(fila, columna) = acum;
    end
end
imagenConv = imagenConv*255.0;
imshow(imagenConv,[]);
end