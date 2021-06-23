function find_fund_temp(filename,fs)
    fft_size = 4096;
    signal = audioread(filename);
    spectrum = fft( signal(numel(signal)/4:(numel(signal)/4)+fft_size), fft_size);
    f = (0:fft_size/2-1)*fs/fft_size;
    figure(1);
    z = abs(spectrum(1:fft_size/2));
    bar(f, z);
    xlabel('Frequency (Hz.)');
    ylabel('Amplitude');
    b = f((f > 130.81) & (f < 524.25));
    corr = zeros( 1, numel(z) );
    for bin = 1 : 1 : numel(b)
        template = zeros(1,numel(z));
        template(bin) = 1/bin;
        for h = 1 : bin
            template(bin*h) = 1/h;
        end
        a=corrcoef( z, template);
        corr(bin) = a(1,2);
    end
    [v, maxcorr_idx] = max( corr);
    ff = f(maxcorr_idx);
    note = generate_note_two(ff, 2, fs, h);
    j = [signal(:,1) ; note ];
    soundsc(j,fs);