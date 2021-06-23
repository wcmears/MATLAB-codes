function P1
% resynthesis_2.m
% Demonstrates synthesis of a sinusoid using phase information
% Does not perform resynthesis (no analysis of an input signal)
% simple case : one sinusoidal track, varying amplitude, varying frequency

fs = 22050;
duration = 5;  % in seconds
signal_length = fs * duration;
t = 0:1/fs:duration-1/fs;

% ---------------- PREPARE f and a ------------------ 
    % frequency evolution over time: linear increaase
    % from 300 to 400 Hz in 'duration' seconds
f(1:signal_length) = 300+sin(2*pi*t*3)*14;

    % amplitude evolution over time: linear increaase
    % from 0 to 1 and back to 0 in 'duration' seconds
a = [ (signal_length/2:-1:1) (1:signal_length/2) ];
a = (( a / (signal_length/2))*-1)+1;

% ---------------- DISPLAY f and a ------------------
figure(1);
subplot(2,1,1);
plot( t, f, 'linewidth', 2 );
ylabel( 'Frequency (Hz)' );
xlabel( 'Time (seconds)');
axis( [0, max(t), 0, max(f)*1.2] );

subplot(2,1,2);
plot( t, a, 'linewidth', 2 );
ylabel( 'Amplitude' );
xlabel( 'Time (seconds)');
axis( [0, max(t), 0, max(a)*1.2] );

% ---------------- SYNTHESIZE -----------------------
    % construct phase information from frequency; assume initial phase is zero
phase = zeros( 1, length(f));
for i=2:length( phase )
    phase( i ) = phase( i-1 ) + 2 * pi * (1/fs) * f(i);
end    

    % construct signal
x = zeros( 1, length(phase) );
for i = 1: length( phase )    
    x(i) = a(i) * sin( phase( i )); 
end

soundsc( x, fs );
