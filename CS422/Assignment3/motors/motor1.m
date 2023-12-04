% Electric Motor Simulation (C.Markham, March 2018)
% Motor parameters (made up)
J=1.0;
b=0.04;
k1=1.0;
k2=-0.001;
R=1.0;
L=0.5;

% Time step, number of points
dt=0.001;
n=1400;
von=10.0;

position=1:1:n;
velocity=1:1:n;
inputs=1:1:n;
time=1:1:n;

% Intial starting values of the motor (boundary conditions)
i=0.0;
w=0.0;
q=0.0;
t=0.0;

for(p=1:n),
% for quarter the time period displayed v=0 then we turn the motor on, v=von
if (p<(n/4)) v=0.0; else v=von; end;
inputs(p)=v;

% Evaluate response (Eulers method, should use Runge Kutta)

di=(v-(R*i)-(k2*w))/L;
i=i+di;

S=0;
dw=((S*q)+(k1*i)-(b*w))/J;
w=w+dw;

dq=w*dt;
q=q+dq;

t=t+dt;

% Record values for plotting later
position(p)=q;
velocity(p)=w;
time(p)=t;

end;

% Plot Velocity and Position of the motor
figure(1);
subplot(3,1,1); % Input
plot(time,inputs,'r-');
title('Time vs Input (V)');

subplot(3,1,2); % Position
plot(time,position,'r-');
title('Time vs Position (Theta)');

% Display terminal position and overshoot
line1 = sprintf('Terminal pos %3.3f Overshoot %3.3f', position(n), max(position) - position(n));
text(0.0, 0.0, {line1}, 'Color', 'Blue', 'FontName', 'Times', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');


subplot(3,1,3); % Velocity
plot(time,velocity,'r-');
title('Time vs Velocity');

