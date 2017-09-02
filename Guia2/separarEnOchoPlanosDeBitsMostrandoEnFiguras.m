function [] = separarEnOchoPlanosDeBitsMostrandoEnFiguras(imagen)
  [filas, columnas] = size(imagen);
  %mostrar imagen original
  figure('name', 'imagen original', 'numbertitle', 'off');
  imshow(imagen);
  title('imagen original');
  for bit = 0 : 1 : 7
    bitActual = power(2, bit);
    matrizDeBitActual = uint8(ones(filas, columnas) .* bitActual);
    %matriz con el plano de bit 'bit' de la imagen
    imagenDeBitActual = logical( bitand(imagen, matrizDeBitActual) );
    %mostrar imagen en una figure nueva
    str = sprintf('Bit %d', bit);
    figure('name', str, 'numbertitle', 'off');
    imshow(imagenDeBitActual);
    title(str);
  end
end