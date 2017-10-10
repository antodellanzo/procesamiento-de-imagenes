function [lineas] = lineas512x512()
lineas = zeros(512, 'double');
for fila = 1 : 512
    for columna = 1 : 30 : 512
        lineas(fila, columna) = 1.0;
    end
end
end