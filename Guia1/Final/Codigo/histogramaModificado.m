function [h_monio] = histogramaModificado(imagenOriginal, lambda)
    if size(imagenOriginal) > 2
        imagen = imagenOriginal(:, :, 1);
    else
        imagen = imagenOriginal;
    end
    [filas, columnas] = size(imagen);
    h0 = transpose(imhist(imagen));

    valorUniforme = (filas * columnas) / 256; 
    histogramaUniforme = ones(1, 256) .* valorUniforme;
    
    h_monio = (1/(1 + lambda))*h0 + ((lambda/(1+lambda))*histogramaUniforme);

    %normalizo el histograma
    h_monio = h_monio ./ (filas*columnas);

    %histograma acumulado de h_monio
    histoAcumulado = cumsum(h_monio);

    %grafico el histograma h_monio
    figure;
    bar(h_monio);
    str = sprintf('Histograma modificado con \\lambda = %d', lambda);
    title(str);

    %grafico el histograma acumulado de h_monio
    figure;
    plot(histoAcumulado);
    str = sprintf('Histograma acumulado modificado con \\lambda = %d', lambda);
    title(str);

    %genero la imagen
    y = imagen;
    minimo = min (h_monio);
    for fila = 1 : 1 : filas
     for columna = 1 : 1 : columnas
      grisActual = imagen(fila, columna);
      y(fila, columna) = valorEnRango(minimo, histoAcumulado(grisActual));
     end
    end    

    %muestro la imagen
    figure;
    imshow(y);
    str = sprintf('Imagen con \\lambda = %d', lambda);
    title(str);
end

function [x] = valorEnRango(smin, sactual)
  x = floor( ((sactual - smin)/(1 - smin)*255) + 0.5);
end