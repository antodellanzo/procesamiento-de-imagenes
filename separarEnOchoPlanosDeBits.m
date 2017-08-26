function [] = separarEnOchoPlanosDeBits(imagen)
  [filas, columnas] = size(imagen);
  %mostrar imagen original
  figure("numbertitle", 'off', "name", 'Bit map de imagen');
  subplot(3, 3, 1);
  imshow(imagen);
  title('Original');
  for bit = 0 : 1 : 7
    bitActual = power(2, bit);
    matrizDeBitActual = ones(filas, columnas) .* bitActual;
    %matriz con el plano de bit 'bit' de la imagen
    imagenDeBitActual = logical( bitand(imagen, matrizDeBitActual) );
    %mostrar imagen en misma figure usando subplot
    subplot(3, 3, bit + 2);
    imshow(imagenDeBitActual);
    str = sprintf('Bit %d', bit);
    title(str); 
end