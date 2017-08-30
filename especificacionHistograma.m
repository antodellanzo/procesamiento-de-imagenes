function [y] = especificacionHistograma(imagen)
  L = 256;
  [filas, columnas] = size(imagen);
  w = transpose(imhist(imagen) ./ (filas*columnas));
  w = cumsum(w);
  
  w_monio = zeros(1, L);
  for i = 1 : 1 : L
      w_monio(i) = p(i, L);
  end
  w_monio = cumsum(w_monio);
  
  figure;
  subplot(1, 2, 1);
  plot(w);
  title('histrograma acumulado');
  subplot(1, 2, 2);
  plot(w_monio);
  title('histograma acumulado normalizado');
  
  w_punto = zeros(1, L);
  for i = 1 : 1 : L
    n = find(w_monio - w(i) >= 0);
    if size(n) > 0
        w_punto(i) = w_monio(n(1));
    end
  end
  
  minimo = min(w_punto);
  y = imagen;
  for i = 1 : 1 : filas
    for j = 1 : 1 : columnas
      valorActualDeGris = y(i, j);
      valorFinal = w_punto(valorActualDeGris + 1);
      y(i, j) = valorEnRango(minimo, valorFinal);
    end
  end
  
  figure;
  subplot(1, 2, 1), imshow(imagen), title('imagen original');
  subplot(1, 2, 2), imshow(y), title('imagen normalizada');
end

function [y] = p(x, L)
  l = floor(L / 2);
  o = floor(L / 4);
  valor = -0.5 * double(double(x-l)/o) * double(double(x-l)/o);
  y = double(1 / (double(o)*sqrt(2*pi))) * double(exp(valor));
end

function [x] = valorEnRango(smin, sactual)
  x = floor( ((sactual - smin)/(1 - smin)*255) + 0.5);
end