function [] = getHistogramas(imagen)
    [filas, columnas, canales] = size(imagen);
    for i = 1 : 1 : canales
        str = sprintf('histograma %d', i);
        figure, imhist(imagen(:, :, i)), title(str);
    end
end