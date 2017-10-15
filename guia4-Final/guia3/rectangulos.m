function [cuadrado] = rectangulos()
cuadrado = zeros(50, 50);
for fila = 15 : 1 : 30
    for columna = 15 : 1 : 20
        cuadrado(fila, columna) = 0.5;
    end
end
for fila = 20 : 1 : 45
    for columna = 30 : 1 : 40
        cuadrado(fila, columna) = 0.5;
    end
end
end