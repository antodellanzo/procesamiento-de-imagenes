function [] = separarEnOchoPlanosDeBitsMostrandoEnFiguras(imagen)
  [filas, columnas] = size(imagen);
  %mostrar imagen original
  figure("name", 'imagen original', "numbertitle", 'off');
  imshow(imagen);
  for bit = 0 : 1 : 7
    bitActual = power(2, bit);
    matrizDeBitActual = ones(filas, columnas) .* bitActual;
    %matriz con el plano de bit 'bit' de la imagen
    imagenDeBitActual = logical( bitand(imagen, matrizDeBitActual) );
    %mostrar imagen en una figure nueva
    str = sprintf('Bit %d', bit);
    figure("name", str, "numbertitle", 'off');
    imshow(imagenDeBitActual);
end
