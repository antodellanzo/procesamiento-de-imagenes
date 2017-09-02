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

function [] = histogramaModificadoSuavizado(imagen, lambda, gamma)
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
  
  %grafico los histogramas
  str = sprintf('\\lambda = %d, \\gamma = %d', lambda, gamma);
  figure("numbertitle", 'off', "name", str);
  subplot(1, 2, 1);
  histoAcumulado = histogramaAcumulado(h);
  plot(histoAcumulado);
  str = sprintf('Histograma acumulado');
  title(str);
  
  subplot(1, 2, 2);
  bar(h);
  str = sprintf('Histograma modificado suavizado');
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
end