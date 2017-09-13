function [imagenTransformada] = transformarCanalV(imagen)
imagenEnHsv = rgb2hsv(imagen);
canalV = imagenEnHsv(:, :, 3);
histogramaV = imhist(canalV);

vectorDeHistogramas = partirVectorEn( histogramaV, 3 );
h = histogramaFinal(vectorDeHistogramas);
canalVTrasnformado = imhistmatch(canalV, h);
imagenEnHsv(:, :, 3) = canalVTrasnformado;
imagenTransformada = hsv2rgb(imagenEnHsv);
figure, imshow(imagen), title('imagen original');
figure, imshow(imagenTransformada), title('imagen final');
end