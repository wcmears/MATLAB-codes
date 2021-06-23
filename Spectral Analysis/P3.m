function P3 ()
    fs = 11025;
    fft_size = 512;
    a = 0;
    x = audioread('multiple_sines3.wav');% create signal
    y = fft( x(1:fft_size), fft_size); % take the FFT
    f = (0:fft_size/2-1)*fs/fft_size; % create a vector of frequency values
    z = abs(y(1:fft_size/2));
    for i = 2 : 1 : numel(z)-1
        if z(i) > z(i-1) && z(i) > z(i+1) && z(i) > 1
            disp(f(i));
        end
    end
    bar( f, abs(y(1:fft_size/2)) );
    xlabel('Frequency (Hz.)');
    ylabel('Amplitude');
    disp(a);