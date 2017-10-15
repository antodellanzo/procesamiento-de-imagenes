function [imagenConRuido] = ruidoGaussiano(imagen, media, varianza)
[filas, columnas] = size(imagen);
imagenConRuido = media + ( ( sqrt(varianza) - media ) .* randn(filas,columnas, 'double') );
imagenConRuido = imagenConRuido + (double(imagen)./255.0);
imagenConRuido = im2uint8(imagenConRuido);
imshow(imagenConRuido, []);
end