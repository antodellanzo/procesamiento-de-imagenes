function [y] = histogramaDeImagen(imagen)
  y = zeros(1, 256);
  for escalaGris = 0 : 1 : 255
    [cantidadConGrisX, x] = size( find (imagen == escalaGris) );
    y (escalaGris + 1) = cantidadConGrisX;
  end
end