function robot_p

global hui

angle=get(hui(1),'value'); 
height=get(hui(2),'value');
radius=get(hui(3),'value');


% 3 Link Robot, Set alpha, theta, L and D for each link
theta=[angle  0  90];
alpha=[0 -90 0];
    L=[  0  0 0];
    D=[height 0 radius];
       
% v is a vector defining the origin, the Fixed Link
v=[0;0;0;1;];

% tmat is the transformation matrix (at the start it is the identity matrix)
tmat=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

% For each link
for(i=1:3),
  t=pi*theta(i)/180.0; % Convert degrees to radians
  a=pi*alpha(i)/180.0;
  
  % Rotation about Z, between Xi and Xi-1 axes
  rz=[cos(t) -sin(t) 0 0; sin(t) cos(t) 0 0; 0 0 1 0; 0 0 0 1];
  
  % Rotation about X, between Zi and Zi-1 axes 
  rx=[1 0 0 0; 0 cos(a) -sin(a) 0 ; 0 sin(a) cos(a) 0; 0 0 0 1];
  
  % Translation, Li  is the common normal distance between the Zi and Zi-1 axes 
  %              Di is the distance between the Xi and Xi-1 axes.
  tz=[1 0 0 L(i); 0 1 0 0; 0 0 1 D(i); 0 0 0 1];
  
  % Evaluate the DH matrix, that maps from the origin to the current link(i)
  tmat=(tmat*(rz*(tz*rx)));
  
  % Add a new column to the matrix V to store co-ordinate of link i
  v(:,i+1)=tmat*v(:,1);
end;



a=uicontrol('style','text','position',[10 50 80 20]);
set(a,'string',strcat('Angle:',num2str(angle)));
b=uicontrol('style','text','position',[110 50 80 20]);
set(b,'string',strcat('Height:',num2str(height)));
c=uicontrol('style','text','position',[220 50 80 20]);
set(c,'string',strcat('Radius:',num2str(radius)));

figure(1);

% Plot an XY view of the robot

subplot(2,3,1); % 6 Graphs layed out on the page 3x2
plot(v(1,:),v(2,:),'ro-');
axis([-4 4 -4 4]);
title('XY');
for(i=1:3+1),
line1=sprintf('%.0f',i);
text(v(1,i),v(2,i),{line1},'Color','Blue','FontName','Times','Fontsize',8,'HorizontalAlignment','center','VerticalAlignment','bottom');
end;


% Plot an YZ view of the robot
%figure(2);
subplot(2,3,2)
plot(v(2,:),v(3,:),'ro-');
axis([-4 4 -4 4]);
title('YZ');
for(i=1:3+1),
line1=sprintf('%.0f',i);
text(v(2,i),v(3,i),{line1},'Color','Blue','FontName','Times','Fontsize',8,'HorizontalAlignment','center','VerticalAlignment','bottom');
end;

% Plot an XZ view of the robot
%figure(3);
subplot(2,3,3)
plot(v(1,:),v(3,:),'ro-');
axis([-4 4 -4 4]);
title('XZ');
for(i=1:3+1),
line1=sprintf('%.0f',i);
text(v(1,i),v(3,i),{line1},'Color','Blue','FontName','Times','Fontsize',8,'HorizontalAlignment','center','VerticalAlignment','bottom');
end;
%%rectangle('Position',[1 1 2 2]','Facecolor','red','Edgecolor','red');

subplot(2,3,6)
	% Plot v in 3d
    plot3(v(1, :), v(2, :), v(3, :), 'ro-', 'LineWidth', 2);
	axis([-2 2 -2 2 -2 2]);

drawnow;

return