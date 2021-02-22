clc
clear all
close all

f1=input('enter the value of frequency for sine wave:');
t=1:0.01:10;
x=sin(2*pi*f1*t);
subplot(2,3,1);
plot(t,x);
title('Sine wave')
axis tight;

f2=input('enter the value of frequency for triangular wave:');
w=0.5;
y=sawtooth(2*pi*f2*t,w);
subplot(2,3,4);
plot(t,y);
title('Triangular wave')

%Lineraly Addition of 2 Signals
c=x+y
subplot(2,3,2)
plot(t,c)
title('Addition of both signals')


c1=conv(x,y)
subplot(2,3,5)
plot(c1)
title('convolution of both signals')


[a,b]=deconv(c1,y)
subplot(2,3,6)
plot(y)
title('Original signal Traingular wave')


subplot(2,3,3)
plot(a)
title('Original signal sine wave')
