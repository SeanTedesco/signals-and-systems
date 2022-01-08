%%
% Author:       Sean Tedesco
% Date:         January 7th, 2022
% Description:  Seperate a generated signal into even and odd components. 
%%

% clean up
clear all; clf

% support of signal
t=-5:0.01:5;

% ramps with support [-5, 5]
y1=ramp(t,2,2.5);
y2=ramp(t,-5,0);
y3=ramp(t,3,-2);

% unit-step signal with support [-5,5]
y4=unitstep(t,-4);

% superimposed signal
y=y1+y2+y3+y4;

% plot the figure
figure(1);
plot(t,y,'k'); axis([-5 5 -3 5]); grid

% generate even and odd components
[ye, yo]=evenodd(t,y);

% plot the even components 
figure(2);
subplot(211)
plot(t,ye,'r')
grid
axis([min(t) max(t) -2 5])

% plot the odd components
subplot(212)
plot(t,yo,'r')
grid
axis([min(t) max(t) -1 5])