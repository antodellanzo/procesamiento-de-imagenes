function [y] = histogramaModificadoSuavizado(imagen, lambda, gamma)
  h0 = histogramaDeImagen(imagen);
  [filas, columnas] = size(imagen);
  vectorDiagonalUno = ones(1, 255);
  vectorDiagonal = -ones(1, 256);
  D = diag(vectorDiagonalUno, 1) + diag(vectorDiagonal);  
  valorUniforme = (filas * columnas) / 256; 
  hu = ones(1, 256);
  for i = 1 : 1 : 256
    hu(i) = valorUniforme;
  end
  identidad = eye(256, 256);
  aux = h0 + lambda.*hu;
  primerOperando = (1 + lambda).*identidad;
  segundoOperando = gamma.*(transpose(D)*D);
  h = inv(primerOperando + segundoOperando) * transpose(aux);
  
  %normalizo el histograma
  for i = 1 : 1 : 256
    h(i) = h(i) / (filas*columnas);
  end
  
  %grafico el histograma acumulado
  histoAcumulado = histogramaAcumulado(h);
  plot(histoAcumulado);
  str = sprintf('Histograma normalizado acumulado con \\lambda = %d, \\gamma = %d', lambda, gamma);
  title(str);
  
  %grafico el histograma
  figure;
  bar(h);
  str = sprintf('Histograma normalizado modificado suavizado con \\lambda = %d, \\gamma = %d', lambda, gamma);
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
  str = sprintf('Imagen con \\lambda = %d, \\gamma = %d', lambda, gamma);
  title(str);
end

function [x] = valorEnRango(smin, sactual)
  x = floor( ((sactual - smin)/(1 - smin)*255) + 0.5);
end

function [y] = histogramaDeImagen(imagen)
  y = zeros(1, 256);
  for escalaGris = 0 : 1 : 255
    [cantidadConGrisX, x] = size( find (imagen == escalaGris) );
    y (escalaGris + 1) = cantidadConGrisX;
  end
end

function [histograma] = histogramaAcumulado(histogramaInput)
  histograma = histogramaInput;
  for index = 2 : 1 : 256
    histograma(index) = histograma(index) + histograma(index - 1);
  end
    figure;
    plot(histograma);
end