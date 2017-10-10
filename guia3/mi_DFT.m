function vector_dft=mi_DFT(vector_n)

muestras=length(vector_n);

vector_dft= zeros(1,muestras);


% % +++++++++++++++++++ Método clásico con dos for ++++++++++++++++++++++++++
% 
% for k = 0 : 1: (muestras-1)
%     for n = 0: 1: (muestras-1)
%         vector_dft(k+1)= vector_dft(k+1)+ vector_n(n+1)*exp(-2*pi*j*k*n/muestras);
%     end
% end
% % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% ******************** Me ahorro un for ***********************************
%
% Aprovecho que la multiplicacion de matrices  fila*colummna suma cada uno de los productos :)
% NOTAR: 
% que vector_n es de  1(una) fila y de "muestras" columnas por ej: Es decir vector_n 1x4 
% y el exponente es otra matriz de 1x4. Entonces el producto de matrices no se puede hacer. 
% Lo más normal e intuitivo es transponer exponente => exponente' es de 4x1 
% y al hacer el producto 1x4 * 4x1 = 1x1 lo cual es CORRECTO ya que es un solo valor para un valor de k.
% PERO si por error se traspone vector_n => vector_n' es de 4x1 el producto 4x1 * 1x4 = 4x4 
% es una matriz de 4x4 con 16 valores MAL MUY MAL 

% for k = 0 : 1: (muestras-1)
%          vector_dft(k+1)= vector_n * (exp(-2*pi*j*k*(0:1:(muestras-1))/muestras))';
% %        Aprovecho que la multiplicacion de matrices  fila*colummna suma cada uno de los productos :)
% end
% *************************************************************************


% &&&&&&&&&&&&&&&&&&&& Ahora me quiero ahorrar los 2 for &&&&&&&&&&&&&&&&&&
%
% Quiero llegar a un vector_dft de 1x4 o 4x1 y despues lo traspongo
% Pensemos: el vector_n es de 1x4 y no cambia
% lo que si cambia en funcion de n y k es el exponente
% me parece que el objetivo seria armar una matrix de muestasXmuestras es
% decir 4x4 para nuestro ejemplo. Sería algo asi

%   n0k0    n0k1    n0k2    n0k3
%   n1k0    n1k1    n1k2    n1k3
%   n2k0    n2k1    n2k2    n2k3
%   n3k0    n3k1    n3k2    n3k3

% y si la armo asi no tengo que trasponer ni nada. 
% La forma de armarla sería así (abajo hay un Ejemplo numérico):

%   Matriz_n?   *   Matriz_k?       =   Matriz_n?_k?   
%       4x1     *        1x4         =       4x4
%
%       n0      *   [k0 k1 k2 k3]   =    n0k0    n0k1    n0k2    n0k3
%       n1                               n1k0    n1k1    n1k2    n1k3
%       n2                               n2k0    n2k1    n2k2    n2k3   
%       n3                               n3k0    n3k1    n3k2    n3k3   

% Intento generar la matriz:  

% exponente_n= exp(-2*pi*j*1* (0:1:(muestras-1))/muestras
    % esta matriz exponente_n es de 1x4
% exponente_n_k = exponente_n' * ((0:1:(muestras-1));
    % asi me queda de 4x4 pero estoy multiplicando por cero en la base (A) MAL
    % yo quiero multiplicar en el exponente

exponente_n_k= exp(-2*pi*j*(0:1:(muestras-1))' * (0:1:(muestras-1))/muestras);
    % en la formula orginal exp(-2*pi*j*k*n/muestras) primero multiplicamos por k y luego por n
    % tanto k como n varian ambos de 0 a (muestras-1)
    % pero OJO en teoría de rigor de verdad en la deberian estar
    % alterados los ordenes de n y k: exp(-2 * pi * j * n * k / muestras)
    % primero multiplicamos por n y luego por k. 
    % Ahora n y k son matrices y el orden importa !!!
    % En este caso, la diferencia no se nota porque ambos varian de 0 a (muestras-1)
    % Pero mucho cuidado cuando las variaciones sean distintas... 
    % Para completar la idea ver más abajo el Ejemplo
    
vector_dft = vector_n * (exponente_n_k);

%Ejemplo: 
% >> (2:1:5)
% ans =   2     3     4     5
%
% >> (2:1:5)'
% ans =     2
%           3
%           4
%           5
%
% >> (6:1:9)
% ans =   6     7     8     9
% 
% >> (2:1:5)'*(6:1:9)
% ans =     12    14    16    18
%           18    21    24    27
%           24    28    32    36
%           30    35    40    45
% &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

