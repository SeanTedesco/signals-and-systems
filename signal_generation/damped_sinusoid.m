%%
% Author:       Sean Tedesco
% Date:         January 7th, 2022
% Description:  generate a damped sinusoid and view the function with
%               various time scales and time shifts.
%%

% clean up
clear all; clf

% define the required symbols
t = sym('t');

% generate the symbolic function
y = exp(-t)*cos(2*pi*t);
ye = exp(-t);

% plot the damped sinusoid as well as the exponential curve
figure(1)
fplot(y,[-2,4]); grid
hold on
fplot(ye,[-2,4])
hold on
fplot(-ye,[-2,4]); 
axis([-2 4 -8 8]);
hold off
xlabel('t'); ylabel('y(t)'); 
title('damped sinusoid');


% generate the time shifts and scales
for n=1:3
    if n==1
        a=0.5;b=1;
    elseif n==2
        a=2;b=2;
    else
        a=1.2; b=5;
    end
    
    figure(2)
    syms t f
    f(t) = cos(2*pi*(a*t-b))*exp(-(a*t-b))*heaviside(a*t-b);
    subplot(3,1,n)
    fplot(f,[0 10]);grid
    axis([0 10 -1.1 1.1])
end

