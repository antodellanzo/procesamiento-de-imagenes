function [y] = negativoDeImagen(imagen)
  L = 256;
  y = (L - 1) - imagen;
end