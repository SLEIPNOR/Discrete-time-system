function Rx=eq2(t,x,u) 
M = 1; L = 0.842;
F = 1;g = 9.8093;

Rx=[1,1,1,1]'; 
Rx(1) = x(2);
Rx(2) = -x(2)+u;
Rx(3) = x(4);
Rx(4) = (g/L)*sin(x(3))+((F/(L*M))*x(2)-((u)/(L*M)))*cos(x(3));
end
