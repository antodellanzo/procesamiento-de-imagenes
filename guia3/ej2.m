function [] = ej2()
vector = [ 1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0 ];
[filas, columnas] = size(vector);
fourier = DFT(vector);
mod = abs(fourier);
figure;
vectorSinFrecuenciasBajas = fourier;
vectorSinFrecuenciasAltas = fourier;
vectorSinFrecuenciasIntermedias = fourier;
for index = 1 : columnas
    if mod(index) > 1
        vectorSinFrecuenciasAltas(index) = 0;
    end
    if mod(index) < 0.2
        vectorSinFrecuenciasBajas(index) = 0;
    end
    if mod(index) < 1 && mod(index) > 0.2
        vectorSinFrecuenciasIntermedias(index) = 0;
    end
end
subplot(3, 2, 1), stem(vector), title('vectorOriginal');
subplot(3, 2, 2), stem(IDFT(vectorSinFrecuenciasBajas)), title('vector sin frecuencias bajas');
subplot(3, 2, 4), stem(IDFT(vectorSinFrecuenciasAltas)), title('vector sin frecuencias altas');
subplot(3, 2, 5), stem(mod), title('magnitud fourier');
subplot(3, 2, 6), stem(IDFT(vectorSinFrecuenciasIntermedias)), title('vector sin frecuencias intermedias');
end