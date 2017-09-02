function [y] = histogramaNormalizado(imagen)
  [filas, columnas] = size(imagen);
  y = zeros(1, 256);
  tamanoImagen = filas * columnas;
  for escalaGris = 0 : 1 : 255
    [cantidadConGrisX, x] = size( find (imagen == escalaGris) );
    y (escalaGris + 1) = cantidadConGrisX / tamanoImagen;
  end
  figure("numbertitle", 'off', "name", 'Histograma normalizado de imagen');
  bar(y);
  title('Histograma normalizado de imagen');
end