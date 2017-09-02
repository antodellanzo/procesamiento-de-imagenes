function [histograma] = histogramaAcumulado(imagen)
  histograma = zeros(1, 256);
  [filas, columnas] = size(imagen);
  for i = 1 : 1 : 256
    [grises, x] = size (find (imagen == i - 1) );
    % en la posicion iesima de histogramaNormalizado
    % tengo el nivel de gris i - 1
    histograma(i) = grises;
  end
  for index = 2 : 1 : 256
    histograma(index) = histograma(index) + histograma(index - 1);
  end
    figure;
    plot(histograma);
end