function [cuadrado] = lineaVertical()
cuadrado = zeros(50, 50);
for fila = 1 : 50
    cuadrado(fila, 25) = 0.5;
end
end