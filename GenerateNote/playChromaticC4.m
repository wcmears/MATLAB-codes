function playChromaticC4()
    f = 261.63;
    fs = 44100;
    x = generate_note_two( f, 1.5, fs, 0);
    a = 1/8*fs;
    b = zeros(round(a),1);
    for i = 0 : 1 : 10
        f = f*1.0594;
        c = generate_note_two( f, 1.5, fs, 0);
        x = [ x ; b ; c ];
    end
    soundsc(x, fs)