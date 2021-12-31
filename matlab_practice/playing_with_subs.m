%%
% Author:       Sean Tedesco
% Date:         December 31st, 2021
% Description:  Demonstration of MATLAB's sinc function, integration, as
%               well as thhe subs function to convert symbolic variables 
%               to numeric vectors.              
%%
% clean up
clear all; clf

%% SYMBOLIC
% define the symbolic variables
syms t z

% generate the integral of the signal squared
for k=1:10
    z = int(sinc(t)^2,t,0,k);   % integral of sinc^2 from 0 to k
    zz(k) = subs(2*z);          % substitution to numeric value zz
end

%% NUMERIC

% generate values for the sinc function numerically 
t1 = linspace(-4, 4);             % 100 equally spaced points in [-4,4]
y = sinc(t1).^2;                  % numeric definition of the squared sinc function
n = 1:10;

% plot the numerical squared sinc function 
figure(1);
subplot(211);
plot(t1,y); grid; 
title('y(t)=sinc^2(t)');
xlabel('t'); 

% plot the integral
subplot(212)
stem(n(1:10),zz(1:10)); hold on
plot(n(1:10),zz(1:10),'r'); grid;
title('\int y(\tau) d\tau'); 
xlabel('k');

hold off

