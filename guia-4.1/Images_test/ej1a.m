function [] = ej1a(imagen)
imagenConRuido = imnoise(imagen, 'salt & pepper', 0.02);
M1 = (1/10) * [ 1,1,1;1,2,1;1,1,1 ];
M2 = (1/40) * [ 1, 1, 2, 1, 1; 1,1,4,1,1;1,1,8,1,1;1,1,4,1,1;1,1,2,1,1 ];
M3 =  1.0 ./ M1;
M4 =  1.0 ./ M2;
figure, 
subplot(2, 2, 1), imshow(imagenConRuido), title('imagen con ruido');
subplot(2, 2, 2), imshow( convolucion(imagenConRuido, M1 ), []), title('Convolucion con M1');
subplot(2, 2, 3), imshow( convolucion(imagenConRuido, M3 ), []), title('Convolucion con M3');

figure, 
subplot(2, 2, 1), imshow(imagenConRuido), title('imagen con ruido');
subplot(2, 2, 2), imshow( convolucion(imagenConRuido, M2 ), []), title('Convolucion con M1');
subplot(2, 2, 3), imshow( convolucion(imagenConRuido, M4 ), []), title('Convolucion con M4');
end