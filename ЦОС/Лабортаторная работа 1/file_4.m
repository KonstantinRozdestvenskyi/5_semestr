clear; clc;
close all;

fileID = fopen("square.txt", 'r');
formatSpec = '%f';
Y = fscanf(fileID, formatSpec);
Y = Y';
a = 5/1024;
Y = a * Y;
Fd = 100;
td = (1:length(Y)) * 1/Fd;
subplot(3,1,1);
plot(td, Y);
xlabel('t');
ylabel('y');
title('signal');

Fy = fft(Y,512);
Ay = abs(Fy);
f = 1000*(0:256)/512;

subplot(3,1,2);
plot(f, Ay(1:257));
xlabel('f');
ylabel('A');
title('amplitude spectrum');


Phy = angle(Fy);

subplot(3,1,3);
plot(f, Phy(1:257));
xlabel('f');
ylabel('F');
title('phase spectrum');

