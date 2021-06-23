[x, fs] = audioread( 'one_track.wav');

fft_size = 1024*4;
noverlap = floor(fft_size/1.1);
[S, F, T] = spectrogram( x, hanning(fft_size), noverlap, fft_size, fs );
S = abs(S);

f = zeros( 1, length(T));  % for recording frequency
a = zeros( 1, length(T));  % for recording amplitude
t = zeros( 1, length(T));  % for recording time
t = T;
for i = 1 : length( T )
    [v, index] = max( S(:, i) );
    f(i) = F(index);
    a(i) = S(index,i);
end

dur_mul = 2;
hop = (length(x)/length(f))/fs;
N = 5;

f_sample = interp( f, round(length(x)/length(f)) )';

for n = 1 : 1 : N
    f_sampleTwo = f_sample*n;
    f_sample = f_sample + f_sampleTwo;
end

phase = zeros( 1, length(f_sample));
for i=2:length( phase )
    phase( i ) = phase( i-1 ) + 2 * pi * (1/fs) * f_sample(i);
end    

    % construct signal
y = zeros( 1, length(phase) );
for i = 1: length( phase )   
    y(i) = sin( phase( i )); 
end

    % --- PLAY original and resynthesis back to back
sound(x, fs);                   % play original
pause(length(x)/fs + 0.5);      % wait half second longer than the original sound
sound(y, fs);                   % play resynthesis