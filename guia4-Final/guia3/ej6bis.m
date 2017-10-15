function [] = ej6bis()
N = 10;
f = rand(1, N, 'double');
g =  rand(1, N, 'double');

fourierDeConv = fft(cconv(f, g, N));
fourierMult = fft(f) .* fft(g);

figure;
subplot(2, 4, 1), stem(real(fourierDeConv)), title('Parte real de F[conv(f, g)]');
subplot(2, 4, 2), stem(imag(fourierDeConv)), title('Parte imaginaria de F[conv(f, g)]');
subplot(2, 4, 3), stem(real(fourierMult)), title('Parte real de F[f].F[g]');
subplot(2, 4, 4), stem(imag(fourierMult)), title('Parte imaginaria de F[f].F[g]');
end