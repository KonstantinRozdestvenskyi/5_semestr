clear; clc;
close all;

set(0,'DefaultTextInterpreter','latex')
set(0,'DefaultLegendInterpreter','latex')

% исходный сигнал
x = -1:0.01:1;
[y, P, E, Pm] = F(x, 1, 1);
Pm = double(subs(Pm, x(fix(length(x)/2)))); % расчёт мгновенной мощности в конкретной точке

% цифровизация
fd = 8; % частота дискретизации
td = 1/fd; % период дискретизации
X = -1:td:1;
Y = double(F(X, 2, 1));

b = 4; % разрядность квантования
R = 2^b; % количество уровней квантования



Yc = fix(Y*(R-1))/(R-1); % квантуем дискретный сигнал и получаем цифровой

plot(x, y,'b', 'linew', 3); % Построение графика
hold on;
stem(X, Y, 'g^-', 'linew', 1);
hold on;
stairs(X, Yc, 'rx--', 'linew', 1);
xlabel('$t$');
ylabel('$y$');
title ('$signal$ $analisys$');
legend('$original$', '$digital$', '$discrete$');
text(x(fix(length(x)/2)) + 0.05, y(fix(length(x)/2)) - 0.05 , [' $$ p = ' num2str(Pm) '$$']);
grid on;
disp 'энергия сигнала:'; % вывод значений
disp(E);
disp 'средняя мощность сигнала:';
disp(P);



