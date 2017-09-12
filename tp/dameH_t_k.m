function [h_k_t] = dameH_t_k(h)
h_k_t = histograma_k_t(h, 2, 2);
end

function [y] = histograma_k_t(h, alpha, betha)
identidad = eye(256);
primerOperando = identidad .* ( alpha + betha );
segundoOperando = ( alpha .* h ) + ( betha .* histogramaUniforme(h) );
y = segundoOperando / primerOperando;
end