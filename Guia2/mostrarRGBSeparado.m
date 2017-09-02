function [] = mostrarRGBSeparado(imagen)
    [filas, columnas, canales] = size(imagen);
    figure, subplot(2, 2, 1), imshow(imagen);
    for i = 1 : 1 : canales
        subplot(2, 2, i + 1), imshow(imagen(:, :, i));
    end
end