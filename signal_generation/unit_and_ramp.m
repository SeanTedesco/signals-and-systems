%%
% Author:       Sean Tedesco
% Date:         January 7th, 2022
% Description:  Generate a basic signal using home made ramp and unitstep. 
%%
% clean up
clear all; clf

% support of signal
Ts = 0.01; 
t = -5:Ts:5;

% ramps with support [-5, 5]
y1 = ramp(t,3,3);     % slope of 3 and advanced by 3
y2 = ramp(t,-6,1);    % slope of -6 and advanced by 1
y3 = ramp(t,3,0);     % slope of 3

% unit-step signal with support [-5,5]
y4 = -3*unitstep(t,-3); % amplitude -3 and delayed by 3

% superimposed signal
y = y1 + y2 + y3 + y4;

% plot the function
plot(t,y,'k'); 
axis([-5 5 -1 7]); grid