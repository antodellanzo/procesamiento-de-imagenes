function [] = transformacionesLinealesYNoLinealesAImagenRGB(imagenEnRGB)
[filas, columnas, canales] = size(imagenEnRGB);
if canales ~= 3
    throw('El canal debe tener 3 canales')
end
if isa(imagenEnRGB, 'uint8') ~= 1
    throw('La imagen debe ser de enteros de 8 bits')
end

imagenEnHSI = rgbToHsi(imagenEnRGB, false);
S = imagenEnHSI(:, :, 2);

imagenEnHSI(:, :, 2) = transformacion1(S);
figure, subplot(1, 2, 1), imshow(imagenEnRGB), subplot(1, 2, 2), imshow(hsiToRgb(imagenEnHSI, false));

imagenEnHSI(:, :, 2) = transformacion2(S);
figure, subplot(1, 2, 1), imshow(imagenEnRGB), subplot(1, 2, 2), imshow(hsiToRgb(imagenEnHSI, false));

imagenEnHSI(:, :, 2) = transformacion3(S);
figure, subplot(1, 2, 1), imshow(imagenEnRGB), subplot(1, 2, 2), imshow(hsiToRgb(imagenEnHSI, false));

imagenEnHSI(:, :, 2) = transformacion4(S);
figure, subplot(1, 2, 1), imshow(imagenEnRGB), subplot(1, 2, 2), imshow(hsiToRgb(imagenEnHSI, false));

end

function [S] = transformacion1(canalS)
    S = 1 - canalS;
end

function [S] = transformacion2(canalS)
    S = canalS .^ 3;
end

function [S] = transformacion3(canalS)
    S = log(canalS);
    S( S <= 0 ) = realmin('double');
end

function [S] = transformacion4(canalS)
    [filas, columnas, canales] = size(canalS);
    v = (1:columnas) ./ columnas;
    d = diag(v);
    S = canalS * d;
    S( S < 0 ) = 0;
end