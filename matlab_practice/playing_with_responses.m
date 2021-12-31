%%
% Author:       Sean Tedesco
% Date:         December 31st, 2021
% Description:  Illustration of the unit-step, unit-impulse, and 
%               unit-ramp inputs to a system.
%%
% clean up
clear all; clf

% define a symbolic function 
syms y(t)

% generate an example differential equation with input x(t) =    1
eqn = diff(y,t,2) + 5*diff(y,t,1) + 6*y == 1; 

% find the derivate so initial conditions can be set, then set them
Dy = diff(y,t);
cond = [y(0)==0, Dy(0)==0];

% generate the responses
y(t) = dsolve(eqn,cond);    % unit-step response
Dy=diff(y,t);               % unit-impulse response
Iy=int(y,t);                % unit-ramp response

figure(1)
subplot(311)
fplot(y,[0,5]);title('Unit-step response');grid

subplot(312)
fplot(Dy,[0,5]);title('Impulse response');grid

subplot(313)
fplot(Iy,[0,5]);title('Ramp response');grid