function [] = aplicarTransformacionesACadaCanal(imagen)
imagenHSI = rgbToHsi(imagen, false);
figure;
subplot(2, 2, 1), imshow(imagenHSI), title('imagen en hsi');

imagenConHTransformada = transformarH(imagenHSI);
subplot(2, 2, 2), imshow(hsiToRgb(imagenConHTransformada, false)), title('imagen con H transformada');

imagenConSTransformada = transformarS(imagenHSI);
subplot(2, 2, 3), imshow(hsiToRgb(imagenConSTransformada, false)), title('imagen con S transformada');

imagenConITransformada = transformarI(imagenHSI);
subplot(2, 2, 4), imshow(hsiToRgb(imagenConITransformada, false)), title('imagen con I transformada');

figure;
subplot(1, 2, 1), imshow(imagen), title('imagen original');
subplot(1, 2, 2), imshow(hsiToRgb(transformarTodas(imagenHSI), false)), title('imagen con todas las transformaciones juntas');
end

function [nuevaImagen] = transformarTodas(imagenHSI)
nuevaImagen = transformarH(imagenHSI);
nuevaImagen = transformarS(nuevaImagen);
nuevaImagen = transformarI(nuevaImagen);
end

function [nuevaImagen] = transformarH(imagenHSI)
nuevaImagen = imagenHSI;
H = nuevaImagen(:, :, 1);
%muevo a H entre 0 y 360°
H = H .* 360;
%transformo H
H = H + (10);
%veo los valores que se pasaron de 360°
n = find (H >= 360);
H(n) = 360 - H(n);
%vuelvo a llevar a H entre 0 y 1
H = H ./ 360;
%genero la imagen con el nuevo H
nuevaImagen(:, :, 1) = H;
end

function [nuevaImagen] = transformarS(imagenHSI)
nuevaImagen = imagenHSI;
S = nuevaImagen(:, :, 2);
S = S .* 2;
nuevaImagen(:, :, 2) = S;
end

function [nuevaImagen] = transformarI(imagenHSI)
nuevaImagen = imagenHSI;
I = nuevaImagen(:, :, 3);
I = log(I + 1);
nuevaImagen(:, :, 3) = I;
end