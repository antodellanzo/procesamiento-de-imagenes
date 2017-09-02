function [y] = aumentarContrasteHistograma(imagen)
  h = histograma(imagen);
  min = min(min(imagen));
  max = max(max(imagen));
  y = imagen;
  [filas, columnas] = size(imagen);
  figure;
  bar(h);
  title("histograma imagen");
  for fila = 1 : 1 : filas
    for columna = 1 : 1 : columnas
      y(fila, columna) = ( double(imagen(fila, columna) - min) / double(max - min) )*255;
    end
  end 
  h2 = histograma(y);
  figure;
  bar(h2);
  title("histograma imagen modificada");
  figure;
  subplot(1, 2, 1);
  imshow(imagen);
  title("imagen original");
  subplot(1, 2, 2);
  imshow(y);
  title("imagen con aumento de contraste");
end


function [h] = histograma(imagen)
  h = zeros(1, 256);
  for escalaGris = 0 : 1 : 255
    [cantidadConGrisX, x] = size( find (imagen == escalaGris) );
    h (escalaGris + 1) = cantidadConGrisX;
  end
end