function [] = ecualizarIDeHsiYTransformarEnRGB(imagenEnRGB)
    imagenEnHSI = rgbToHsi(imagenEnRGB, false);
    I = im2uint8(imagenEnHSI(:, :, 3));
    
    figure;
    subplot(2, 2, 1), imshow(imagenEnRGB), title('imagen original');
    subplot(2, 2, 2), imshow(imagenEnHSI), title('imagen en hsi');
    
    IEcualizado = ecualizacion(I, false) ./ 255 ;
    imagenEnHSI(:, :, 3) = IEcualizado;
    imagenRGBConIEcualizado = hsiToRgb(imagenEnHSI, false);
    
    subplot(2, 2, 3), imshow(imagenEnHSI), title('imagen hsi con I ecualizado');
    subplot(2, 2, 4), imshow(imagenRGBConIEcualizado), title('imagen en rgb con I ecualizado');    
end