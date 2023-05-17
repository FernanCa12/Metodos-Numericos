clear; clc;

dias = (1:91)';

datos = [3740.14;
    3740.14;
    3740.14;
    3816.65;
    3831.35;
    3846.28;
    3800.33;
    3765.33;
    3765.33;
    3765.33;
    3714.94;
    3703.20;
    3734.09;
    3728.09;
    3682.84;
    3682.84;
    3682.84;
    3682.84;
    3655.74;
    3682.66;
    3721.57;
    3738.19;
    3738.19;
    3738.19;
    3750.66;
    3735.41;
    3747.48;
    3729.02;
    3715.28;
    3715.28;
    3715.28;
    3715.28;
    3671.38;
    3642.29;
    3657.41;
    3609.20;
    3609.20;
    3609.20;
    3609.20;
    3597.18;
    3588.41;
    3589.86;
    3626.02;
    3626.02;
    3626.02;
    3626.02;
    3693.35;
    3690.56;
    3730.45;
    3753.77;
    3753.77;
    3753.77;
    3758.08;
    3784.45;
    3773.11;
    3770.35;
    3739.03;
    3739.03;
    3739.03;
    3713.17;
    3756.67;
    3748.50;
    3775.53;
    3777.17;
    3777.17;
    3777.17;
    3777.17;
    3782.27;
    3815.22;
    3850.46;
    3829.46;
    3829.46;
    3829.46;
    3824.08;
    3826.85;
    3796.07;
    3809.07;
    3808.46;
    3808.46;
    3808.46;
    3842.97;
    3842.97;
    3855.68;
    3866.86;
    3874.44;
    3874.44;
    3874.44;
    3904.17;
    3918.49;
    3902.18;
    3836.95];

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
fprintf('La suma de los residuos al cuadrado para el ajuste lineal es %.6f\n', S1);
fprintf('La suma de los residuos al cuadrado para el ajuste cuadrático es %.6f\n', S2);
fprintf('La suma de los residuos al cuadrado para el ajuste exponencial es %.6f\n', S3);

% Creación de la gráfica
figure
plot(dias, datos, 'o', dias, yfit1, '-', dias, yfit2, '--', dias, yfit3, ':')
legend('Datos', 'Ajuste Lineal', 'Ajuste Cuadrático', 'Ajuste Exponencial', 'Location', 'best')
xlabel('Días')
ylabel('Datos')
title('Comparación de los Ajustes por Mínimos Cuadrados')
