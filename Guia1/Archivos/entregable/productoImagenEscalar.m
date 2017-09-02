function [y] = productoImagenEscalar(imagen, escalar)
  imagenDoubleNormalizada = (double(imagen))/255;
  y = imagenDoubleNormalizada .* escalar;
  y = uint8(y .* 255);
end