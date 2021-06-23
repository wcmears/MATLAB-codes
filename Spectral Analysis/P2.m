% demonstrates use of the FFT function
% Author : Izmirli

function fft_1

fs = 11025;
fft_size = 512*2*2*2;  % N
%Bin with max amplitude: x = 560, y = 46.7
%Bin frequencies:  512: 538.3hZ 1024: 538.3hZ 2048: 543.7hZ 4096: 541.0hZ
%8192: 542.4hZ
%Bin Spacing: 512: 21hZ 1024: 11hZ 2048: 5.5hZ 4096: 2.5hZ
%8192: 1.2hZ
%Audition Frequency: 542hZ
%It seems as if a greater fft length results in a more accurate frequency
%estimate.
x = audioread('single_sine.wav');% create signal
    
y = fft( x(1:fft_size), fft_size); % take the FFT
    
f = (0:fft_size/2-1)*fs/fft_size; % create a vector of frequency values

% plot the amplitude spectrum up to fs/2
figure(1);
bar( f, abs(y(1:fft_size/2)) );
xlabel('Frequency (Hz.)');
ylabel('Amplitude');
