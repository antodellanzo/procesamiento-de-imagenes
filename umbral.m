function [y] = umbral(imagen, umbral)
  [filas, columnas] = size(imagen);
  y = zeros(filas, columnas);
  posicionesDeElementosMayoresAlUmbral = find ( imagen > umbral);
  y(posicionesDeElementosMayoresAlUmbral) = 255;
end