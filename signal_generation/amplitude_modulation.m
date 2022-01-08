%%
% Author:       Sean Tedesco
% Date:         January 7th, 2022
% Description:  create an AM signal from message and carrier signals 
%%
% clean up
clear all; clf

% support for message signal
T=5; Ts=0.001; t=-T:Ts:T;
y1=ramp(t,2,2); y2=ramp(t,-4,0); y3=ramp(t,3,-2); y4=ramp(t,-1,-3);
y5=unitstep(t,-3);
y=y1+y2+y3+y4-y5;   % message

% AM modulation
x=sin(5*pi*t);      % carrier
z=y.*x;             % modulated signal
sound(100*z,1000)

% plot the original AM signal 
figure(1)
plot(t,z,'k');
hold on
plot(t,y,'r',t,-y,'r'); 
axis([-5 5 -5 5]); grid
hold off
xlabel('t'); ylabel('z(t)'); title('AM signal')

% scaling and shifting
for n=1:2
    if n==1
        gamma=2.5; sht=3;
        [z1,t1,t2] = scale_shift(z,gamma,sht,T,Ts); % compression, delay
        
        figure(2)
        subplot(131)
        plot(t,z); axis([-T T 1.1*min(z) 1.1*max(z)]); grid
        xlabel('t'); ylabel('z(t)'); title('Original AM signal')
        hold on
        
        subplot(132)
        plot(t1,z1);grid; axis([-T T 1.1*min(z1) 1.1*max(z1)])
        xlabel('t'); ylabel('z(2.5t)')
        hold on
        
        subplot(133)
        plot(t2,z1);grid; axis([-T T 1.1*min(z1) 1.1*max(z1)])
        xlabel('t'); ylabel('z(2.5t-3)')
        hold off
        
    else
        gamma=.35; sht=-2;
        [z1,t1,t2]=scale_shift(z,gamma,sht,T,Ts); % expansion, advance
        
        figure(3)
        subplot(131)
        plot(t,z); axis([-T T 1.1*min(z) 1.1*max(z)]); grid
        xlabel('t'); ylabel('z(t)'); title('Original AM signal')
        hold on
        
        subplot(132)
        plot(t1,z1);grid; axis([-T T 1.1*min(z1) 1.1*max(z1)])
        xlabel('t'); ylabel('z(.35t)')
        hold on
        
        subplot(133)
        plot(t2,z1);grid; axis([-T T 1.1*min(z1) 1.1*max(z1)])
        xlabel('t'); ylabel('z(.35t+2)')
        hold off
    end
end