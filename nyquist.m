Fs = 1000; % Sample rate (Hz)
Fa = 1105; % Input Frequency (Hz)

% Determine Nyquist zones
zone = 1 + floor(Fa / (Fs/2));
alias = mod(Fa, Fs);

if ˜mod(zone,2) % 2nd, 4th, 6th, ... Nyquist Zone
  % Its not really a negative amplitude, but it is 180 degrees out
  % of phase, which makes it harder to see on the time domain side,
  % so we cheat to make the graphs look better.
  alias = -(Fs - alias)/Fs;
else % 3rd, 5th, 7th, ... Nyquist Zone
  alias = (alias)/Fs;
end

% Create the analog/time domain and digital sampling vectors
N = 2*1/abs(alias) + 1; % Number of Digital samples
points = 256; % Analog points between digital samples
analogIndexes = 0:1/points:N-1;
samplingIndexes = 1:points:length(analogIndexes);
wave = sin(2*pi*Fa/Fs*analogIndexes);
plot(wave)
