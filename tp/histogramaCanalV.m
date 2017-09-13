function [histogramaV] = histogramaCanalV(imagen)
imagenEnHsv = rgb2hsv(imagen);
canalV = imagenEnHsv(:, :, 3);
histogramaV = imhist(canalV);

vectorDeHistogramas = partirVectorEn( histogramaV, 3 );
histogramaFinal(vectorDeHistogramas);

end
