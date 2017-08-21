function [y] = histogramaDeImagen(imagen)
  y = zeros(256);
  for escalaGris = 0 : 1 : 255
    cantidadConGrisX = size( find (imagen == escalaGris) );
    y (escalaGris + 1) = cantidadConGrisX(1);
  end
end