function [h] = histogramaModificado(imagen, lambda)
  h0 = histogramaDeImagen(imagen);
  [filas, columnas] = size(imagen);
  valorUniforme = (filas * columnas) / 256; 
  v = ones(1, 256);
  for i = 1 : 1 : 256
    v(i) = valorUniforme;
  end
  h = (1/(1 + lambda))*h0 + ((lambda/(1+lambda))*v);
  
  %normalizo el histograma
  for i = 1 : 1 : 256
    h(i) = h(i) / (filas*columnas);
  end
  
  %histograma acumulado de h
  histoAcumulado = histogramaAcumulado(h);
  
  %grafico el histograma h
  figure;
  bar(h);
  str = sprintf('Histograma modificado con \\lambda = %d', lambda);
  title(str);
  
  %grafico el histograma acumulado de h
  figure;
  plot(histoAcumulado);
  str = sprintf('Histograma acumulado modificado con \\lambda = %d', lambda);
  title(str);
  
  %genero la imagen
  y = imagen;
  minimo = min (h);
  for fila = 1 : 1 : filas
    for columna = 1 : 1 : columnas
      grisActual = imagen(fila, columna);
      y(fila, columna) = valorEnRango(minimo, histoAcumulado(grisActual));
    end
  end    
  
  %muestro la imagen
  figure;
  imshow(y);
  str = sprintf('Imagen con \\lambda = %d', lambda);
  title(str);
end

function [x] = valorEnRango(smin, sactual)
  x = floor( ((sactual - smin)/(1 - smin)*255) + 0.5);
end

function [histograma] = histogramaAcumulado(histogramaInput)
  histograma = histogramaInput;
  for index = 2 : 1 : 256
    histograma(index) = histograma(index) + histograma(index - 1);
  end
end

function [y] = histogramaDeImagen(imagen)
  y = zeros(1, 256);
  for escalaGris = 0 : 1 : 255
    [cantidadConGrisX, x] = size( find (imagen == escalaGris) );
    y (escalaGris + 1) = cantidadConGrisX;
  end
end