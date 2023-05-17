function [yfit, coeffs] = modelo_logaritmico(dias, datos)
% Calcular la suma de los elementos y sus cuadrados
sum_x = sum(dias);
sum_x2 = sum(dias.^2);

% Aplicar logaritmo natural a los datos
log_datos = log(datos);

% Calcular la suma de los elementos y sus productos
sum_log_y = sum(log_datos);
sum_x_log_y = sum(dias .* log_datos);

% Calcular el número de observaciones
N = length(dias);

% Calcular los coeficientes
b = (N * sum_x_log_y - sum_x * sum_log_y) / (N * sum_x2 - sum_x^2);
ln_a = (sum_log_y - b * sum_x) / N;

% Convertir ln(a) de vuelta a a
a = exp(ln_a);

% Guardar los coeficientes en un vector
coeffs = [a, b];

% Impresión de los coeficientes
fprintf('El modelo exponencial resultante es: y = %.2fe^(%.2fx)\n', a, b);

% Creación de la línea de regresión para la gráfica
yfit = a*exp(b*dias);

% Gráfico
figure
plot(dias, datos, 'o', dias, yfit, '-')
legend('Datos', 'Regresión Exponencial', 'Location', 'best')
xlabel('Días')
ylabel('Datos')
title('Regresión Exponencial por Mínimos Cuadrados')

end