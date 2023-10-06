close all;
clear all;
clc;

set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Lucida Console');
set(0,'DefaultTextFontSize',14,'DefaultTextFontName','Lucida Console');

set(0,'DefaultAxesFontSize',10,'DefaultAxesFontName','Lucida Console');
set(0,'DefaultTextFontSize',10,'DefaultTextFontName','Lucida Console');

%fileID = fopen("sin.txt", 'r');
fileID = fopen("square.txt", 'r');
formatSpec = '%f';
Y = fscanf(fileID, formatSpec);
Y = Y';
a = 5/1024;
Y = a * Y;

Fs=100;                  % частота дискретизации, Гц
T=1/Fs;                   % период дискретизации, сек
%N=766;                   % количество отсчетов синуса
N=519;                   % количество отсчетов квадрата
t=(0:N-1)*T;              % массив отсчетов времени
f=(0:N-1)*(Fs/N);         % массив частот

M=2; % коэффициент децимации
Fsd=Fs/M;
Td=T*M;


x1=Y;

subplot(3,1,1);
plot(t(1:101),x1(1:101));
xlabel('t, сек');
% xlim([t(1) t(N)]);
xlim([0 1]);
ylabel('x(t)');
title('Исходный сигнал');
grid on;



y1=x1(1:M:end);
z1=zeros(1,N);

for i=1:N
    for k=1:length(y1)
        z1(i)=z1(i)+y1(k)*sinc_(pi/Td*((i-1)*T-(k-1)*Td));
    end
end

subplot(3,1,2);
plot(t(1:101),z1(1:101));
xlabel('t, сек');
% xlim([t(1) t(N)]);
xlim([0 1]);
ylabel('z(t)');
title('Восстановленный сигнал');

%y = sin(2 * pi * 10 * t) + 1.5;
y = square(2 * pi * 10 * t) + 1.5;
subplot(3, 1, 3);
plot(t(1:101),y(1:101));
xlabel('t, сек');
%xlim([t(1) t(N)]);
xlim([0 1]);
ylabel('z(t)');
title('теория');
grid on;

function y=sinc_(x)

if (x==0)
    y=1;
else
    y=sin(x)/x;
end

end