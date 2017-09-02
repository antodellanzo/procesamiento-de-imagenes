function [y] = aumentarContrasteHistograma(imagen)
  minimo = min(min(imagen));
  maximo = max(max(imagen));
  y = imagen;
  [filas, columnas] = size(imagen);
  for fila = 1 : 1 : filas
    for columna = 1 : 1 : columnas
      y(fila, columna) = ( double(imagen(fila, columna) - minimo) / double(maximo - minimo) )*255;
    end
  end
  
  %grafico los resultados
  figure;
  subplot(1, 2, 1), bar(imhist(imagen)), title('histograma imagen');
  subplot(1, 2, 2), bar(imhist(y)), title('histograma imagen modificada');
  figure, subplot(1, 2, 1), imshow(imagen), title('imagen original');
  subplot(1, 2, 2), imshow(y), title('imagen con aumento de contraste');
end