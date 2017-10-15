function [cuadrado] = rectangulo()
cuadrado = zeros(50, 50);
for fila = 18 : 1 : 33
    for columna = 23 : 1 : 28
        cuadrado(fila, columna) = 0.5;
    end
end
end