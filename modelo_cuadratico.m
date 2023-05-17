function [yfit, coeffs] = modelo_cuadratico(dias, datos)
% Preparar la matriz de diseño
X = [ones(size(dias)), dias, dias.^2];

% Calcular los coeficientes de la regresión cuadrática
coeffs = (X'*X)\(X'*datos);

% Extraer los coeficientes
a = coeffs(1);
b = coeffs(2);
c = coeffs(3);

% Impresión de los coeficientes
fprintf('El modelo cuadrático resultante es: y = %.2f + %.2fx + %.2fx^2\n', a, b, c);

% Creación de la línea de regresión para la gráfica
yfit = a + b*dias + c*dias.^2;

% Gráfico
figure
plot(dias, datos, 'o', dias, yfit, '-')
legend('Datos', 'Regresión Cuadrática', 'Location', 'best')
xlabel('Días')
ylabel('Datos')
title('Regresión Cuadrática por Mínimos Cuadrados')

end