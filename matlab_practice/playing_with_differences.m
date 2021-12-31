%%
% Author:       Sean Tedesco
% Date:         December 31st, 2021
% Description:  Demonstration of how to take the difference (differentiation) 
%               of a singal and plot it symbolically and numerically. 
%%

% clean up
clear all; clf

%% SYMBOLIC

% define the symbolic variables
syms t y z 

% generate the signals 
y = cos(t^2);           % chirp signal -- notice no . before ^ since t is not a vector
z = diff(y);            % find the derivative 

% plot the chirp signal for symbolic y between 0 and 2*pi
figure(1);
subplot(211);
fplot(y,[0,2*pi]); grid on
hold on

% plot the derivative as well
subplot(212)
fplot(z,[0,2*pi]); grid on
hold on

%% NUMERIC

% get the signal parameters 
Ts = 0.1;                   % sampling period
t1 = 0:Ts:2*pi;             % sampled time
y1 = cos(t1.^2);            % sampled signal -- notice difference with sym y
z1 = diff(y1)./diff(t1);    % difference -- approximation to derivative

% plot the sampled chirp signal
figure(1);
subplot(211);
stem(t1,y1,'k');
axis([0 2*pi 1.1*min(y1) 1.1*max(y1)])
title('y(t) - chirp signal')
legend('Original Signal (blue)','Sampled Signal (black)')

% plot the sampled chirp signal diference
subplot(212)
stem(t1(1:length(y1)-1),z1,'k');
axis([0 2*pi 1.1*min(z1) 1.1*max(z1)])
title('y`(t) - chirp signal derivative (difference)')
legend('Derivative (blue)','Difference (black)')

hold off