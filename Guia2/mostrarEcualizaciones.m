function [] = mostrarEcualizaciones(imagen)
    [filas, columnas, canales] = size(imagen);
    figure, subplot(2, 2, 1), imshow(imagen), title('imagen original');
    for i = 1 : 1 : canales
        subplot(2, 2, i + 1), imshow(ecualizacion(imagen(:, :, i)));
    end
end

function [y] = ecualizacion(imagenOriginal)
    if size(imagenOriginal) > 2
        imagen = imagenOriginal(:, :, 1);
    else
        imagen = imagenOriginal;
    end
  histogramaNormalizado = zeros(1, 256);
  [filas, columnas] = size(imagen);
  for i = 1 : 1 : 256
    [grises, x] = size (find (imagen == i - 1) );
    histogramaNormalizado(i) = grises / (filas*columnas);
  end
  histogramaNormalizado = cumsum(histogramaNormalizado);
  minimo = min (histogramaNormalizado);
  y = imagen;
  for fila = 1 : 1 : filas
    for columna = 1 : 1 : columnas
      grisEnPosicion = imagen(fila, columna);
      sactual = histogramaNormalizado(grisEnPosicion + 1);
      y(fila, columna) = valorEnRango(minimo, sactual);
    end
  end
end

function [x] = valorEnRango(smin, sactual)
  x = floor( ((sactual - smin)/(1 - smin)*255) + 0.5);
end