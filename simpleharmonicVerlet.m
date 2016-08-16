% simpleharmonicVerlet.m
%   Harmonic oscillator 
%       Use Verlet Method (Second Order Differential Eqn)
%
%           Author: Mojolagbe Jamiu


%% set parameters
m = 0.1;    % kg
k = 25;     % N/m
x0 = 0.1;   % m     initial position
v0 = 0;     % m/s   initial velocity
Tf = 5;     % s
Nt = 300;

%% initialize
t = linspace(0, Tf, Nt);
x = zeros(1,Nt);
v = zeros(1,Nt);
deltat = t(2) - t(1);
x(1) = x0;
v(1) = v0;

%% time march
for it = 1:Nt-1
    vhalf = v(it) + (-k*x(it+1)/m)*deltat/2;
    x(it+1) = x(it) + vhalf*deltat;
    v(it+1) = vhalf + (-k*x(it+1)/m)*deltat/2;
end

%% plot results
plot(t,x);
xlabel('t(sec)');
ylabel('x(m)');
grid on