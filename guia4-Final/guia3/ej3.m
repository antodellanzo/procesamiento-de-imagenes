function [] = ej3()
ej3Aux(cuadrado());
ej3Aux(cuadradoTransladado());
ej3Aux(rectangulo());
ej3Aux(rectangulos());
ej3Aux(lineaVertical());
ej3Aux(lineaVerticalRotada45());
ej3Aux(lineaVerticalRotada90());
ej3Aux(lineasVerticales());
ej3Aux(lineasVerticalesRotadas45());
ej3Aux(lineasVerticalesRotadas90());
end

function [] = ej3Aux(imagen)
figure;
trans = DFT2D(imagen);
subplot(2, 2, 1), imshow(imagen), title('Imagen original');
subplot(2, 2, 2), imshow(abs(fftshift(trans))), title('Imagen transformada con Fourier');
subplot(2, 2, 3), imshow(IDFT2D(trans)), title('Antitransformada de la transformada');
end