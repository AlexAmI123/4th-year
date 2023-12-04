%% Electric Motor Simulation
% Motor parameters (made up)
J=10.0;
b=0.1;
k1=1.0;
k2=-0.001;
R=1.0;
L=0.5;

% We can use this "spring constant" as a disturbance input
% As if motor naturaly wants to be at some non zero position
S=-1.0; %-1.0;

% Controler parameters
KP=10.0; %10.0
KI=20;   %20.0
KD=0.08; %0.08

% Time step, number of points
dt=0.0001;
n=14000;

% Set value for the motor position
qon=1.0;

% Store so we can print out dynamic response
position=1:1:n;
velocity=1:1:n;
inputs=1:1:n;
time=1:1:n;
error1=1:1:n;
error2=1:1:n;

% Intial starting values of the motor (boundary conditions)
i=0.0;
w=0.0;
q=0.0;
t=0.0;

% Initial output of the controler
v=0.0; v1=0; e3=0; e2=0; e1=0;

for(p=1:n),

% for quarter the time period displayed v=0 then we turn the motor on, v=von
if (p<(n/4)) qset=0.0; else qset=qon; end;
inputs(p)=qset;

% PID response
e=qset-q; % error is set-measured value

% Derivative of error over three points
ed=((KD*(e-(2.0*e1)+e2)/dt)+(KD*(e1-(2.0*e2)+e3)/dt))/2.0;

if (ed>0.05) ed=0.05; end;
if (ed<-0.05) ed=-0.05; end;

v=v1+(KP*(e-e1))+(KI*e*dt)+ed; %PID action
v1=v;
e3=e2;
e2=e1;
e1=e;

error1(p)=e;

% Response of the motor (V in Theta,q out)
% "Black Box"
di=(v-(R*i)-(k2*w))/L;
i=i+di;
dw=((S*q)+(k1*i)-(b*w))/J;
w=w+dw;
dq=w*dt;
q=q+dq;
% End of motor code

t=t+dt;

% Record values for plotting later
position(p)=q;
velocity(p)=w;
time(p)=t;

end;

% Plot Velocity and Position of the motor
figure(1);
subplot(4,1,1); % Input
plot(time,inputs,'r-');
title('Set Position vs Time');

m=max(position)*0.7;
for(p=1:n),
    if (position(p)>m) t=time(p)-time(n/4); break; end;
end;

subplot(4,1,2); % Position
plot(time,position,'r-');
title('Position (Theta) vs Time');
line1=sprintf('Set:%3.3f Final Posn:%3.3f Steady State Error:%3.3f Overshoot:%3.3f RiseTime:%3.3f',qset,position(n),qset-position(n),max(position)-qon,t);
text(time(n-7000),0.15,{line1},'Color','Blue','FontName','Times','Fontsize',12,'HorizontalAlignment','center','VerticalAlignment','bottom');

subplot(4,1,3); % Error
plot(time,error1,'r-');
title('Error vs Time');

subplot(4,1,4); % Velocity
plot(time,velocity,'r-');
title('Velocity vs Time');
