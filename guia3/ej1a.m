function [] = ej1a()
N = 12;
vector = zeros(N);
figure;
indiceParaSubplot = 1;
for k = 1 : N
    for n = 1 : N
        vector(k, n) = exp( double(1i * 2 * pi * (k-1) * (n-1))/double(N) );
    end
    if ( k == (N/2) + 1 )
        figure;
        indiceParaSubplot = 1;
    end
    titleReal = sprintf('Parte real con k: %d', k);
    titleImag = sprintf('Parte imaginaria con k: %d', k);
    subplot(N/2, 2, indiceParaSubplot), stem(real(vector(k, :))), title(titleReal);
    subplot(N/2, 2, indiceParaSubplot + 1), stem(imag(vector(k, :))), title(titleImag);
    indiceParaSubplot = indiceParaSubplot + 2;
end
end