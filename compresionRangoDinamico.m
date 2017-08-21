function [y] = compresionRangoDinamico(imagen)
  r = max (max (imagen) );
  c = 255 / log (1 + r);
  y = c .* log (1 + imagen);
end