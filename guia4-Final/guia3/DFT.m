function [fmList] = DFT(fnList)
[filas, columnas] = size(fnList);
N = columnas;
fmList = zeros(1, columnas);
for m = 1 : 1 : N
    f_m = 0;
    for n = 1 : 1 : N
        f_m = f_m + double(fnList(n))*exp( (-2*pi*1j*(n-1)*(m-1))/N );
    end
    fmList(m) = f_m / sqrt(N);
end
end