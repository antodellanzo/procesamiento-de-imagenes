function [] = alterarHue(imagenEnRGB)
[filas, columnas, canales] = size(imagenEnRGB);
if canales ~= 3
    throw('El canal debe tener 3 canales')
end
if isa(imagenEnRGB, 'uint8') ~= 1
    throw('La imagen debe ser de enteros de 8 bits')
end

imagenEnHSI = rgbToHsi(imagenEnRGB, false);

c = [20, 45, 60, 90, 140, 180, 240, 300];
for angulo = c
   figure;
   subplot(1, 2, 1), imshow(imagenEnRGB), title('imagen original');
   str = sprintf('imagen con un nuevo angulo %d', angulo);
   subplot(1, 2, 2), imshow(aplicarTransformacionAH(angulo, imagenEnHSI)), title(str);
end
end

function [nuevaImagen] = aplicarTransformacionAH(angulo, imagenHSI)
nuevaImagen = imagenHSI;
H = nuevaImagen(:, :, 1);
%muevo a H entre 0 y 360°
H = H .* 360;
%transformo H
H = H + double(angulo);
if angulo > 0
    %veo los valores que se pasaron de 360°
    n = find (H >= 360);
    H(n) = 360 - H(n);
end
if angulo < 0
    %veo si hay valores que se pasaron a negativo
    n = find (H < 0);
    H(n) = H(n) + 360;
end
%vuelvo a llevar a H entre 0 y 1
H = H ./ 360;
%genero la imagen con el nuevo H
nuevaImagen(:, :, 1) = H;
end