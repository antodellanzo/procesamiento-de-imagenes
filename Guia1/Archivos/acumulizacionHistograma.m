function [histograma] = acumulizacionHistograma(histogramaInput)
  histograma = histogramaInput;
  for index = 2 : 1 : 256
    histograma(index) = histograma(index) + histograma(index - 1);
  end
    figure;
    plot(histograma);
end
