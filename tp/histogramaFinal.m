function [h] = histogramaFinal(vectorDeHistogramas)
[filas, columnas] = size(vectorDeHistogramas);
h = zeros(256);
alpha = 2;
betha = 2;
for i = 1 : 1 : 256
    for k = 1 : 1 : columnas
        acum = 0;
        for j = 1 : 1 : columnas
            acum = acum + dameW_k( vectorDeHistogramas{j}, i );
        end
        h_k_t = histograma_t_k( vectorDeHistogramas{k}, alpha, betha );
        h(i) = h(i) + ( ( dameW_k( vectorDeHistogramas{k}, i ) / acum ) *  ( h_k_t(i) ) );
    end
end
end

function [h_u] = histogramaUniforme(h_k)
[filas, columnas] = size(h_k);
h_u = ones( 1, columnas );
[primer, ultimo] = posicionPrimerYUltimoGris(h_k);
for indice = 1 : 1 : primer - 1
    h_u(indice) = dameW_k( h_k, indice );
end
for indice = ultimo + 1 : 1 : columnas
    h_u(indice) = dameW_k( h_k, indice );
end
end

function [p, u] = posicionPrimerYUltimoGris(h)
mayoresACero = find(h > 0);
[f, columnas] = size(mayoresACero);
if columnas == 0
    p = 0;
    u = 0;
    return
end
p = mayoresACero(1);
u = mayoresACero(columnas);
end

function [u_k] = dameU_k(h)
[primer, ultimo] = posicionPrimerYUltimoGris(h);
u_k = double( primer + ultimo ) / 2.0;
end

function [o_k] = dameO_k(h)
o_th = double( abs( 128 - mean(h) ) );
[primer, ultimo] = posicionPrimerYUltimoGris(h);
v_d = double( abs( ultimo - primer ) ) / 2.0;
o_k = max(o_th, v_d);
end

function [w_k] = dameW_k(h, i)
w_k = exp( - ( ( ( double(i) - dameU_k(h) ) ^ 2 ) / ( 2.0 * ( dameO_k(h) ^ 2 ) ) ) );
end

function [y] = histograma_t_k(h, alpha, betha)
identidad = eye(256);
primerOperando = identidad .* ( alpha + betha );
segundoOperando = ( alpha .* h ) + ( betha .* histogramaUniforme(h) );
y = segundoOperando / primerOperando;
end