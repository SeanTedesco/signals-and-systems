%%
% Author:       Sean Tedesco
% Date:         December 31st, 2021
% Description:  Lissajous figures are used to find the ratio of the amplitudes
%               of the input and the output sinusoids, or to determine the 
%               phase different between the input and the output sinusoids.
%%
% clean up
clear all; clf

% define the symbolic variables
syms x y t

% generate the signals 
x = cos(2*pi*t);        % input of unit amplitude and frequency 2*pi
A = 1;                  % amplitude of output in case 1

figure(1) 
for i=1:2
    for k=0:3
        theta = k*pi/4;             % phase of output (pi/4, pi/2, 3*pi/4)
        y = A^k*cos(2*pi*t+theta);
        
        if k==0
            subplot(221)
            fplot(x,y);grid;
            title('theta = 0')
        elseif k==1
            subplot(222)
            fplot(x,y);grid;
            title('theta = pi/4')
        elseif k==2
            subplot(223)
            fplot(x,y);grid;
            title('theta = pi/2')
        else
            subplot(224)
            fplot(x,y);grid;
            title('theta = 3*pi/4')
        end
        hold on
    end
    A=0.5; 
    figure(2) % amplitude of output in case 2
end