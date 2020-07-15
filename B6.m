clear;
%% Condition setting
M = 1; L = 0.842;
F = 1;g = 9.8093;X0 = [-2;0;0;0];
A = [0,1,0,0;0,-F/M,0,0;0,0,0,1;0,F/L*M,g/L,0];
B = [0;1/M;0;-1/L*M];
C = [1,0,0,0;0,0,1,0];
D = 0;
Ts = 0.1;
K =acker(A,B,[-0.5+i,-0.5-i,-8,-9]);
K=-K;
%% Discrete function
sys = ss(A,B,C,D)
sysd = c2d(sys,Ts);
