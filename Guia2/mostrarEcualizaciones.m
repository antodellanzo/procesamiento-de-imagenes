function [] = mostrarEcualizaciones(imagen)
    [filas, columnas, canales] = size(imagen);
    figure, subplot(2, 2, 1), imshow(imagen), title('imagen original');
    for i = 1 : 1 : canales
        subplot(2, 2, i + 1), imshow(ecualizacion(imagen(:, :, i), false));
    end
end