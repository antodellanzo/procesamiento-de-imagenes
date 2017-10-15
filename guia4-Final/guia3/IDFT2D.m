function [imagenTransformada] = IDFT2D(imagen)
[M, N, canales] = size(imagen);
imagenTransformada = zeros(M, N);
for x = 1 : 1 : M
    for y = 1 : 1 : N
        f_x_y = 0;
        for u = 1 : 1 : M
            for v = 1 : 1 : N 
                f_x_y = f_x_y + double(imagen(u, v))*exp( (1j*2*pi)*((((x-1)*(u-1))/M) + (((y-1)*(v-1)))/N) );
            end
        end
        imagenTransformada(x, y) = f_x_y / sqrt(M*N);
    end
end
end