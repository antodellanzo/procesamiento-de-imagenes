function [imagenTransformada] = paper(imagen)
imagenEnHsv = rgb2hsv(imagen);
canalV = imagenEnHsv(:, :, 3);
histogramaV = imhist(canalV);
figure, bar(histogramaV);

vectorDeHistogramas = partirVectorEn( histogramaV, 3 );
h = histogramaFinal(vectorDeHistogramas);
figure, bar(h), title('histograma final');
canalVTrasnformado = especificacionHistograma(canalV, h);
imagenEnHsv(:, :, 3) = canalVTrasnformado;
imagenTransformada = hsv2rgb(imagenEnHsv);
figure, imshow(imagen), title('imagen original');
figure, imshow(imagenTransformada), title('imagen final');
end