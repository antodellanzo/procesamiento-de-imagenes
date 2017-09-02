function [] = histogramaModificadoSuavizadoVariandoParametros(imagen)
  for lambda = [1, 5, 10, 15, 20]
    for gamma = [1, 50, 100, 150, 200]
      if gamma == 0
        histogramaModificadoSuavizado(imagen, lambda, 1);
      else
        histogramaModificadoSuavizado(imagen, lambda, gamma);
      end
    end
  end
end

function [] = histogramaModificadoSuavizado(imagenOriginal, lambda, gamma)
    if size(imagenOriginal) > 2
        imagen = imagenOriginal(:, :, 1);
    else
        imagen = imagenOriginal;
    end

  h0 = transpose(imhist(imagen));
  [filas, columnas] = size(imagen);
  
  vectorDiagonalUno = ones(1, 255);
  vectorDiagonal = -ones(1, 256);
  D = diag(vectorDiagonalUno, 1) + diag(vectorDiagonal);  
  valorUniforme = (filas * columnas) / 256; 
  histogramaUniforme = ones(1, 256) .* valorUniforme;
  
  identidad = eye(256, 256);
  aux = h0 + lambda.*histogramaUniforme;
  primerOperando = (1 + lambda).*identidad;
  segundoOperando = gamma.*(transpose(D)*D);
  h_monio = aux/(primerOperando + segundoOperando);
  
  %normalizo el histograma
  h_monio = h_monio ./ (filas*columnas);
  
  %grafico los histogramas
  str = sprintf('\\lambda = %d, \\gamma = %d', lambda, gamma);
  figure('numbertitle', 'off', 'name', str);
  subplot(1, 2, 1);
  histoAcumulado = cumsum(h_monio);
  plot(histoAcumulado);
  str = sprintf('Histograma acumulado');
  title(str);
  
  subplot(1, 2, 2);
  bar(h_monio);
  str = sprintf('Histograma modificado suavizado');
  title(str);
    
  %genero la imagen
  y = imagen;
  minimo = min (h_monio);
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