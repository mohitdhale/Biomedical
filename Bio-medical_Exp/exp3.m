clc;
clear all;
close all;

x=0.01:0.01:5;
default=input('Press 1 if u want default ecg signal else press 2:\n'); 

if(default==1)
      li=30/72;  
    
      a_pwav=0.25;
      d_pwav=0.09;
      t_pwav=0.16;  
     
      a_qwav=0.025;
      d_qwav=0.066;
      t_qwav=0.166;
      
      a_qrswav=1.6;
      d_qrswav=0.11;
            
      a_swav=0.25;
      d_swav=0.066;
      t_swav=0.09;
      
      a_twav=0.35;
      d_twav=0.142;
      t_twav=0.2;
      
      a_uwav=0.035;
      d_uwav=0.0476;
      t_uwav=0.433;
else
    rate=input('\n\nenter the heart beat rate :');
    li=30/rate;
    
    %p wave specifications
    fprintf('\n\np wave specifications\n');
    d=input('Enter 1 for default specification else press 2: \n');
    if(d==1)
        a_pwav=0.25;
        d_pwav=0.09;
        t_pwav=0.16;
    else
       a_pwav=input('amplitude = ');
       d_pwav=input('duration = ');
       t_pwav=input('p-r interval = ');
       d=0;
    end    
    
    %q wave specifications
    fprintf('\n\nq wave specifications\n');
    d=input('Enter 1 for default specification else press 2: \n');
    if(d==1)
        a_qwav=0.025;
        d_qwav=0.066;
        t_qwav=0.166;
    else
       a_qwav=input('amplitude = ');
       d_qwav=input('duration = ');
       t_qwav=0.166;
       d=0;
    end    
    
    %qrs wave specifications
    fprintf('\n\nqrs wave specifications\n');
    d=input('Enter 1 for default specification else press 2: \n');
    if(d==1)
        a_qrswav=1.6;
        d_qrswav=0.11;
    else
       a_qrswav=input('amplitude = ');
       d_qrswav=input('duration = ');
       d=0;
    end    
    
     %s wave specifications
    fprintf('\n\ns wave specifications\n');
    d=input('Enter 1 for default specification else press 2: \n');
    if(d==1)
        a_swav=0.25;
        d_swav=0.066;
        t_swav=0.09;
    else
       a_swav=input('amplitude = ');
       d_swav=input('duration = ');
       t_swav=0.09;
       d=0;
    end    
    
    %t wave specifications
    fprintf('\n\nt wave specifications\n');
    d=input('Enter 1 for default specification else press 2: \n');
    if(d==1)
        a_twav=0.35;
        d_twav=0.142;
        t_twav=0.2;
    else
       a_twav=input('amplitude = ');
       d_twav=input('duration = ');
       t_twav=input('s-t interval = ');
       d=0;
    end    
    
    %u wave specifications
    fprintf('\n\nu wave specifications\n');
    d=input('Enter 1 for default specification else press 2: \n');
    if(d==1)
        a_uwav=0.035;
        d_uwav=0.0476;
        t_uwav=0.433;
    else
       a_uwav=input('amplitude = ');
       d_uwav=input('duration = ');
       t_uwav=0.433;
       d=0;
    end    
    
end

l=li;
a1=a_pwav;
x1=x+t_pwav;
b1=(2*l)/d_pwav;
x2=x+t_qwav;
a2=a_qwav;
b2=(2*l)/d_qwav;
a3=a_qrswav;
b3=(2*l)/d_qrswav;
x4=x-t_swav;
a4=a_swav;
b4=(2*l)/d_swav;
a5=a_twav;
x5=x-t_twav-0.045;
b5=(2*l)/d_twav;
a6=a_uwav
x6=x-t_uwav;
b6=(2*l)/d_uwav;

p1=1/l;
p2=0;
q1=(a2/(2*b2))*(2-b2);
q2=0;
qrs1=(a3/(2*b3))*(2-b3);
qrs2=0;
s1=(a4/(2*b4))*(2-b4);
s2=0;
t1=1/l;
t2=0;
u1=1/l;
u2=0;

n=100;
for i = 1:n
    harm1=(((sin((pi/(2*b1))*(b1-(2*i))))/(b1-(2*i))+(sin((pi/(2*b1))*(b1+(2*i))))/(b1+(2*i)))*(2/pi))*cos((i*pi*x1)/l);
    p2=p2+harm1;
    
    harm5=(((2*b2*a2)/(i*i*pi*pi))*(1-cos((i*pi)/b2)))*cos((i*pi*x2)/l);
    q2=q2+harm5;
    
    harm=(((2*b3*a3)/(i*i*pi*pi))*(1-cos((i*pi)/b3)))*cos((i*pi*x)/l);
    qrs2=qrs2+harm;
    
    harm3=(((2*b4*a4)/(i*i*pi*pi))*(1-cos((i*pi)/b4)))*cos((i*pi*x4)/l);
    s2=s2+harm3;
    
    harm2=(((sin((pi/(2*b5))*(b5-(2*i))))/(b5-(2*i))+(sin((pi/(2*b5))*(b5+(2*i))))/(b5+(2*i)))*(2/pi))*cos((i*pi*x5)/l);
    t2=t2+harm2;
    
    harm4=(((sin((pi/(2*b6))*(b6-(2*i))))/(b6-(2*i))+(sin((pi/(2*b6))*(b6+(2*i))))/(b6+(2*i)))*(2/pi))*cos((i*pi*x6)/l);
    u2=u2+harm4;    
end

pwav1=p1+p2;
pwav=a1*pwav1;
qwav=-1*(q1+q2);
qrswav=qrs1+qrs2;
swav=-1*(s1+s2);
twav1=t1+t2;
twav=a5*twav1;
uwav1=u1+u2;
uwav=a6*uwav1;

%ecg output
ecg=pwav+qrswav+qwav+swav+twav+uwav;

subplot(2,3,1)
figure(1)
plot(x,ecg);
axis tight
title('ECG Signal')


fc1 = 10;
fs1 = 1000;
[b11,a11] = butter(2,fc1/(fs1/2));
figure(2)
freqz(b11,a11);
axis tight
title('Butterworth o=2 f=10 Filter')

fc2 = 40;
fs2 = 1000;
axis tight
[b12,a12] = butter(2,fc2/(fs2/2));
figure(4)
freqz(b12,a12);
axis tight
title('Butterworth o=2 f=40 Filter')

fc3 = 20;
fs3 = 1000;
[b13,a13] = butter(8,fc2/(fs2/2));
figure(5)
freqz(b13,a13);
axis tight

title('Butterworth o=8 f=20 Filter')

fc4 = 40;
fs4 = 1000;
[b14,a14] = butter(8,fc2/(fs2/2));
figure(6)
freqz(b14,a14);
axis tight
title('Butterworth o=8 f=40 Filter')


n= awgn(ecg,25);
figure(1)
subplot(2,3,2)
plot(x,n)
axis tight
title('Noisy ECG Signal')


c1=conv(n,b11)
figure(1)
subplot(2,3,3)
plot(c1)
axis tight
title('Convolved Signal O=2 F=10')

c2=conv(n,b12)
figure(1)
subplot(2,3,4)
plot(c2)
axis tight
title('Convolved Signal O=2 F=40')

c3=conv(n,b13)
figure(1)
subplot(2,3,5)
plot(c3)
axis tight
title('Convolved Signal O=8 F=20')

c4=conv(n,b14)
figure(1)
subplot(2,3,6)
plot(c4)
axis tight
title('Convolved Signal O=8 F=40')
