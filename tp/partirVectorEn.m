function [vectorDeHistogramas] = partirVectorEn( vectorDeEntrada, k )
vector = transpose(vectorDeEntrada);
[filas, columnas] = size(vector);
columnas = uint16(columnas);
tamanoDeCadaVector = uint16( ceil( columnas / k ) );
indiceEnVectorDeSalida = 1;
vectorDeHistogramas = cell(1, k);
for indice = 1 : tamanoDeCadaVector : columnas
    nuevoV = zeros(1, columnas);
    if indice + tamanoDeCadaVector <= columnas
        nuevoV( indice : (indice + tamanoDeCadaVector - 1) ) = vector ( indice : (indice + tamanoDeCadaVector - 1) );
    else
        nuevoV( indice : columnas ) = vector (indice : columnas );
    end
    figure, bar(nuevoV), title('histo intermedio');
    vectorDeHistogramas{indiceEnVectorDeSalida} = nuevoV;
    indiceEnVectorDeSalida = indiceEnVectorDeSalida + 1;
end
end