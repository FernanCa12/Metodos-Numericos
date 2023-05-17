clear; clc;

dias = (1:91)';

datos = [2855.32;
         2855.44;
         2854.13;
         2857.46;
         2857.46;
         2857.46;
         2807.36;
         2790.26;
         2765.10;
         2751.88;
         2751.88;
         2751.88;
         2751.88;
         2727.23;
         2713.04;
         2688.20;
         2693.54;
         2667.37;
         2667.37;
         2667.37;
         2670.79;
         2690.79;
         2690.15;
         2665.41;
         2642.97;
         2642.97;
         2642.97;
         2623.91;
         2626.80;
         2598.68;
         2585.11;
         2585.11;
         2585.11;
         2585.11;
         2556.21;
         2566.66;
         2550.74;
         2537.68;
         2548.20;
         2548.20;
         2548.20;
         2528.85;
         2550.43;
         2531.72;
         2535.91;
         2535.91;
         2535.91;
         2535.91;
         2538.55;
         2523.00;
         2569.17;
         2623.66;
         2623.66;
         2623.66;
         2623.66;
         2588.56;
         2571.92;
         2554.44;
         2549.29;
         2533.79;
         2533.79;
         2533.79;
         2549.97;
         2548.13;
         2542.53;
         2500.22;
         2500.22;
         2500.22;
         2500.22;
         2489.39;
         2503.37;
         2475.45;
         2417.01;
         2417.01;
         2417.01;
         2417.01;
         2389.49;
         2377.87;
         2386.77;
         2381.53;
         2360.58;
         2360.58;
         2360.58;
         2369.23;
         2362.41;
         2386.72;
         2408.17;
         2393.58;
         2393.58;
         2393.58;
         2393.58];

% Ajuste lineal
[yfit1, p1] = modelo_lineal(dias, datos);
residuos1 = datos - yfit1;
S1 = sum(residuos1.^2);

% Ajuste cuadrático
[yfit2, p2] = modelo_cuadratico(dias, datos);
residuos2 = datos - yfit2;
S2 = sum(residuos2.^2);

% Ajuste exponencial (recuerda, los datos deben ser todos positivos)
[yfit3, p3] = modelo_logaritmico(dias, datos);
residuos3 = datos - yfit3;
S3 = sum(residuos3.^2);

% Impresión de los residuos
fprintf('La suma de los residuos al cuadrado para el ajuste lineal es %.2f\n', S1);
fprintf('La suma de los residuos al cuadrado para el ajuste cuadrático es %.2f\n', S2);
fprintf('La suma de los residuos al cuadrado para el ajuste exponencial es %.2f\n', S3);

% Creación de la gráfica
figure
plot(dias, datos, 'o', dias, yfit1, '-', dias, yfit2, '--', dias, yfit3, ':')
legend('Datos', 'Ajuste Lineal', 'Ajuste Cuadrático', 'Ajuste Exponencial', 'Location', 'best')
xlabel('Días')
ylabel('Datos')
title('Comparación de los Ajustes por Mínimos Cuadrados')
