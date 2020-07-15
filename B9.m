clear;
%% Condition setting
M = 1; L = 0.842;
F = 1;g = 9.8093; 
A = [0,1,0,0;0,-F/M,0,0;0,0,0,1;0,F/L*M,g/L,0];
B = [0;1/M;0;-1/L*M];
C = [1,0,0,0;0,0,1,0];
D = 0;
R = [B,A*B,A*A*B,A*A*A*B];
T = 0.1;
X0 = [0.01,0,0,0];
X0 = [0.01,1,0,0.5];
X0 = [0;0;0.01;0];
X0=[2,0,0.5,0];
%% Discrete function
sys = ss(A,B,C,D);
sysd = c2d(sys,T);
Ad = sysd.A;
Bd = sysd.B;
Cd = sysd.C;
Dd = sysd.D;
% syms z;
% expand((z+3.4132)*(z+3.4132)*(z+1)*(z+1))
%% Calculating K 
Q = [10,0,0,0;0,0.1,0,0;0,0,10,0;0,0,0,0.1];
R = 1;
[K,S,e] = dlqr(Ad,Bd,Q,R);
K=-K;
sysdk = ss(Ad+Bd*K,[0,0,0,0]',Cd,Dd,T);
%% plotting u & y
[y,t,x]=initial(sysdk,X0,0:T:30);
for i = 1:size(x,1)
u(i) = K*x(i,:)';
end
figure(1)
stairs(t,u(1,:));
figure(2)
subplot(1,2,1)
hold on
stairs(t,y(:,1));
xlabel('t');
ylabel('y1(t)');
legend('Initial point 1','Initial point 2','Initial point 3','Initial point 4');
title('Discrete time system output y1(t)')
figure(2)
subplot(1,2,2)
hold on
stairs(t,y(:,2));
xlabel('t');
ylabel('y2(t)');
legend('Initial point 1','Initial point 2','Initial point 3','Initial point 4');
title('Discrete time system output y2(t)')


%% plotting u & y
% [y,t,x]=initial(sysdk,X0,0:T:100);
% for i = 1:size(x,1)
% u(i) = K*x(i,:)';
% end
% figure(1)
% stairs(t,u(1,:));
% figure(2)
% stairs(t,y(:,1));
% figure(3)
% stairs(t,y(:,2));