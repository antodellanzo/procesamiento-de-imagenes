function [] = modificarSaturacionDeImagenRGB(imagenEnRGB)
imagenEnHSI = rgbToHsi(imagenEnRGB, false);
S = imagenEnHSI(:, :, 2);

c = [0.25, 0.5, 0.75, 2, 4];
for constante = c
   nuevaS = S .* constante;
   imagenEnHSI(:, :, 2) = nuevaS;
   str = sprintf('imagen en hsi por constante %f', constante);
   figure, imshow(hsiToRgb(imagenEnHSI, false)), title(str);
end

end