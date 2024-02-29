pkg load communications
pkg load symbolic
close all;
clear all;

%%PROBLHMA1
%%b)
d=1;
Iz=0.38;
AM=4172;
bx=(3-(AM/5000));
bth=(5-(AM/5000));
th0=AM/20000;
th1(1)=th0;
th2(1)=0;
h=0.001;
t=[0:h:30];
m=9;
f1=AM/7000;
f2=AM/7000;
%%f2=AM/8000;
u(1)=0;
for k=2:length(t)
    u(k)=u(k-1)+(h*((((f1+f2)-bx*(abs(u(k-1)))*u(k-1)))/m));
endfor  
sx1=figure(1);
plot(t,u)
title("Method Euler u for b to problem 1");
for p=2:length(t)
    th2(p)=(th2(p-1)+(h*((((d/2)*(f2-f1))-bth*(abs(th2(p-1)))*th2(p-1))/Iz)));
    th1(p)=(th1(p-1)+(h*((((d/2)*(f2-f1))-bth*(abs(th2(p-1)))*th2(p-1))/Iz)));
endfor  
sx2=figure(2);
plot(t,th1)
title("Method Euler th for b to problem 1");
sx3=figure(3);
plot(t,th2)
title("Method Euler th' for b to problem 1 ");
for o=2:length(t)
    u(o)=u(o-1)+(h*((h/2)+1)*((((f1+f2)-bx*(abs(u(o-1)))*u(o-1)))/m));
endfor  
sx4=figure(4);
plot(t,u)
title("Modified Euler method u for b to problem 1");

for m=2:length(t)
    th2(m)=(th2(m-1)+(h*(h/2 + 1)*((((d/2)*(f2-f1))-bth*(abs(th2(m-1)))*th2(m-1))/Iz)));
    th1(m)=(th1(m-1)+(h*(h/2 + 1)*((((d/2)*(f2-f1))-bth*(abs(th2(m-1)))*th2(m-1))/Iz)));
endfor  
sx5=figure(5);
plot(t,th1)
title("Modified Euler method th for b to problem 1");
sx6=figure(6);
plot(t,th2)
title("Modified Euler method th' for b to problem 1");
%%d)e)
%AM=4172;
Krth=5;
Kdth=15+(AM/1000);
th0=0;
%th1(1)=0;
%th2(1)=0;
thdes=-(AM/10000);
for c=2:length(t)
    th2(c)=th2(c-1)+h*((d/2)*(((Krth*(thdes-th2(c-1))-Kdth*th2(c-1)))-bth*(abs(th2(c-1)))*th2(c-1))/Iz);
    th1(c)=th1(c-1)+h*((d/2)*(((Krth*(thdes-th2(c-1))-Kdth*th2(c-1)))-bth*(abs(th2(c-1)))*th2(c-1))/Iz);
endfor  
sx7=figure(7);
plot(t,th1)
title("Method Euler th for d to problem 1");
sx8=figure(8);
plot(t,th2)
title("Method Euler th' for d to problem 1");
for a=2:length(t)
   th2(a)=th2(a-1)+h*(h/2 + 1)*((d/2)*(((Krth*(thdes-th2(a-1))-Kdth*th2(a-1)))-bth*(abs(th2(a-1)))*th2(a-1))/Iz);
   th1(a)=th1(a-1)+h*(h/2 + 1)*((d/2)*(((Krth*(thdes-th2(a-1))-Kdth*th2(a-1)))-bth*(abs(th2(a-1)))*th2(a-1))/Iz);
endfor  
sx9=figure(9);
plot(t,th1)
title("Modified Euler method th for d to problem 1");
sx10=figure(10);
plot(t,th2)
title("Modified Euler method th' for d to problem 1");

%%PROBLHMA2




%%d)e)
d=1;
th0=0;
Iz=0.38;
bth=4 - (AM/5000);
Krth=5;
Kdth=15 + (AM/1000);
thdes=-(AM/10000);
for n=2:length(t)
    th2(n)=th2(n-1)+h*(d/2)*(((Krth*(thdes-th2(n-1))-Kdth*th2(n-1))-bth*(abs(th2(n-1)))*th2(n-1))/Iz);
    th1(n)=th1(n-1)+h*(d/2)*(((Krth*(thdes-th2(n-1))-Kdth*th2(n-1))-bth*(abs(th2(n-1)))*th2(n-1))/Iz);
endfor  
sx11=figure(11);
plot(t,th1)
title("Method Euler th for d to problem 2");
sx12=figure(12);
plot(t,th2)
title("Method Euler th' for d to problem 2");
for b=2:length(t)
   th2(b)=th2(b-1)+h*(h/2 + 1)*((d/2)*(((Krth*(thdes-th2(b-1))-Kdth*th2(b-1)))-bth*(abs(th2(b-1)))*th2(b-1))/Iz);
   th1(b)=th1(b-1)+h*(h/2 + 1)*((d/2)*(((Krth*(thdes-th2(b-1))-Kdth*th2(b-1)))-bth*(abs(th2(b-1)))*th2(b-1))/Iz);
endfor  
sx13=figure(13);
plot(t,th1)
title("Modified Euler method th for d to problem 2");
sx14=figure(14);
plot(t,th2)
title("Modified Euler method th' for d to problem 2");
%%b
d=1;
h=1;
th0=0;
Iz=0.38;
bth=4 - (AM/5000);
thdes=-(AM/10000);
%periptwsh1
Krth=5;
Kdth=[0.1:h:100];
for b=0:length(Kdth)
  H =tf([0 Krth],[(2*Iz) (Kdth+(2*bth)) Krth])
  sx15=figure(15);
  pzmap(H);
  grid on
endfor
%periptwsh2
Krth1=[0.1:h:100];
Kdth1=15;
for b=0:length(Krth1)
 
 H =tf([0 Krth1],[(2*Iz) (Kdth1+(2*bth)) Krth1])
 sx16=figure(16);
 pzmap(H);
 grid on
endfor 
%e)
h=0.1;
TH(1)=0;
t=[0:h:30]
for b=2:length(t)
 TH(b) =((-0.0021267)*exp((-36.0057)*b))+(0.4148733*exp((-0.1827)*b)) - 0.417;
endfor
sx17 = figure(17);
plot(t,TH)