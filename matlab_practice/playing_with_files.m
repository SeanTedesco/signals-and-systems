%%
% Author:       Sean Tedesco
% Date:         December 31st, 2021
% Description:  Example script of how to save/load files of a generated 
%               signal in MATLAB
%%

% clean up
clear all; clf

% produce a set of angles
% angles from 0 to 360 degrees in intervals of 3 degrees
theta = 0:3:360;                

% populates a table of sin values, given these angles 
thetay = sintable(theta);
save sine.mat thetay; 

% load the table back in
load sine; 
whos

% plot the figure
figure(1); 
x=thetay(:,1);
y=thetay(:,2);
stem(x,y)

function xy= sintable(theta)
    % Brief:    This function generates sine values of input theta
    % theta:    angle in degrees, converted into radians
    % xy:       array with values for theta and y
    y = sin(theta*pi/180);      % sine computes the argument in radians
    xy=[theta' y'];             % array with 2 columns: theta' and y’
end