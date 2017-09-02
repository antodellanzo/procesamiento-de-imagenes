function [y] = productoDeImagenes(imagen1, imagen2)
  [filasImagen1, columnasImagen1] = size(imagen1);
  [filasImagen2, columnasImagen2] = size(imagen2);
  if (filasImagen1 ~= filasImagen2) || (columnasImagen1 ~= columnasImagen2)
    error ('Las imagenes deben ser del mismo tamaño')
  end
  
  imagen1DoubleNormalizada = (double(imagen1))/255;
  imagen2DoubleNormalizada = (double(imagen2))/255;
  y = imagen1DoubleNormalizada .* imagen2DoubleNormalizada;
  y = uint8(y .* 255);
  imshow(y);
end