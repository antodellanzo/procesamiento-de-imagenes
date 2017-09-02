function [y] = aumentarContrasteImagen(imagen)
  h = histograma(imagen);
  [filas, columnas] = size(imagen);
  meanIntensity = 0
  for index = 1 : 1 : 255
    meanIntensity = meanIntensity +  h(index)*index;
  end
  meanIntensity = meanIntensity / (filas*columnas);
  r1 = meanIntensity;
  r2 = meanIntensity;
  s1 = 0;
  s2 = 255;
  y = imagen;
  for fila = 1 : 1 : filas
    for columna = 1 : 1 : columnas
      valorActual = imagen(fila, columna);
      y(fila, columna) = valorEnOutput(valorActual, r1, r2, s1, s2);
    end
  end
end

function [y] = valorEnOutput(pixel, r1, r2, s1, s2)
  if pixel < r1
    y = s1 / r1 * pixel;
  end
  if pixel >= r1 && pixel <= r2
      y = ( (s2 - s1) / (r2 - r1) * pixel ) + s1;
    end
  if pixel > r2
    y = ( (255 - s2) / (255 - r2) * pixel ) + s2;
  end
end

function [h] = histograma(imagen)
  h = zeros(1, 256);
  for escalaGris = 0 : 1 : 255
    [cantidadConGrisX, x] = size( find (imagen == escalaGris) );
    h (escalaGris + 1) = cantidadConGrisX;
  end
end