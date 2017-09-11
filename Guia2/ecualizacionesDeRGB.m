function [] = ecualizacionesDeRGB(imagen)
    [filas, columnas, canales] = size(imagen);
    if canales ~= 3
        throw('El canal debe tener 3 canales')
    end
    if isa(imagen, 'uint8') ~= 1
        throw('La imagen debe ser de enteros de 8 bits')
    end
    ecualizacionR = ecualizacion(imagen(:, :, 1), false);
    ecualizacionG = ecualizacion(imagen(:, :, 2), false);
    ecualizacionB = ecualizacion(imagen(:, :, 3), false);
    figure, subplot(2, 2, 1), imshow(imagen), title('imagen original');
    subplot(2, 2, 2), imshow(ecualizacionR), title('Ecualización canal R');
    subplot(2, 2, 3), imshow(ecualizacionG), title('Ecualización canal G');
    subplot(2, 2, 4), imshow(ecualizacionB), title('Ecualización canal B');
    nuevaImagen(:, :, 1) = ecualizacionR;
    nuevaImagen(:, :, 2) = ecualizacionG;
    nuevaImagen(:, :, 3) = ecualizacionB;
    figure, imshow(nuevaImagen), title('imagen con todos sus canales ecualizados');
end