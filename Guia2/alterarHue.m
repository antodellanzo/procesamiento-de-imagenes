function [] = alterarHue(imagenEnRGB)
imagenEnHSI = rgbToHsi(imagenEnRGB, false);

c = [-45, -90, -145, -180, 45, 90, 145, 180];
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