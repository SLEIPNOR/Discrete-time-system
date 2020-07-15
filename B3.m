%% Group 1
clear;
%% Condition setting
M = 1; L = 0.842;
F = 1;g = 9.8093;
A = [0,1,0,0;0,-F/M,0,0;0,0,0,1;0,F/L*M,g/L,0];
B = [0;1/M;0;-1/L*M];
C = [1,0,0,0;0,0,1,0];
D=0;
%% parameter of discrete system
T = 0.18; Period =20;
%% initial condtion & feedback gain
% xc(1,:) = [0.01,0,0,0];
% xs(1,:) = [0.01,0,0,0]; 
xc(1,:) = [0.01,1,0,0.5];
xs(1,:) = [0.01,1,0,0.5];
% xc(1,:) = [0,0,0.01,0];
% xs(1,:) = [0,0,0.01,0];
% xc(1,:) = [2,0,0.5,0];
% xs(1,:) = [2,0,0.5,0];
K =acker(A,B,[-0.5+i,-0.5-i,-5,-7]);
K=-K;
Kc =acker(A,B,[-0.5+i,-0.5-i,-5,-7]);
Kc=-Kc;
%% continues time plotting
[tc,xc]=ode45(@(t,x) eq2c(t,x,Kc),(0:0.01:Period),xc(1,:));
figure(2)
subplot(1,2,1)
hold on
plot(tc,xc(:,1));
% legend('Linearized system','Nonlinear system');
xlabel('t');
ylabel('y1(t)');
title('Output y1(t)')
subplot(1,2,2)
hold on
plot(tc,xc(:,1));
xlabel('t');
ylabel('y1(t)');
title('Output y1(t) connected with sampler and ZOH')
figure(3)
subplot(1,2,1)
hold on
plot(tc,xc(:,3));
% legend('Linearized system','Nonlinear system');
xlabel('t');
ylabel('y2(t)');
title('Output y2(t)')
subplot(1,2,2)
hold on
plot(tc,xc(:,3));
xlabel('t');
ylabel('y2(t)');
title('Output y2(t) connected with sampler and ZOH')
%% discrete time controller connected with nonlinear plant
for i = 1:Period/T
    u = K*xs(i,:)';
    [t,x] = ode45(@(t,x) eq2(t,x,u),[0:T/10:T],xs(i,:));
    xs(i+1,:) = x(end,:);
    xT(1+(i-1)*size(x,1):i*size(x,1),:) = x(:,:);
%     R1 = 1+(i-1)*(T/dis); R2 = R1+(T/dis)-1;
%     xs(R1:R2,1) = x(R2,1);
%     xs(R1:R2,2) = x(R2,2);
%     xs(R1:R2,3) = x(R2,3);
%     xs(R1:R2,4) = x(R2,4);
end
%% collecting and plotting y 
for i = 1: length(xT)
y(1,i) = C(1,:)*xT(i,:)';
y(2,i) = C(2,:)*xT(i,:)';
end
td = linspace(0,Period,length(xT));
figure(2)
subplot(1,2,1)
hold on
plot(td,y(1,:));
xlabel('t');
ylabel('y1(t)');
title('Output y1(t)')
% legend('Continues system','T = 0.01','T = 0.10','T = 0.18');
% legend('Continues system','T = 0.3');
figure(3)
subplot(1,2,1)
hold on
plot(td,y(2,:));
xlabel('t');
ylabel('y2(t)');
title('Output y2(t)')
% legend('Continues system','T = 0.01','T = 0.10','T = 0.18');
% legend('Continues system','T = 0.3');
%% collecting and plotting y (connected with sampler and holder)
for i = 1: length(xs)
ys(1,i) = C(1,:)*xs(i,:)';
ys(2,i) = C(2,:)*xs(i,:)';
end
tds = linspace(0,Period,length(xs));
figure(2)
subplot(1,2,2)
hold on
stairs(tds,ys(1,:));
xlabel('t');
ylabel('y1(t)');
title('Output y1(t) connected with sampler and ZOH')
% legend('Continues system','T = 0.01','T = 0.10','T = 0.18');
% legend('Continues system','T = 0.3');
figure(3)
subplot(1,2,2)
hold on
stairs(tds,ys(2,:));
xlabel('t');
ylabel('y2(t)');
title('Output y2(t) connected with sampler and ZOH')
% legend('Continues system','T = 0.01','T = 0.10','T = 0.18');
% legend('Continues system','T = 0.3');
%% steady-state accuracy - Performance 
sy1 = lsiminfo(y(1,:),td,0); 
sy2 = lsiminfo(y(2,:),td,0); 
S1 = stepinfo(y(1,:),td,0);
S2 = stepinfo(y(2,:),td,0);