function [y] = especificacionHistograma(imagen)
  histogramEqualized = zeros(1, 256);
  [filas, columnas] = size(imagen);
  L = 256;
  for i = 1 : 1 : L
    [grises, x] = size (find (imagen == i - 1) );
    % en la posicion iesima de histogramEqualized
    % tengo el nivel de gris i - 1
    histogramEqualized(i) = grises / (filas*columnas);
  end
  histogramEqualized(1) = histogramEqualized(1) * (L-1);
  for i = 2 : 1 : 256
    histogramEqualized(i) = histogramEqualized(i-1) + histogramEqualized(i)*(L-1);
  end
  histogramEqualized = uint8(histogramEqualized);
  
  histogramaNormalizadoZ = zeros(1, 256);
  histogramaNormalizadoZ(1) = p(0, 128, 64)*(L-1);
  for i = 2 : 1 : 256
    histogramaNormalizadoZ(i) = p(i - 1, L)*(L-1) + histogramaNormalizadoZ(i-1);
  end
  histogramaNormalizadoZ = uint8(histogramaNormalizadoZ);
  mapeo = zeros(1, 256);
  for i = 1 : 1 : 256
    valorActual = histogramEqualized(i);
    masCercano = intmax(class(imagen));
    indexMasCercano = -1;
    for j = 1 : 1 : 256
      dif = abs(valorActual - histogramaNormalizadoZ(j));
      if (dif < masCercano)
        masCercano = dif;
        indexMasCercano = j;
      end
    end
    mapeo(valorActual + 1) = indexMasCercano;
  end
  y = ecualizacion(imagen);
  for i = 1 : 1 : filas
    for j = 1 : 1 : columnas
      valorActualDeGris = y(i, j);
      valorFinal = mapeo(valorActualDeGris + 1);
      y(i, j) = valorFinal;
    end
  end
end

function [y] = p(x, L)
  l = L / 2;
  o = L / 4;
  y = 1 / (o*sqrt(pi)) * exp( -0.5 * ((x-l)/o) * ((x-l)/o) );
end

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
