clear all
close all
clc

%% Exercise 1

figure(1)
T=0.01;
Gs = tf([0 100],[1 100])
opts = bodeoptions('cstprefs');
opts.PhaseWrapping = 'on';
bode(Gs,opts)
hold on
Gw = tf([exp(-1)-1 200*(1-exp(-1))],[exp(-1)+1 200*(1-exp(-1))])
bode(Gw,opts)


%% Exercise 2
%% Continuous-time
figure(2)
bode(tf([1],[1 3 2 0]))
hold on

%% for T=1
HPw1=0.2171861827e-1*tf([1 -6.397672022],[1 1.523188312])*tf([1 2.532920335],[1 .9242343145])*tf([1 -2],[1 0])
bode(HPw1)
% %Note that Cw=0.5 satisfies the requirements
% bode(0.5HPw1)

%% for T=0.5
HPw05=0.4389372893e-2*tf([1 -8.947442526],[1 1.848468629])*tf([1 5.763716022],[1 .9796746497])*tf([1 -4],[1 0])
bode(HPw05)
% %Note that Cw=0.8 satisfies the requirements
% bode(0.8*HPw05)

%% for T=0.2
HPw02=0.3241647774e-3*tf([1 -18.99891027],[1 1.973753203])*tf([1 15.97070465],[1 .9966799462])*tf([1 -10],[1 0]);
bode(HPw02)


%% Exercise 3
%% Continuous-time

npoints=2000;
omega=logspace(-1,2,npoints);

figure(3)
bode(tf([1],[1 2 0]),omega)
hold on

%% T=0.1
HPwK=-0.8300134571e-3*tf([1 600.3998619],[1 1.993359892])*tf([1 -20],[1 0]);
bode(HPwK,omega)

m=6;
tau=sqrt(m)/4.81;
Cw=tf([tau 1],[tau/m 1])
bode(HPwK*Cw,omega)







