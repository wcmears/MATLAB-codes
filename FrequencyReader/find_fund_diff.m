function find_fund_diff(filename,fs) %input filename and samples per second
    fft_size = 4096; #set fft samples per estimate
    signal = audioread(filename); #read in signal
    spectrum = fft( signal(numel(signal)/4:(numel(signal)/4)+fft_size), fft_size); #take spectrum of signal
    f = (0:fft_size/2-1)*fs/fft_size; #calculate array of frequency samples
    figure(1); #show signal
    z = abs(spectrum(1:fft_size/2)); #take fft
    bar(f, z); #show fft
    xlabel('Frequency (Hz.)');
    ylabel('Amplitude');
    threshold = max(abs(spectrum(1:fft_size/2)))*.01; #set threshold so minimal peaks are not counted
    indices = 0;
     j = 0;
     u = 0;
    for i = 1 : 1 : numel(f)
        j = j + 1;
        if f(i) > 130.81
            break;
        end
    end
     for i = 1 : 1 : numel(f)
        if f(i) > 524.25
            break;
        end
        u = u + 1;
    end
    for i = j : 1 : z
        if z(i) > z(i-1) && z(i) > z(i+1)
            if z(i)-z(i-1) > threshold
              indices = indices + 1;
            end
        end
    end
    fr_list = zeros(indices,1);
    index = 1;
    for i = 2 : 1 : numel(z)-1
        if z(i) > z(i-1) && z(i) > z(i+1)
            if z(i)-z(i-1) > threshold
              fr_list(index) = f(i);
              index = index + 1;
            end
        end
    end
    fr_diff_list = zeros(indices-1,1);
    ind = numel(fr_list)-1;
    for n = 1 : 1 : ind
        fr_diff_list(n) = fr_list(n+1)-fr_list(n);
    end
    frequency_estimate = mode(fr_diff_list);
    note = generate_note_two(frequency_estimate, 2, fs, indices);
    j = [signal(:,1) ; note ];
    soundsc(j,fs);

    
