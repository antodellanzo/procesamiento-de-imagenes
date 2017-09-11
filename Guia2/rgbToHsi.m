function [nuevaImagen] = rgbToHsi(imagen, mostrarImagenes)
[filas, columnas, canales] = size(imagen);
if canales ~= 3
    throw('El canal debe tener 3 canales')
end
if isa(imagen, 'uint8') ~= 1
    throw('La imagen debe ser de enteros de 8 bits')
end
nuevaImagen = zeros(size(imagen));
R = double(imagen(:, :, 1)) / 255.0;
G = double(imagen(:, :, 2)) / 255.0;
B = double(imagen(:, :, 3)) / 255.0;
nuevaImagen(:, :, 1) = getH(R, G, B);
nuevaImagen(:, :, 2) = getS(R, G, B);
nuevaImagen(:, :, 3) = getI(R, G, B);

%grafico la nueva imagen con sus canales
if mostrarImagenes == true
    figure('NumberTitle', 'off', 'Name', 'nueva forma de hacerlo');
    subplot(2, 2, 1), imshow(nuevaImagen), title('imagen en hsi');
    subplot(2, 2, 2), imshow(nuevaImagen(:, :, 1)), title('h');
    subplot(2, 2, 3), imshow(nuevaImagen(:, :, 2)), title('s');
    subplot(2, 2, 4), imshow(nuevaImagen(:, :, 3)), title('i');
end
end

function [H] = getH(R, G, B)
operandoArriba = (0.5) .* ( (R - G) + (R - B) );
operandoAbajo = ( (( R - G ).*( R - G )) + (( R - B ).*( G - B )) ) .^ (0.5);
H = acos( (operandoArriba ./ (operandoAbajo+realmin('double')) ) );
mayores = find(B > G);
H(mayores) = 2*pi - H(mayores);
H = H ./ (2*pi);
H(H < 0) = 0;
end

function [S] = getS(R, G, B)
S = 1 - ( ( 3 ./ ((R + G + B)+realmin('double')) ) .* min(min(R, G), B) );
S(S < 0) = 0;
end

function [I] = getI(R, G, B)
I = (R + G + B) ./ 3;
I(I < 0) = 0;
end