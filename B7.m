clear;
%% Condition setting
M = 1; L = 0.842;
F = 1;g = 9.8093; 
A = [0,1,0,0;0,-F/M,0,0;0,0,0,1;0,F/L*M,g/L,0];
B = [0;1/M;0;-1/L*M];
C = [1,0,0,0;0,0,1,0];
D = 0;
R = [B,A*B,A*A*B,A*A*A*B];
T = 3;
X0 = [0.01,0,0,0];
X0 = [0.01,1,0,0.5];
X0 = [0,0,0.01,0];
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
K =acker(Ad,Bd,[exp((-0.5+i)*T),exp((-0.5-i)*T),exp(-8*T),exp(-9*T)]);
K=-K;
sysdk = ss(Ad+Bd*K,[0,0,0,0]',Cd,Dd,T);
% phiA = A^4 + 2*A^3 + (3*A^2)/2 + A/2 + 1/16;
% K = [0,0,0,1]* R^-1 * phiA; 
% K = -K;
%% plotting u & y
[y,t,x]=initial(sysdk,X0,0:T:40);
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
% legend('Initial point 1','Initial point 2','Initial point 3','Initial point 4');
title('Discrete time system output y1(t)')
subplot(1,2,2)
hold on
stairs(t,y(:,2));
xlabel('t');
ylabel('y2(t)');
% legend('Initial point 1','Initial point 2','Initial point 3','Initial point 4');
title('Discrete time system output y2(t)')
%% Plotting u
% t = linspace (0,30,2000); 
% for i = 1:length(t)
% u(i) = K*expm((Ad+Bd*K)*t(i))*X0;
% end
% %% Plotting y
% t = linspace (0,30,2000);
% for i = 1:length(t)
% y = C*expm((Ad+Bd*K)*t(i))*X0;
% yc(1,i) = y(1);
% yc(2,i) = y(2);
% end
% figure(2)
% plot(t,yc(1,:));
% figure(3)
% plot(t,yc(2,:));
% % plot3(t,yc(1,:),yc(2,:));