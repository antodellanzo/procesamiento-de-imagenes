function [] = ej1b()
M = 8;
N = 8;
figure('NumberTitle', 'off', 'Name', 'Parte real de la base de Fourier en 2D');
indiceParaSubplot = 1;
for u = 1 : 1 : M
    for v = 1 : 1 : N
        matrizBase = zeros(M, N);
        for x = 1 : 1 : M
            for y = 1 : 1 : N 
                matrizBase(x, y) = exp( (-1j*2*pi)*( (((x-1)*(u-1))/M) + (((y-1)*(v-1))/N) ));
            end
        end
        t = sprintf('m: %d, n: %d', u, v);
        subplot(N, N, indiceParaSubplot), imshow(real(matrizBase)), title(t);
        indiceParaSubplot = indiceParaSubplot + 1;
    end
end
figure('NumberTitle', 'off', 'Name', 'Parte imaginaria de la base de Fourier en 2D');
indiceParaSubplot = 1;
for u = 1 : 1 : M
    for v = 1 : 1 : N
        matrizBase = zeros(M, N);
        for x = 1 : 1 : M
            for y = 1 : 1 : N 
                matrizBase(x, y) = exp( (-1j*2*pi)*( (((x-1)*(u-1))/M) + (((y-1)*(v-1))/N) ));
            end
        end
        t = sprintf('m: %d, n: %d', u, v);
        subplot(N, N, indiceParaSubplot), imshow(imag(matrizBase)), title(t);
        indiceParaSubplot = indiceParaSubplot + 1;
    end
end
end