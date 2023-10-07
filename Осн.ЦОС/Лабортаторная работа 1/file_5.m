close all;
clear all;
clc;

% сигнал востанавливается по теореме Котельникова
% подробнее про теорему: https://ru.wikipedia.org/wiki/Теорема_Котельникова

set(0,'DefaultTextInterpreter','latex');
set(0,'DefaultLegendInterpreter','latex');

% fileID = fopen("sin.txt", 'r');
fileID = fopen("square.txt", 'r');
formatSpec = '%f';
Y = fscanf(fileID, formatSpec);
Y = Y';
a = 5/1024;
Y = a * Y;

% N=766;  % количество отсчетов для синуса
N = 519; % количество отсчётов для квадрата
Fs=100;  % частота дискретизации 10 Гц
f1=1; 
f2=3;
T=1/Fs;            
t=(0:N-1)*T;
x=Y;  % дискретизированный сигнал

delta=T;
Fs2=10000; % вспомогательная переменная для построения массива времени
T2=1/Fs2;
N2=Fs2/Fs*N;

x_a=zeros(1,N2);

for i=1:length(x_a)

    for k=1:length(x)
        fc(k)=x(k)*mysinc(pi/delta*((i-1)*T2-(k-1)*delta));
        x_a(i)=x_a(i)+fc(k);
    end

end


t2=(0:N2-1)*T2;

subplot(2, 1, 1);
plot(t(1:101),x(1:101), 'r');    % дискретизированный сигнал\
title('sampled signal');
grid on;
subplot(2, 1, 2);
plot(t2(1:10001),x_a(1:10001), ''); % "аналоговый" сигнал
title('restored signal');
grid on;

function y=mysinc(x)

if (x==0)
    y=1;
else
    y=sin(x)/x;
end

end