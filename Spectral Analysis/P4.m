function P4 ()
    fft_size = 1024;
    [x, fs] = audioread('find_onsets.wav');
    p = 1;
    z = zeros(round(fs*.1), 1);
    for i = 1 : 1 : numel(x)
        x(i) = 20*log10(abs(x(i)));
    end
    while p < numel(x)
        if x(p) > -20
            disp(p/fs);
            j = p;
            for n = 1 : 1 : numel(z)
                z(n) = x(j);
                j = j + 1;
            end
            TF = isinf(z);
            for u = 1 : 1 : numel(z)
                if TF(u) == 1
                    z(u) = 0;
                end
            end
            fft_size = 1024;
            y = fft( z(1:fft_size), fft_size);
            f = (0:fft_size/2-1)*fs/fft_size;%x axis
            q = abs(y(1:fft_size/2)); %y axis
            V = sum(q)/numel(q);
            if V > 250
                disp('Hihat')
            else
                disp('Kick')
            end
            p = j;
        else
            p = p + 1;
        end
    end