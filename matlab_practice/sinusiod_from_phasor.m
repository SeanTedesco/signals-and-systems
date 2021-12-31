%%
% Author:       Sean Tedesco
% Date:         December 31st, 2021
% Description:  Interactive graphing example that produces a sinusoid
%               signal from an input of phasor components. 
%%

% clean up
clear all; clf

% get the inputs
f = input(' frequency in Hz >> ');
A = input(' amplitude (>0) >> ');
theta = input(' phase in degrees >> ');
n_periods = input(' number of periods >> ');

% convert inputs to signal parameters
omega = 2*pi*f;                         % frequency rad/s
tmax = n_periods*1/f;                   % multiples of period
time = [ ];                             % initialization

% plot the sinusoid
figure(1)
for t=0:tmax/36:tmax                    % loop
    z = A*exp(1i*(omega*t+theta*pi/180));
    x = real(z); y = imag(z);           % projection
    time = [time t];                    % sequence
    
    subplot(121)    % subplot 1 of 2
    compass(x,y);   % plot vector
    axis('square')  % square axis
    
    subplot(122)                        % subplot 2 of 2
    plot(t,x,'*r')                      % plot x point in red '*'
    axis('square');
    axis([0 tmax -1.1*A 1.1*A]); grid   % bounds; grid

    hold on                             % hold current plot        
    pause(0.1)    
    
end % end loop
hold off % dismiss hold on