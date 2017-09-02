function [y] = histograma(imagen)
  y = zeros(1, 256);
  for escalaGris = 0 : 1 : 255
    [cantidadConGrisX, x] = size( find (imagen == escalaGris) );
    y (escalaGris + 1) = cantidadConGrisX;
  end
  figure('numbertitle', 'off', 'name', 'Histograma de imagen');
  bar(y);
  title('Histograma de imagen');
end