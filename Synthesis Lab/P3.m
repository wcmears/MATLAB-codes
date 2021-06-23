function P3
% resynthesis_4.m
% Demonstrates synthesis of N sinusoids using phase information
% Does not perform resynthesis (no analysis of an input signal)
% General case: N sinusoidal tracks, varying amplitude, varying frequency

fs = 22050;
duration = 4;  % in seconds
signal_length = fs * duration;
t = 0:1/fs:duration-1/fs;
N = 20;  % 20 harmonics

% ---------------- PREPARE f and a ------------------ 
f = zeros( N, signal_length );
a = zeros( N, signal_length );
    % frequency evolution over time. N harmonics with fundamental
    % from 200 to 300  in 'duration' seconds
for n = 1 : N
       f(n, :) = n * (300+sin(2*pi*t*5).*(15*(1:signal_length)/ signal_length));
            % higher harmonics decay faster
       a(n, :) = exp( -(3*n) * (1:signal_length)/ signal_length);
end

% ---------------- DISPLAY f and a ------------------
figure(1);
subplot(2,1,1);
plot(t, f, 'linewidth', 2);
ylabel( 'Frequency (Hz)' );
xlabel( 'Time (seconds)');
axis( [0, max(t), 0, max(max(f))*1.2] );

subplot(2,1,2);
plot( t, a, 'linewidth', 2 );
ylabel( 'Amplitude' );
xlabel( 'Time (seconds)');
axis( [0, max(t), 0, max(max(a))] );

% ---------------- SYNTHESIZE -----------------------
phase = zeros( N, signal_length);
for n = 1 : N   
    for i=2: signal_length
        phase(n, i) = phase(n, i-1) + 2 * pi * (1/fs) * f(n, i);
    end    
end

    % construct signal by summing the outputs of the oscillators
x = zeros( 1, signal_length );
for n = 1 : N  
    for i = 1: signal_length    
        x(i) = x(i) + a(n, i) * sin( phase(n, i )); 
    end 
end

soundsc( x, fs );