function [y] = sumaDeImagenes( imagen1, imagen2 )
  imagen1DoubleNormalizada = (double(imagen1))/255;
  imagen2DoubleNormalizada = (double(imagen2))/255;
  y = imagen1DoubleNormalizada + imagen2DoubleNormalizada;
  y = y .* 255;
  y = uint8( y );
end