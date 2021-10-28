Fs1 = 1000; % Sample rate (Hz)

% Create deterministic and stochastic digital data streams
n = 0:1/Fs1:100-(1/Fs1);                % Time index vector
sin_wave = sin(5*n*2*pi);               % Generation of sinusoidal
                                        % signal
random = 2*round(rand(1,length(n)))-1;  % Random string of +1 and
                                        % -1 values
                                        
% Create lowpass filter and apply it to both data streams
  % b = firls(n,f,a),
  % n is the FIR filter order
  % f is a vector of pairs of frequency points,
  % a is a vector containing the desired amplitude at the points in f
% FIR filter
taps = 1; 
coeffs1 = firls(taps,[0 0.2 0.22 1],[1 1 0 0]);

% coefficients
sin_bwlimited = filter(coeffs1,1,sin_wave);
random_bwlimited = filter(coeffs1,1,random);

% plot 
plot(sin_wave)
plot(random)
plot(sin_bwlimited)
plot(random_bwlimited)
