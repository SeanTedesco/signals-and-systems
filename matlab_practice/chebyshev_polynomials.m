%%
% Author:       Sean Tedesco
% Date:         December 31st, 2021
% Description:  Further illustration of MATLAB's symbolic feature, as well as
%               introduction to chebyshev filter design. 
%%
% clean up
clear all; clf

% define the symbolic variables 
syms x y t

% generate the fixed frequency signal     
x=cos(2*pi*t);
theta=0;

% plot the increasing frequency signals (k = 1...4)
figure(1)
for k=1:4
    y=cos(2*pi*k*t+theta);

    if k==1   
        subplot(221)
        fplot(x,y);grid;
        title('x(t)=cos(2pi*t), y(t)=cos(2pi*t)')
    elseif k==2
        subplot(222)
        fplot(x,y);grid;
        title('x(t)=cos(2pi*t), y(t)=cos(4pi*t)')
    elseif k==3
        subplot(223)
        fplot(x,y);grid;
        title('x(t)=cos(2pi*t), y(t)=cos(6pi*t)')
    else
        subplot(224)
        fplot(x,y);grid;
        title('x(t)=cos(2pi*t), y(t)=cos(8pi*t)')   
    end

    hold on
end

hold off