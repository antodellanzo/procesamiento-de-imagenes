function [cuadrado] = cuadradoTransladado()
cuadrado = zeros(50, 50);
for fila = 10 : 1 : 20
    for columna = 30 : 1 : 40
        cuadrado(fila, columna) = 0.5;
    end
end
end