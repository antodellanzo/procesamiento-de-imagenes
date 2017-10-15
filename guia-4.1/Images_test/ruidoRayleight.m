function [imagenConRuido] = ruidoRayleight(imagen, media, varianza)
[filas, columnas] = size(imagen);
imagenConRuido = media + sqrt( -sqrt(varianza).*log( 1-rand(filas, columnas) ) );
imagenConRuido = imagenConRuido .* (double(imagen)./255.0);
imagenConRuido = im2uint8(imagenConRuido);
imshow(imagenConRuido, []);
end