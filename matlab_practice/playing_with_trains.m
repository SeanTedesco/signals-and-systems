%%
% Author:       Sean Tedesco
% Date:         December 31st, 2021
% Description:  Example of loading MATLAB's built-in audio files and 
%               plotting them in 'continuous' and discrete time domain. 
%%

% clean up
clear all; clf

% perform the import / load
load train;
whos;

% play the sound
sound(y,Fs);

% plot the audio signal in the continuous time domain. 
t = 0:1/Fs:(length(y)-1)/Fs;
figure(1); 
plot(t,y); grid
ylabel('y[n]'); 
xlabel('n');
title('continuous time audio train signal')

% plot the sampled audio signal in the discrete time domain. 
figure(2);
n=100:299;
stem(n,y(100:299)); 
ylabel('y[n]');
xlabel('n');
title('Segment of train signal')
axis([100 299 -1.1 1.1])





