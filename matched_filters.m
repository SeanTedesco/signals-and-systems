%sig01e05.m
% Correlation/Convolution and Matched Filter
clear, clf

M=50; Ts=1/M;

x1=ones(M,1)*[1 1]; x1=x1(:).'; Nx=length(x1);
x2=ones(M,1)*[1 -1]; x2=x2(:).';
g1=fliplr(x1); g2=fliplr(x2);

x=[x1 zeros(1,M) x2 zeros(1,M) x1 zeros(1,M) x2]; % signal to transmit
length x=length(x); Nbuffer= min(M*11,length(x)); tt=[0:Nbuffer-1]*Ts;
%Noise_amp=0.3; x = x + Noise_amp*randn(1,length(x));
xbuffer=zeros(1,Nbuffer); ybuffer=zeros(2,Nbuffer);

for n=1:length(x)
    xbuffer= [x(n) xbuffer(1:end-1)];
    y = [g1; g2]*xbuffer(1:Nx).'*Ts; ybuffer= [ybuffer(:,2:end) y];
    subplot(4,2,[5,6]), plot(tt,ybuffer(1,:)), subplot(4,2,[7,8]), plot(tt,ybuffer(2,:))
    subplot(4,2,[3,4]), hold on, plot(x)
    subplot(4,2,2), hold on, plot(x2)
    subplot(4,2,1), hold on, plot(x1)
    pause(0.01), if n<length(x), clf; end
end

y1=xcorr(x,x1)*Ts; y1=y1([end-Nbuffer+1:end]-Nx); %correlation delayed by Nx
y2=xcorr(x,x2)*Ts; y2=y2([end-Nbuffer+1:end]-Nx);

subplot(4,2,1), hold on, plot(x1)
subplot(4,2,2), hold on, plot(x2)
subplot(4,2,[3,4]), hold on, plot(x)
subplot(4,2,[5,6]), hold on,plot(tt,y1,'m') % only for cross-check
subplot(4,2,[7,8]), hold on, plot(tt,y2,'m')
