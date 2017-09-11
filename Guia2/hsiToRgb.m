function [nuevaImagen] = hsiToRgb(imagen, mostrarImagen)
[filas, columnas, canales] = size(imagen);
if canales ~= 3
    throw('El canal debe tener 3 canales')
end
if isa(imagen, 'double') ~= 1
    throw('La imagen debe ser de doubles')
end
nuevaImagen = getImage(imagen);
if mostrarImagen == true
    figure;
    subplot(2, 2, 1), imshow(nuevaImagen), title('imagen en rgb');
    subplot(2, 2, 2), imshow(nuevaImagen(:, :, 1)), title('r');
    subplot(2, 2, 3), imshow(nuevaImagen(:, :, 2)), title('g');
    subplot(2, 2, 4), imshow(nuevaImagen(:, :, 3)), title('b');
end
end

function [imagenEnRGB] = getImage(imagen)
H = double(imagen(:, :, 1)) .* 360;
S = double(imagen(:, :, 2));
I = double(imagen(:, :, 3));
R = zeros(size(H));  
G = zeros(size(H));  
B = zeros(size(H));

primerSector = find(H < 120);
segundoSector = find(H >= 120 & H < 240);
tercerSector = find(H >= 240 & H < 360);

%primer sector --> 0 <= H < 120
B( primerSector) = I(primerSector) .* (1 - S(primerSector));
R(primerSector) = I(primerSector) .* ( 1 + ( ( S(primerSector) .* cosd(H(primerSector)) ) ./ (cosd(60 - H(primerSector) ) ) ) );
G(primerSector) = (3 .* I(primerSector)) - (R(primerSector) + B(primerSector));

%segundo sector -> 120 <= H < 240
H = H - 120;
R(segundoSector) = I(segundoSector) .* (1 - S(segundoSector));
G(segundoSector) = I(segundoSector) .* ( 1 + ( (S(segundoSector) .* cosd(H(segundoSector))) ./ (cosd(60 - H(segundoSector))) ) );
B(segundoSector) = (3.*I(segundoSector)) - (R(segundoSector) + G(segundoSector));

%tercer sector -> 240 < H <= 360
H = H - 120;
G(tercerSector) = I(tercerSector) .* (1 - S(tercerSector));
B(tercerSector) = I(tercerSector) .* ( 1 + ( (S(tercerSector).*cosd(H(tercerSector))) ./ (cosd(60 - H(tercerSector))) ) );
R(tercerSector) = (3.*I(tercerSector)) - (G(tercerSector) + B(tercerSector));

%generar imagen
imagenEnRGB(:, :, 1) = R;
imagenEnRGB(:, :, 2) = G;
imagenEnRGB(:, :, 3) = B;
end

%{
%realización usando doubles en vez de grados para el calculo -- se parte
%con valores de pi en vez de 360
function [r] = getR(H, S, I)
r = zeros(size(H));
primerSeccion = find( H < (2/3)*pi);
segundaSeccion = find ( H >= (2 / 3)*pi & H < (4 / 3)*pi );
terceraSeccion = find ( H >= (4/3)*pi & H < 2*pi );

r(primerSeccion) = I(primerSeccion) .* ( 1 + ( ( S(primerSeccion) .* cos(H(primerSeccion)) ) ./ cos ( (pi/3) - H(primerSeccion) ) ) );

r(segundaSeccion) = I(segundaSeccion) .* ( 1 - S(segundaSeccion) );

G = I .* (1 - S);
B = I .* ( 1 + ( ( S .* cos( H - ( (4 / 3)*pi ) ) ) ./ cos( ( pi / 3 ) - ( H - ( (4 / 3)*pi) )  ) ) );
r(terceraSeccion) = (3.*I(terceraSeccion)) - (G(terceraSeccion) + B(terceraSeccion));
end

function [g] = getG(H, S, I)
g = zeros(size(H));
primerSeccion = find( H < (2/3)*pi);
segundaSeccion = find ( H >= (2 / 3)*pi & H < (4 / 3)*pi );
terceraSeccion = find ( H >= (4/3)*pi );

R = I .* ( 1 + ( ( S .* cos(H) ) ./ cos ( (pi/3) - H ) ) );
B = I .* (1 - S);
g(primerSeccion) = (3.*I(primerSeccion)) - (R(primerSeccion) + B(primerSeccion));

g(segundaSeccion) = I(segundaSeccion) .* ( 1 + ( ( S(segundaSeccion) .* cos( H(segundaSeccion) - ((2/3)*pi) ) ) ./ cos( (pi/3) - (H(segundaSeccion) - ( (2/3)*pi) ) ) ) );

g(terceraSeccion) = I(terceraSeccion) .* (1 - S(terceraSeccion));
end

function [b] = getB(H, S, I)
b = zeros(size(H));
primerSeccion = find( H < (2/3)*pi);
segundaSeccion = find ( H >= (2 / 3)*pi & H < (4 / 3)*pi );
terceraSeccion = find ( H >= (4/3)*pi );

b(primerSeccion) = I(primerSeccion) .* (1 - S(primerSeccion));

g = I .* ( 1 + ( ( S .* cos( H - ((2/3)*pi) ) ) ./ cos( (pi/3) - (H - ( (2/3)*pi) ) ) ) );
r = I .* (1 - S);
b(segundaSeccion) = (3.*I(segundaSeccion)) - (r(segundaSeccion) + g(segundaSeccion));

b(terceraSeccion) = I(terceraSeccion) .* ( 1 + ( ( S(terceraSeccion) .* cos( H(terceraSeccion) - ( (4 / 3)*pi ) ) ) ./ cos( ( pi / 3 ) - ( H(terceraSeccion) - ( (4 / 3)*pi) )  ) ) );
end
%}