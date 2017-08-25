function [y] = ecualizacion(imagen)
  %inicializo un vector que va a contener el histograma
  histogramaNormalizado = zeros(1, 256);
  [filas, columnas] = size(imagen);
  for i = 1 : 1 : 256
    [grises, x] = size (find (imagen == i - 1) );
    % en la posicion iesima de histogramaNormalizado
    % tengo el nivel de gris i - 1
    histogramaNormalizado(i) = grises / (filas*columnas);
  end
  %histogramaNormalizado pasa a tener los valores acumulados
  for index = 2 : 1 : 256
    histogramaNormalizado(index) = histogramaNormalizado(index) + histogramaNormalizado(index - 1);
  end
  minimo = min (histogramaNormalizado);
  y = imagen;
  for fila = 1 : 1 : filas
    for columna = 1 : 1 : columnas
      %selecciono el valor de gris del pixel actual
      grisEnPosicion = imagen(fila, columna);
      %selecciono el valor de T(rk) que va a tener el pixel en la nueva imagen
      sactual = histogramaNormalizado(grisEnPosicion + 1);
      %llevo el valor de gris al rango [0..255]
      y(fila, columna) = valorEnRango(minimo, sactual);
    end
  end
end

function [x] = valorEnRango(smin, sactual)
  x = floor( ((sactual - smin)/(1 - smin)*255) + 0.5);
end