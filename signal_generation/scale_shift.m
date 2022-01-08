function [z3,t1,t2]=scale_shift (z,scale,shift,T,Ts)
% performs scale and shift of digitized signal
%   scale:  positive real with two decimal
%   shf:    positive real
%   [-T T]: range of signal
%   Ts:     sampling period
%
%   z3:     resampled signal
%   t1:     supported time of signal (compressed or expanded)  
%   t2:     supported time of signal with shift (compressed or expanded)
    
    beta1 = 100;
    alpha1 = round(scale, 2)*beta1;
    g = gcd(beta1, alpha1);
    beta = beta1/g;
    alpha = alpha1/g;

    z1 = interp(z,beta);
    z2 = decimate(z1,alpha);
    t1 = -T/scale:Ts:T/scale;
    M = length(t1);
    z3 = z2(1:M);
    t2 = t1+shift;
end

