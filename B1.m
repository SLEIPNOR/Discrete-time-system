clear;
%% Initial point 1
%% Condition setting
M = 1; L = 0.842;
F = 1;g = 9.8093;P=20;
%% Initial Value
% X0 = [0.01,0,0,0]';
X0 = [0.01,1,0,0.5]';
% X0 = [0,0,0.01,0]';
% X0=[2,0,0.5,0]';
%% Parameter 
A = [0,1,0,0;0,-F/M,0,0;0,0,0,1;0,F/L*M,g/L,0];
B = [0;1/M;0;-1/L*M];
C = [1,0,0,0;0,0,1,0];
R = [B,A*B,A*A*B,A*A*A*B];
% syms z;
% expand((z+3.4132)*(z+3.4132)*(z+1)*(z+1))
%% Calculating K 
K =acker(A,B,[-0.5+2i,-0.5-2i,-5,-7]);
K=-K;
% phiA = A^4 + 2*A^3 + (3*A^2)/2 + A/2 + 1/16;
% K = [0,0,0,1]* R^-1 * phiA; 
% K = -K;
%% Plotting u
t = linspace (0,P,2000); 
for i = 1:length(t)
u(i) = K*expm((A+B*K)*t(i))*X0;
end
figure(1)
hold on
plot(t,u(1,:));
xlabel('t');
ylabel('u(t)');
% legend('Initial point 1','Initial point 3');
title('Feedback u(t) = Ku(t)')
%% Plotting y
t = linspace (0,P,2000);
for i = 1:length(t)
y = C*expm((A+B*K)*t(i))*X0;
yc(1,i) = y(1);
yc(2,i) = y(2);
end
figure(2)
subplot(1,2,1)
hold on
plot(t,yc(1,:));
xlabel('t');
ylabel('y1(t)');
% legend('Initial point 1','Initial point 3');
title('Output y1(t)')
figure(2)
subplot(1,2,2)
hold on
plot(t,yc(2,:));
xlabel('t');
ylabel('y2(t)');
% legend('Initial point 1','Initial point 3');
title('Output y2(t)')
%% 3D plotting
% plot3(t,yc(1,:),yc(2,:));
%% Group 2(poles)
% %% Calculating K 
% K =acker(A,B,[-0.5,-0.5,-5,-7]);
% K=-K;
% % phiA = A^4 + 2*A^3 + (3*A^2)/2 + A/2 + 1/16;
% % K = [0,0,0,1]* R^-1 * phiA; 
% % K = -K;
% %% Plotting u
% t = linspace (0,P,2000); 
% for i = 1:length(t)
% u(i) = K*expm((A+B*K)*t(i))*X0;
% end
% figure(1)
% hold on
% plot(t,u(1,:));
% legend('Group 1','Group 2');
% title('Feedback u(t) = Ku(t)')
% xlabel('t');
% ylabel('u(t)');