function [] = mostrarEcualizaciones(imagen)
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