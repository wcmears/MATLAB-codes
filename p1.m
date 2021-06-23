function p1 
    [music_audio, fs] = audioread('Benny_Blanco_Better_to_Lie_short.wav');
    %Writes sound file to vector music_audio
    [hihat, fs] = audioread('hihat4.wav');
    %Writes sound file to vector hihat
    hihat_mix = music_audio.*0;
    % creates an empty sound vector the same size as music_audio

    t = 6.22575; % Sets the initial time for hihats to be added
    inter_hihat_time = .19275; %Sets time inbetween each hihat
    for i = floor(t*fs) : floor(inter_hihat_time*fs) : numel(hihat_mix)-length(hihat)
        %for loop iterates through the start time to the end of the
        %vector, adding hihats at the same rate as they are heard in
        %music_audio
        n = i;
        %element of hihat_mix being changed
        j = 1;
        %element of hihat being added to element of of hihat_mix
        while j < numel(hihat)
            %individually adds every element of hihat to whichever element
            %of hihat_mix is appropriatte. 
            hihat_mix(n) = hihat_mix(n) + hihat(j);
            %line that adds element
            j = j + 1;
            %goes to the next element of hihat. Due to the while loop,
            %code will stop when every element of hihat has been added
            n = n+1;
            %increases element of hihat_mix(the element being added to),
            %n is reset to be equivalent to i after the while loop breaks,
            %as the incrementation of the mix element has already been set
            %to the start to start time of the hithat
        end
    end
    
   mix = [music_audio(:), hihat_mix(:)];
   %Writes music_audio to the left and hihat_mix to the right
   audiowrite('p1.wav', mix, fs);

