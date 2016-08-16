% simpleharmonic1.m
%   Harmonic oscillator (F = ma; Newton 2nd law of Motion)
%       Use Improved Euler method
%
%           Author: Mojolagbe Jamiuﬂ


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
    v(it+1) = v(it) + (-k*x(it)/m)*deltat;
    x(it+1) = x(it) + (v(it)+v(it+1))*deltat/2;
end

%% plot results
plot(t,x);
xlabel('t(sec)');
ylabel('x(m)');
grid on