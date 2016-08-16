% dampedHarmonicGravity.m
%   Damping harmonic oscillator 
%       in gravitational field
%       Use Verlet Method (Second Order Differential Eqn)
%
%           Author: Mojolagbe Jamiu


%% set parameters
g = 9.1;    % m/s^2
m = 0.1;    % kg
k = 25;     % N/m
gamma = 0.05;   % damping constant (N s/m)
x0 = 0.1;   % m     initial position
v0 = 0;     % m/s   initial velocity
Tf = 2;     % s
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
    F = -k*x(it) - gamma*v(it) - m*g;
    vhalf = v(it) + (F/m)*deltat/2;
    x(it+1) = x(it) + vhalf*deltat;
    F = -k*x(it+1) - gamma*vhalf  - m*g;
    v(it+1) = vhalf + (F/m)*deltat/2;
end

%% energy analysis
KE = 0.5*m*v.^2;
PE = 0.5*k*x.^2 + m*g*x;
Etot = KE + PE;

%% plot results
figure(1);
plot(t,x);
xlabel('t(sec)');
ylabel('x(m)');
grid on

figure(2);
plot(t, KE, 'r', t, PE, 'b', t, Etot, 'k');
xlabel('t(sec)');
ylabel('Energy (J)');
grid on 
legend('Kinetic', 'Potential', 'Total');