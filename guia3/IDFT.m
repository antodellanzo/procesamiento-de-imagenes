function [fnList] = IDFT(fmList)
[filas, columnas] = size(fmList);
N = columnas;
fnList = zeros(1, columnas);
for n = 1 : 1 : N
    f_n = 0;
    for m = 1 : 1 : N
        f_n = f_n + double(fmList(m))*exp( ( 2*pi*1j*(n-1)*(m-1) )/N );
    end
    fnList(n) = f_n / sqrt(N);
end
end