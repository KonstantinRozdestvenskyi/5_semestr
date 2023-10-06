% Проверка свойств преобразования Фурье.
% Все проверки производятся по одному из двух сценариев:
% 1. Вычисляются левая и правая часть и сравниваются аналитически(без
% подстановки)
% 2. В вычесленную левую и правую часть подставляется вектор x и значения
% сравниваются.

clear, clc;
close  all;


% сами сигналы
x = -1:0.05:1;
y1 = sin(2*pi*x);
y2 = sin(2*pi*x + pi/4);

% задание сигналов в символьном виде ( как мы пишем их в тетради)
syms t;
syms f(t);
f(t) = sin(2*pi*t);
syms g(t);
g(t) = sin(2*pi*t + pi/4);

% вычисление преобразования Фурье для исходных сигналов
syms w;
ff(w) = fourier(f);
gg(w) = fourier(g);

% проверка первого свойства
F(w) = fourier(2 * f + 2 * g);
G(w) = 2 * fourier(f) + 2 * fourier(g);
if G(w) == F(w)
    disp 1.yes;
end

% проверка вторго свойства
syms a;
F(w) = fourier(f(t - 2));
G(w) = exp(-1i*w*2)*fourier(f);
Y = double(subs(F(w), w, x));
X = double(subs(G(w), w, x));
k = 0;
if Y == X 
    disp 2.yes;
end

% проверка третьего свойства
syms a;
F(w) = fourier(exp(1i*2*t)*f(t));
G(w) = ff(w - 2);
if F == G 
    disp 3.yes;
end

% проверка четвёртого свойства
syms a;
F(w) = fourier(f(a * t));
syms p;
p = abs(a);
p = p^-1;
G(w) = p*ff(w/a);
Y = subs(F(w), a, 2);
X = subs(G(w), a, 2);
Y = double(subs(Y, w, x));
X = double(subs(X, w, x));
if X == Y 
    disp 4.yes;
end

% проверка пятого свойства
n = 2;
df = diff(f, t, n);
F(w) = fourier(df);
syms p;
p = 1i*w;
p = p^n;
G(w) = p*ff(w);
Y = double(subs(F, w, x));
X = double(subs(G, w, x));
if Y == X 
    disp 5.yes;
end

% проверка шестого свойства
n = 2;
F(w) = fourier(t^n*f);
syms p;
dgg = diff(gg, w, n);
p = 1i;
p = p^n;
G(w) = p*dgg(w);
Y = double(subs(F, w, x));
X = double(subs(G, w, x));
if Y == X 
    disp 6.yes;
end

% проверка седьмого свойства
syms p(t);
syms tt
p(t) = f(tt)*g(t - tt);
syms s(t);
s(t) = int(p(t), tt, 0, t);
F(w) = fourier(s);
G(w) = sqrt(2 * pi) * ff * gg;
Y = double(subs(F, w, x));
X = double(subs(G, w, x));
if Y == X 
     disp 7.yes;
end 

% проверка восьмого свойства
syms q(w);
syms tau;
q(w) = ff(tau) * gg(w - tau);
syms G(w);
G(w) = int(q, tau, 0, w);
X = double(subs(G, w, x));
F(w) = ff(w) * gg(w)/sqrt(2*pi);
Y = double(subs(F, w, x));
if Y == X 
     disp 8.yes;
end  

%проверка 9 свойства !!! в интернете это свойство без деления на 2 пи. То
%же самое говорит матлаб
F(w) = fourier(dirac(t));
G(w) = 1;
Y = double(subs(F, w, x));
X = double(subs(G, w, x));
if Y == X 
     disp 9.yes;
end

% проверка 10 свойства
syms p(t);
p(t) = 1;
F(w) = fourier(p); % функция единичного скачка
G(w) = sqrt(2*pi)* dirac(w);
Y = double(subs(F, w, x));
X = double(subs(G, w, x));
if Y == X 
     disp 10.yes;
end 
