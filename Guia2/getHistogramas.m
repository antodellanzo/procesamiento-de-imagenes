function [] = histogramasDeImagenRGB(imagen)
    [filas, columnas, canales] = size(imagen);
    if canales == 3
        figure, imhist(imagen(:, :, 1)), title('Histograma de canal R');
        figure, imhist(imagen(:, :, 2)), title('Histograma de canal G');
        figure, imhist(imagen(:, :, 3)), title('Histograma de canal B');
    end
end