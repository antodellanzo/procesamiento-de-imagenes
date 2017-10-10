function [imagenTransformada] = DFT2D(imagen)
[M, N, canales] = size(imagen);
imagenTransformada = zeros(M, N);
for u = 1 : 1 : M
    for v = 1 : 1 : N
        f_u_v = 0;
        for x = 1 : 1 : M
            for y = 1 : 1 : N 
                f_u_v = f_u_v + double(imagen(x, y))*exp( (-1j*2*pi)*( (((x-1)*(u-1))/M) + (((y-1)*(v-1))/N) ) );
            end
        end
        imagenTransformada(u, v) = f_u_v / sqrt(M*N);
    end
end
end