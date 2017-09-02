function [y] = compresionRangoDinamico(imagen)
  R = max (max (imagen) );
  L = 255;
  c = (L - 1) / log (1 + R);
  y = c .* log (1 + imagen);
end