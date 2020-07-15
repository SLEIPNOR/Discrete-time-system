clear all
close all
clc

%% Excercise 1

G1z=tf([0.368 0.264],[1 -0.368],1);
G0z1=tf([1],[1 -1],1);
G2z=tf([1.14 0.595],[1 -0.135],2);
G0z2=tf([1],[1 -1],2);
G3z=tf([3.027 0.908],[1 -0.0183],4);
G0z3=tf([1],[1 -1],4);

%% THIS 1
figure(9)
rlocus(G0z1*G1z)
zgrid 
set(gca,'Xlim',[-1.5 1.5])
set(gca,'Ylim',[-1.5 1.5])

%% THIS 2
figure(10)
rlocus(G0z2*G2z)
zgrid 
set(gca,'Xlim',[-1.5 1.5])
set(gca,'Ylim',[-1.5 1.5])

%% THIS 3
figure(11)
rlocus(G0z3*G3z)
zgrid 
set(gca,'Xlim',[-1.5 1.5])
set(gca,'Ylim',[-1.5 1.5])


%% THIS 4
figure(12)
T=0.5:0.01:20;
K1=-2*(1+exp(-T))./(2*(1-exp(-T))-T.*(1+exp(-T)));
K2=(1-exp(-T))./(1-exp(-T)-T.*exp(-T));
plot(T,K1)
hold on
set(gca,'Ylim',[0 4])

%% THIS 5
plot(T,K2,'r')
%set(gca,'Xlim',[-1 1])
set(gca,'Ylim',[0 4])

%% THIS 6
[~,ind]=min(abs(T-3.72));
plot(T(1:ind),K2(1:ind),'g','linewidth',2)
plot(T(ind:end),K1(ind:end),'g','linewidth',2)
Klim1=(1-exp(-1))/(1-exp(-1)-1*exp(-1))
plot(1,Klim1,'*k')
Klim2=(1-exp(-2))/(1-exp(-2)-2*exp(-2))
plot(2,Klim2,'*k')
Klim4=-2*(1+exp(-4))/(2*(1-exp(-4))-4*(1+exp(-4)))
plot(4,Klim4,'*k')


%% Excercise 2

%% THIS 7
HPz=tf([0 1-exp(-1)],[1 -exp(-1) 0 0],1);
figure(13)
rlocus(HPz)
hold on
zgrid 
set(gca,'Xlim',[-1.5 1.5])
set(gca,'Ylim',[-1.5 1.5])

%% THIS 8
theta=0:0.01:2*pi;
plot(3/4*cos(theta),3/4*sin(theta),'g','linewidth',2)


%% THIS 9
HPx=tf([0 1-exp(-1)],[27/64 -9/16*exp(-1) 0 0],1);
figure(14)
rlocus(HPx)
zgrid 
set(gca,'Xlim',[-1 1])
set(gca,'Ylim',[-1 1])



