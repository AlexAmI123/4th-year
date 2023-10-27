% Implementation of DH matrix method for a spherical robot
% C.Markham 2010

function spherical

global hui% GLOBAL variables
% to pass between functions cartesian.m and robot.m
close all
figure(1);

% Set up slider, give its range (0-4),
% initial value (2), and callback (robot)
hui(1)=uicontrol('style','slider',...
'value',2,...
'position',[10 10 80 20],...
'min',-180,'max',180,...
'callback','robot_s'); 

% initial value (2), and callback (robot)
hui(2)=uicontrol('style','slider',...
'value',2,...
'position',[110 10 80 20],...
'min',-180,'max',180,...
'callback','robot_s'); 

% initial value (2), and callback (robot)
hui(3)=uicontrol('style','slider',...
'value',2,...
'position',[220 10 80 20],...
'min',0,'max',4,...
'callback','robot_s'); 

robot_s;

return

