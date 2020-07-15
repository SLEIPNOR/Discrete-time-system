clc
clear all

ts=0.01;  
Period = 1;
x01=[0.5 0 pi/9 0];
x02=[0 0 pi/9 0];
x03=[0.5 0 0 0];
K=[-97.8460  -46.2099 -268.4810  -51.2019];

for k=1:Period/ts
    u=-K*x01';
    Tspan = [0 ts];
    [t,x1]=ode45(@(t,x) cartpend1(t,x,u), Tspan, x01);
    y1(k,:)= x1(end,:);
    x01 = x1(end,:);
end

sample_time = linspace(0,Period,size(y1,1));

figure(4)
subplot(1,2,1)
stairs(sample_time,y1(:,1))
legend('y1 - displacement s(t) [m]')
title('displacement)')
xlabel('Time -->');
ylabel('Magnitude -->');
grid

subplot(1,2,2)
stairs(sample_time,y1(:,3))
legend('y2 - angular rotation phi(t) [deg]')
title('angular rotation)')
xlabel('Time -->');
ylabel('Magnitude -->');
grid



