function [imagenSinRuido] = medianFilter(imagen, tamVecindad, mostrarFiguras)
[filas, columnas, canales] = size(imagen);
imagenConRuido = imnoise(imagen, 'salt & pepper', 0.02);
imagenSinRuido = zeros(filas, columnas, 'double');
for f = 1 : filas
    for c = 1 : columnas
        indice = 1;
        vectorParaMediana = [];
        a = floor(double( tamVecindad - 1 )/2.0);
        elementoFinal = a;
        if mod(tamVecindad, 2) == 0
            elementoFinal = a + 1;
        end
        for s = -a : elementoFinal
            for t = -a : elementoFinal
                filaActual = f - s;
                columnaActual = c - t;
                if filaActual > 0 && filaActual <= filas && columnaActual > 0 && columnaActual <= columnas
                    vectorParaMediana(indice) = imagenConRuido(filaActual, columnaActual);
                    indice = indice + 1;
                end
            end
        end
        imagenSinRuido(f, c) = median(sort(vectorParaMediana));
    end
end
if mostrarFiguras
    figure,
    subplot(1, 2, 1), imshow(imagenConRuido, []), title('imagen con ruido');
    subplot(1, 2, 2), imshow(imagenSinRuido, []), title('imagen sin ruido final');
end
end