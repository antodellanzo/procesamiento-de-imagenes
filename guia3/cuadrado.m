function [cuadrado] = cuadrado()
cuadrado = zeros(50, 50);
for fila = 20 : 1 : 30
    for columna = 20 : 1 : 30
        cuadrado(fila, columna) = 0.5;
    end
end
end