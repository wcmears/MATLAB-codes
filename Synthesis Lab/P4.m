function P4
freq_low = 200; % Hz
freq_hi = 1000; %Hz
freq_low_two = -1000; % Hz, this over duration gives the smallest possible slope of f
freq_hi_two = 1000;% Hz, this over duration gives the highest possible slope of f
freq_mod_rate_low = 0; % Hz
freq_mod_rate_hi = 10; 
freq_mod_depth_low = 0; % range of modulation 
freq_mod_depth_hi = 10;
amp_low = 25; % relative amplitude in range 0 -1
amp_hi = 100;
amp_low_two = -100; % slope max/min for amp
amp_hi_two = 100;
fs = 22050;
duration = 4;  % in seconds
signal_length = fs * duration;
t = 0:1/fs:duration-1/fs;
N = 25;
% ---------------- PREPARE f and a ------------------ 
f = zeros( N, signal_length );
a = zeros( N, signal_length );
for n = 1 : N
       %Randomize values for all required components, make while loop to
       %reset values if the final frequency ends up being more than 1000 or
       %less than 0
       x = randi([freq_low freq_hi]);
       y = randi([freq_low_two freq_hi_two]);
       b = randi([freq_mod_rate_low freq_mod_rate_hi]);
       c = randi([freq_mod_depth_low freq_mod_depth_hi]);
       while x+y < 0 || x+y > 1000
           x = randi([freq_low, freq_hi]);
           y = randi([freq_low_two, freq_hi_two]);
       end
       f(n, :) = ((x+sin(2*pi*t*b)*c) + (y * (1:signal_length)/ signal_length));
       %Randomize values for all required components, make while loop to
       %reset values if the final frequency ends up being more than 100 or
       %less than 0, had to multiply values by 100 and divide in the end
       %because randi only takes integers
       z = randi([amp_low amp_hi]);
       j = randi([amp_low_two amp_hi_two]);
       while z+j < 25 || z+j > 100
           z = randi([amp_low amp_hi]);
           j = randi([amp_low_two amp_hi_two]);
       end
       a(n, :) = (z + j * (1:signal_length)/ signal_length)/100;
end

% ---------------- DISPLAY f and a ------------------
figure(1);
subplot(2,1,1);
plot(t, f, 'linewidth', 1);
ylabel( 'Frequency (Hz)' );
xlabel( 'Time (seconds)');
axis( [0, max(t), 0, max(max(f))*1.2] );

subplot(2,1,2);
plot( t, a, 'linewidth', 1 );
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