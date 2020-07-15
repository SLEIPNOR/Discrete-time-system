function xp = cartpend1(t,x,u)

M=1;
L=0.842;
F=1;
g=9.8093;
U=u; 
xp = zeros(4,1);

xp(1) = x(2);
xp(2) = (-F/M)*x(2)+(1/M)*U;
xp(3) = x(4);
xp(4) = (g/L)*sin(x(3))+(F/(M*L))*x(2)*cos(x(3))-(1/(M*L))*U*cos(x(3));

