function [y] = umbral(imagen, umbral)
  L = 256;
  if umbral > L - 1
    error("El umbral debe estar dentro del rango de grises de 8 bits");
  end
  
  [filas, columnas] = size(imagen);
  y = logical(zeros(filas, columnas));
  posicionesDeElementosMayoresAlUmbral = find ( imagen >= umbral);
  y(posicionesDeElementosMayoresAlUmbral) = 1;
end