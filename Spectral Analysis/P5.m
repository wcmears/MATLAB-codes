% finding frequency and amplitude variation using the spectrogram function
function P5

[x, fs] = audioread( 'tones_noise.wav');

fft_size = 1024;
noverlap = floor(fft_size/1.1);
[S, F, T] = spectrogram( x, hanning(fft_size), noverlap, fft_size, fs );
S = abs(S);

figure(1);
imagesc( S.^0.5 );
set(gca, 'YDir', 'normal' );  % make the y axis run bottom up

f = zeros( 1, length(T));  % for recording frequency
a = zeros( 1, length(T));  % for recording amplitude
t = zeros( 1, length(T));  % for recording time
t = T;
for i = 1 : length( T )
    [v, index] = max( S(:, i) );
    f(i) = F(index);
    a(i) = S(index,i);
end

figure(2);
plot( t, f);
xlabel('Time');
ylabel('Frequency');

a = 0;
for n = 1 : 1 : numel(f)
    if f(n) > 400
        a = a + 1;
    end
end

Q = sum(S);
figure(3);
plot( t, Q);
xlabel('Time');
ylabel('Sum of Frequency');

S = var(S);
figure(4);
plot( t, S);
xlabel('Time');
ylabel('Variance of Frequency');

disp(a/numel(f)); %Percent of function that is noise

b = 0;
for n = 1 : 1 : numel(S)
    if S(n) < 10
        b = b + 1;
    end
end

disp(b/numel(S));