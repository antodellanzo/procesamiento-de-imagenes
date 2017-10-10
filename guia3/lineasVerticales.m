function [cuadrado] = lineasVerticales()
cuadrado = zeros(50, 50);
for fila = 1 : 50
    for columna = 5 : 5 : 50
        cuadrado(fila, columna) = 0.5;
    end
end
end