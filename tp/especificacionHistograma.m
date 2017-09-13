function [y] = especificacionHistograma(canalV, histogramaBuscado)
imagen = uint8(canalV .* 255);
L = 256;
[filas, columnas] = size(imagen);
%histograma de imagen
w = transpose(imhist(imagen) ./ (filas*columnas));
w = cumsum(w);

w_monio = cumsum(histogramaBuscado);

%genero w punto
w_punto = zeros(1, L);
for i = 1 : 1 : L
    n = find(w_monio - w(i) >= 0);
    if size(n) > 0
        w_punto(i) = w_monio(n(1));
    end
end

%genero la imagen
minimo = min(w_punto);
y = imagen;
for i = 1 : 1 : filas
    for j = 1 : 1 : columnas
        valorFinal = w_punto(y(i, j) + 1);
        y(i, j) = valorEnRango(minimo, valorFinal);
    end
end

%figure, imshow(y), title('imagen normalizada');

y = double( y ./ 255 );
end

function [y] = p(x, L)
l = floor(L / 2);
o = floor(L / 4);
valor = -0.5 * double(double(x-l)/o) * double(double(x-l)/o);
y = double(1 / (double(o)*sqrt(2*pi))) * double(exp(valor));
end

function [x] = valorEnRango(smin, sactual)
x = floor( ((sactual - smin)/(1 - smin)*255) + 0.5);
end