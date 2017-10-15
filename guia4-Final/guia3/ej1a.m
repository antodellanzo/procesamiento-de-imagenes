function [] = ej1a(N)
vector = zeros(N);
figure('NumberTitle', 'off', 'Name', 'Parte real de la base de Fourier en 1D');
for k = 1 : N
    for n = 1 : N
        vector(k, n) = exp( double(1i * 2 * pi * (k-1) * (n-1))/double(N) );
    end
    titleReal = sprintf('n: %d', k);
    subplot(N/2, 2, k), stem(real(vector(k, :))), title(titleReal);
end
vector = zeros(N);
figure('NumberTitle', 'off', 'Name', 'Parte imaginaria de la base de Fourier en 1D');
for k = 1 : N
    for n = 1 : N
        vector(k, n) = exp( double(1i * 2 * pi * (k-1) * (n-1))/double(N) );
    end
    titleImag = sprintf('n: %d', k);
    subplot(N/2, 2, k), stem(imag(vector(k, :))), title(titleImag);
end
end