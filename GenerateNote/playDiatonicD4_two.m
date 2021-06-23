function playDiatonicD4_two()
    f = 293.67;
    fs = 44100;
    x = generate_note_two( f, 1.5, fs, 0);
    a = 1/8*fs;
    b = zeros(round(a),1);
    for i = 1 : 1 : 7
        if i == 1 || i == 2 || i == 4 || i == 5 || i == 6
            f = f*1.1224;
            c = generate_note_two( f, 1.5, fs, 0);
            x = [ x ; b ; c ];
        else
            f = f*1.0594;
            c = generate_note_two( f, 1.5, fs, 0);
            x = [ x ; b ; c ];
        end
    end
    soundsc(x, fs)