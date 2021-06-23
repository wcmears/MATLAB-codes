function freq_time(filename,fs)
    signal = audioread(filename); %read in signal
    signal = signal(:,1);%convert to mono if necessary
    fft_size = 4096;
    j = 1;
    for i = 1 : fft_size : length(signal)-fft_size %iterate through each frame
        spectrum = fft( signal( i : i + fft_size), fft_size); %set spectrum to change each iteration
        f = (0:fft_size/2-1)*fs/fft_size;%create frequency vector
        z = abs(spectrum(1:fft_size/2));%obtain amplitudes of each frequency for sample size
        threshold = max(abs(spectrum(1:fft_size/2)))*.01; %set peak threshold
        indices = 0;
        %iterate through to have count of peaks, used to create vector for
        %holding frequency values
        for i = 2 : 1 : length(z)-1
            if z(i) > z(i-1) && z(i) > z(i+1)
                if z(i)-z(i-1) > threshold
                indices = indices + 1;
                end
            end
        end
        %put frequencies in list
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
        %find differences of the frequencies
        fr_diff_list = zeros(index-2,1);
        ind = numel(fr_list)-1;
        for n = 1 : 1 : ind
           fr_diff_list(n) = fr_list(n+1)-fr_list(n);
        end
        %obtain frequency estimate for each frame and add to list
        frequency_estimate = mode(fr_diff_list);
        list(j) = frequency_estimate;
        j = j + 1; 
    end
    %median filter on list to smooth transitions
    for i = 1 : 1 : numel(list)-10
        list(i) = median(list(i:i+10));
    end
    for i = numel(list)-10 : 1 : numel(list)
        list(i) = median(list(i-10:i));
    end
    j = 1;
    k = 1;
    %iterate through list elements to calculate start times and midi
    %numbers
    for i = 1 : 1 : numel(list)-1
        if list(i) == list(i+1)
            j = j + 1;
            %if last two elements of the list are the same:
            if i == numel(list)-1
                %only include frequencies between C3 and C5, and 0. Not sure if we
                %had to do this for this part, but it could easily be
                %removed to obtain all frequencies
                if list(i)>130.81 && list(i)<524.25 || list(i) == 0
                    %obtains midi number and onset/offset
                    if list(i) ~= 0
                        %set onset to 0 if its first note
                        if k == 1
                            notes(k,1) = round(12*log2(list(i)/27.5))+21;
                            notes(k,2) = 0;
                            notes(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                        else
                            notes(k,1) = round(12*log2(list(i)/27.5))+21;
                            notes(k,2) = notes(k-1,3)+notes(k-1,2);
                            notes(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                        end
                    %if note is 0
                    else
                        if k == 1
                            notes(k,1) = list(i);
                            notes(k,2) = 0;
                            notes(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                        else
                            notes(k,1) = list(i);
                            notes(k,2) = notes(k-1,3)+notes(k-1,2);
                            notes(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                        end
                    end
                end
            end
        else
            if list(i)>130.81 && list(i)<524.25 || list(i) == 0
                if list(i) ~= 0
                    if k == 1
                            notes(k,1) = round(12*log2(list(i)/27.5))+21;
                            notes(k,2) = 0;
                            notes(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                        else
                            notes(k,1) = round(12*log2(list(i)/27.5))+21;
                            notes(k,2) = notes(k-1,3)+notes(k-1,2);
                            notes(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                    end
                else
                    if k == 1
                            notes(k,1) = list(i);
                            notes(k,2) = 0;
                            notes(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                        else
                            notes(k,1) = list(i);
                            notes(k,2) = notes(k-1,3)+notes(k-1,2);
                            notes(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                    end
                end
            end
        end
    end
    %Second method implemented
    j = 1;
    %iterate through frames
    for i = 1 : fft_size : numel(signal)-fft_size
        %change spectrum every frame
        spectrum = fft( signal(i:i+fft_size), fft_size);
        f = (0:fft_size/2-1)*fs/fft_size;
        z = abs(spectrum(1:fft_size/2));
        %only focus on C3-C5. Again, not sure if we were supposed to do
        %this for this part but the range can be changed easily
        b = f((f > 130.81) & (f < 524.25));
        %reset coorelation vector
        corr = zeros( 1, numel(z) );
        %make mock vectors at each bin and test coorelation to the actual
        %frequency of the frame
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
        listTwo(j) = ff;
        j = j + 1;
    end
    %use median filter on list of frequencies obtained over multiple
    %sampled
    for i = 1 : 1 : numel(listTwo)-10
        listTwo(i) = median(listTwo(i:i+10));
    end
    for i = numel(listTwo)-10 : 1 : numel(listTwo)
        listTwo(i) = median(listTwo(i-10:i));
    end
    j = 1;
    k = 1;
    %Use same method implemented in part one of this code to convert
    %frequencies to midi numbers, find onsets, and find duration
    for i = 1 : 1 : numel(listTwo)-1
        if listTwo(i) == listTwo(i+1)
            j = j + 1;
            if i == numel(listTwo)-1
                if listTwo(i)>130.81 && listTwo(i)<524.25 || listTwo(i) == 0
                    if listTwo(i) ~= 0
                        if k == 1
                            notesTwo(k,1) = round(12*log2(list(i)/27.5))+21;
                            notesTwo(k,2) = 0;
                            notesTwo(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                        else
                            notesTwo(k,1) = round(12*log2(list(i)/27.5))+21;
                            notesTwo(k,2) = notesTwo(k-1,3)+notesTwo(k-1,2);
                            notesTwo(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                        end
                    else
                        if k == 1
                            notesTwo(k,1) = listTwo(i);
                            notesTwo(k,2) = 0;
                            notesTwo(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                        else
                            notesTwo(k,1) = listTwo(i);
                            notesTwo(k,2) = notesTwo(k-1,3)+notesTwo(k-1,2);
                            notesTwo(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                        end
                    end
                end
            end
        else
            if listTwo(i)>130.81 && listTwo(i)<524.25 || listTwo(i) == 0
                if listTwo(i) ~= 0
                     if k == 1
                            notesTwo(k,1) = round(12*log2(list(i)/27.5))+21;
                            notesTwo(k,2) = 0;
                            notesTwo(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                     else
                            notesTwo(k,1) = round(12*log2(list(i)/27.5))+21;
                            notesTwo(k,2) = notesTwo(k-1,3)+notesTwo(k-1,2);
                            notesTwo(k,3) = (j*fft_size)/fs;
                            k = k + 1;
                            j = 1;
                     end
                else
                    if k == 1
                          notesTwo(k,1) = listTwo(i);
                          notesTwo(k,2) = 0;
                          notesTwo(k,3) = (j*fft_size)/fs;
                          k = k + 1;
                          j = 1;
                    else
                          notesTwo(k,1) = listTwo(i);
                          notesTwo(k,2) = notesTwo(k-1,3)+notesTwo(k-1,2);
                          notesTwo(k,3) = (j*fft_size)/fs;
                          k = k + 1;
                          j = 1;
                    end
                end
            end
        end
    end
    notes = [ notes ; notesTwo ];
                
  