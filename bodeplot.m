
G = tf([100],[1 100]);
W = tf([-3436563657.0,6.873127314*10^11],[7436563657.0 6.873127314*10^11])
opts = bodeoptions('cstprefs');
opts.PhaseWrapping = 'on';
bode(G,opts);
hold on;
bode(W,opts);
grid on