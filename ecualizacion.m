function [y] = ecualizacion(imagenOriginal)
    if size(imagenOriginal) > 2
        imagen = imagenOriginal(:, :, 1);
    else
        imagen = imagenOriginal;
    end

  %inicializo un vector que va a contener el histograma
  histogramaNormalizado = zeros(1, 256);
  [filas, columnas] = size(imagen);
  for i = 1 : 1 : 256
    [grises, x] = size (find (imagen == i - 1) );
    % en la posicion iesima de histogramaNormalizado
    % tengo el nivel de gris i - 1
    histogramaNormalizado(i) = grises / (filas*columnas);
  end
  
  figure, plot(histogramaNormalizado), title('histograma normalizado');
  
  %histogramaNormalizado pasa a tener los valores acumulados
  histogramaNormalizado = cumsum(histogramaNormalizado);
  
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
  
  figure, imshow(y), title('imagen ecualizada');
  figure, bar(histogramaNormalizado), title('histograma normalizado');
end

function [x] = valorEnRango(smin, sactual)
  x = floor( ((sactual - smin)/(1 - smin)*255) + 0.5);
end