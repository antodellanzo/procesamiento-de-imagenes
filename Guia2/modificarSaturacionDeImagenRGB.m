function [] = modificarSaturacionDeImagenRGB(imagenEnRGB)
[filas, columnas, canales] = size(imagenEnRGB);
if canales ~= 3
    throw('El canal debe tener 3 canales')
end
if isa(imagenEnRGB, 'uint8') ~= 1
    throw('La imagen debe ser de enteros de 8 bits')
end

imagenEnHSI = rgbToHsi(imagenEnRGB, false);
S = imagenEnHSI(:, :, 2);

c = [0.25, 0.5, 0.75, 2, 4, 6];
for constante = c
   nuevaS = S .* constante;
   imagenEnHSI(:, :, 2) = nuevaS;
   str = sprintf('imagen en hsi por constante %f', constante);
   figure, imshow(hsiToRgb(imagenEnHSI, false)), title(str);
end
end