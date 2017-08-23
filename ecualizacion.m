function [y] = ecualizacion(imagen)
%[filas, columnas] = size(imagen);
%y = zeros(256);
%    for l = 0 : 1 : 255
%        for greyScale = 0 : 1 : l
%            [cantGris, x] = size ( find ( imagen == greyScale ) );
%            y(l + 1) = y(l + 1) + ( cantGris  / ( filas * columnas ) );
%        end
%    end
%minimo = min(y);
%for i = 1 : 1 : 256
%    y(i) = floor( ( ( y(i) - minimo )/ ( 1 - minimo ) * 255 ) + 0.5); 
[filas, columnas] = size(imagen);
y = imagen;
for fila = 1 : 1 : filas
    for columna = 1 : 1 : columnas
        grisActual = imagen(fila, columna);
        grisFinal = 0;
        for escalaGrises = 0 : 1 : grisActual
            [cantGris, x] = size ( find ( imagen == escalaGrises ) );
            grisFinal = grisFinal + (cantGris / (filas*columnas));
        end
        y(fila, columna) = grisFinal;
    end
end
minimo = min (min (y) );
for fila = 1 : 1 : filas
    for columna = 1 : 1 : columnas
        y(fila, columna) = floor( ( (y(fila, columna) - minimo) / (1 - minimo) * 255) + 0.5 );
    end
end
end  