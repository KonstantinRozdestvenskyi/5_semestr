clear, clc;
close  all;

set(0,'DefaultTextInterpreter','latex')
set(0,'DefaultLegendInterpreter','latex')

% сами сигналы
x = -1:0.05:1;
f = 1000*(0:40)/41; 
y1 = sin(2*pi*x);
y2 = sin(2*pi*x + pi/4);
y3 = cos(2*pi*x);

f1 = fft(y1); % преобразование Фурье для 1-го сигнала
A1 = abs(f1); % амплитудный спектр
F1 = angle(f1); % фазовы спектр

% далее посторение дискретных спектров и графиков
figure;
subplot(3, 1, 1);
plot(x, y1);
title(' $$ y =  \sin (2\pi x) $$');
subplot(3, 1, 2);
plot(f, A1);
title(' $$ y =  \sin (2\pi x) , AS $$');
subplot(3, 1, 3);
plot(f, F1);
title(' $$ y =  \sin (2\pi x) , FS $$');

% дальше анологично
f2 = fft(y3);
A2 = abs(f2);
F2 = angle(f2);
figure;
subplot(3, 1, 1);
plot(x, y1);
title(' $$ y =  \sin (2\pi x + \frac{\pi}{4}) $$');
subplot(3, 1, 2);
plot(f, A2);
title(' $$ y =  \sin (2\pi x + \frac{\pi}{4}) , AS $$');
subplot(3, 1, 3);
plot(f, F2);
title(' $$ y =  \sin (2\pi x + \frac{\pi}{4}) , FS $$');

f3 = fft(y2);
A3 = abs(f3);
F3 = angle(f3);
figure;
subplot(3, 1, 1);
plot(x, y3);
title(' $$ y =  \cos (2\pi x) $$');
subplot(3, 1, 2);
plot(f, A3);
title(' $$ y =  \cos (2\pi x) , AS $$');
subplot(3, 1, 3);
plot(f, F3);
title(' $$ y =  \cos (2\pi x) , FS $$');


