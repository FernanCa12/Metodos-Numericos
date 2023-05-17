function [yfit, coeffs] = modelo_lineal(dias, datos)
% Cálculo de las sumas requeridas
sum_x = sum(dias);
sum_y = sum(datos);
sum_x2 = sum(dias.^2);
sum_xy = sum(dias.*datos);

% Número de observaciones
N = length(dias);

% Cálculo de los coeficientes
b = (N*sum_xy - sum_x*sum_y) / (N*sum_x2 - sum_x^2);
a = (sum_y - b*sum_x) / N;

% Guardar los coeficientes en un vector
coeffs = [a, b];

% Impresión de los coeficientes
fprintf('El modelo lineal resultante es: y = %.2f + %.2fx\n', a, b);

% Creación de la línea de regresión para la gráfica
yfit = a + b*dias;

% Gráfico
figure
plot(dias, datos, 'o', dias, yfit, '-')
legend('Datos','Regresión Lineal','Location','best')
xlabel('Días')
ylabel('Datos')
title('Regresión Lineal por Mínimos Cuadrados')

end